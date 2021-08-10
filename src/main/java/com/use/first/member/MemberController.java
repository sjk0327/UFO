package com.use.first.member;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.rent.RentDAO;
import com.use.first.rent.RentVO;





/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private KakaoAPI kakao;
	
	// 승빈 start

	// 고객
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginG(UserVO user, Model model, HttpSession session) {
		model.addAttribute("user", user);
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		
		if (session.getAttribute("userName") != null) {
			return "home";
		} else {
			return "/enterance/login";
		}
	}

	//UFO 회원 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpSession session) {
		model.addAttribute("user", vo);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		List<RentVO> returnList = rentDAO.returnList();
		List<RentVO> lateList = rentDAO.lateList();

		if (vo.getM_id() == null || vo.getM_id().equals("")) {
			return "/enterance/adminLogin";
		} else if (vo.getM_pw() == null || vo.getM_pw().equals("")) {
			return "/enterance/adminLogin";
		}

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO user = dao.memInfo(vo.getM_id());

		if (user != null && vo.getM_id().equals("admin")) {
			if (vo.getM_id().equals(user.getM_id()) && vo.getM_pw().equals(user.getM_pw())) {
				session.setAttribute("loginPl", "ufo");
				session.setAttribute("userName", user.getM_name());
				session.setAttribute("returnList", returnList);
				session.setAttribute("lateList", lateList);
				// return "/enterance/adminIndex";
				return "redirect:/adminIndex";
			} else {
				return "/enterance/adminLogin";
			}

		} else {
			return "/enterance/adminLogin";
		}
	}

	// 카카오로그인
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLoginG(UserVO user, Model model, HttpSession session, @RequestParam("code") String code) {
		model.addAttribute("user", user);
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			session.setAttribute("loginPl", "kakao");
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("userName", userInfo.get("nickname"));
			session.setAttribute("access_Token", access_Token);
		}

		if (session.getAttribute("userName") != null) {
			return "redirect:/";
		} else {
			return "/enterance/login";
		}
	}


	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 네이버 로그인 
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		if(oauthToken != null) {
			// 1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
			/**
			 * apiResult json 구조 {"resultcode":"00", "message":"success",
			 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			 **/
			
			System.out.println("naver apiResult : " + apiResult);
			// 2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			// 3. 데이터 파싱
			// Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject) jsonObj.get("response");
			// response의 nickname값 파싱
			String email = (String) response_obj.get("email");
			String name = (String) response_obj.get("name");
			System.out.println(name);
			// 4.파싱 닉네임 세션으로 저장
			session.setAttribute("loginPl", "naver");
			session.setAttribute("userId", email); // 세션 생성
			session.setAttribute("userName", name);
			model.addAttribute("result", apiResult);
			return "redirect:/";
		}
		else {
			return "/enterance/login";
		}
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginout(HttpSession session) {
		
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		session.invalidate();

		return "redirect:/";
	}


	// 관리자
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminLoginG(UserVO user, Model model, HttpSession session) {
		model.addAttribute("user", user);
		if (session.getAttribute("userName") != null) {
			if (session.getAttribute("userName").equals("관리자"))
				return "redirect:/adminIndex";
			else
				return "/enterance/adminLogin";
		} else {
			return "/enterance/adminLogin";
		}
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String adminLogin(UserVO vo, Model model, HttpSession session) {
		model.addAttribute("user", vo);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		List<RentVO> returnList = rentDAO.returnList();
		List<RentVO> lateList = rentDAO.lateList();

		if (vo.getM_id() == null || vo.getM_id().equals("")) {
			return "/enterance/adminLogin";
		} else if (vo.getM_pw() == null || vo.getM_pw().equals("")) {
			return "/enterance/adminLogin";
		}

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO user = dao.memInfo(vo.getM_id());

		if (user != null && vo.getM_id().equals("admin")) {
			if (vo.getM_id().equals(user.getM_id()) && vo.getM_pw().equals(user.getM_pw())) {

				session.setAttribute("userName", user.getM_name());
				session.setAttribute("returnList", returnList);
				session.setAttribute("lateList", lateList);
				// return "/enterance/adminIndex";
				return "redirect:/adminIndex";
			} else {
				return "/enterance/adminLogin";
			}

		} else {
			return "/enterance/adminLogin";
		}
	}

	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public String adminLoginout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminIndex(UserVO vo, Model model) {
		model.addAttribute("user", vo);

		return "/enterance/adminIndex";
	}

	@RequestMapping(value = "/admin/mem/memList", method = RequestMethod.GET)
	public String adminMemList(Model model, Criteria cri) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<UserVO> list = dao.memList(cri);
		// 모델에 추가
		model.addAttribute("memList", list);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함

		int totalCount = dao.countMemListTotal(cri) - 1;
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/mem/memList";

	}

	@RequestMapping(value = "/admin/mem/memList", method = RequestMethod.POST)
	public String adminMemListSearch(Criteria cri, Model model) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<UserVO> list = dao.memList(cri);
		System.out.println(list.toString());
		// 모델에 추가
		model.addAttribute("memList", list);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함

		int totalCount = dao.countMemListTotal(cri) - 1;
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/mem/memList";
	}

	// 승빈 end

	// 성훈 start
	@RequestMapping(value = "/admin/mem/memDetail", method = RequestMethod.GET)
	public String adminMenDetail(Model model, @RequestParam String m_id) {
		System.out.println("admin/mem/memDetail // 들어가서 처음");
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO userInfo = dao.memInfo(m_id);

		model.addAttribute("userInfo", userInfo);

		return "/admin/mem/memDetail";
	}

	@RequestMapping(value = "/admin/mem/memDetail/{m_id}", method = RequestMethod.GET)
	public String adminMenDetailByPath(Model model, @PathVariable String m_id) {
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		// User 정보 가져오기
		System.out.println("adminMenDetailByPath() // 들어가서 유저정보");
		UserVO userVO = userDAO.memInfo(m_id);

		// 대여 정보 가져오기

		System.out.println("adminMenDetailByPath() // 들어가서 대여정보");

		List<RentVO> rentList = rentDAO.rentListByMid(m_id, "구매");
		System.out.println("rentList size : " + rentList.size());
		// 구매 정보 가져오기
		System.out.println("adminMenDetailByPath() // 들어가서 구매정보");

		List<RentVO> purchaseList = rentDAO.purchaseListByMid(m_id, "구매");
		System.out.println("purchaseList size : " + purchaseList.size());
		model.addAttribute("userVO", userVO);
		model.addAttribute("rentList", rentList);
		model.addAttribute("purchaseList", purchaseList);

		return "/admin/mem/memDetail";
	}

	@RequestMapping(value = "/admin/mem/memDetail/{userID}", method = RequestMethod.POST)
	public String adminMenUpdateByPath(Model model, UserVO userVO, @PathVariable String userID) throws IOException {
		System.out.println("시작 전" + userVO.toString());
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		// 파일 업로드
		MultipartFile uploadFile = userVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			userVO.setM_img(uploadFile.getOriginalFilename());
			uploadFile.transferTo(new File(
					"C:\\FinalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\UFO\\resources\\Images\\member\\"
							+ userVO.getM_img()));
		}

		int n = dao.memUpdate(userVO);
		System.out.println("시작 후" + userVO.toString());
		if (n != 1) {
			// 업데이트 실패 시
			System.out.println("adminMenUpdateByPath // member 수정 실패 // " + userVO.toString());
		}

		return "redirect:/admin/mem/memDetail/" + userID;
	}
	
	
	// 8/10 : 성훈 추가
	
    @RequestMapping(value = "/member/mem/memJoin", method = RequestMethod.GET)
    public String menJoin(Model model){
      
       return "/member/mem/memJoin";
    }
	
    @ResponseBody
    @RequestMapping(value = "/member/mem/idCheck", method = RequestMethod.POST , produces="application/json")
    public Map<Object, Object> menIdCheck(Model model, @RequestBody String m_id) throws Exception{
    	System.out.println("ajax 호출 / memIdCheck");
    	UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	int result = dao.duplicateCheckId(m_id);
    	
    	map.put("check", result);
    	
    	return map;
    }
	
    @Autowired
    private JavaMailSender javaMailSender;
    
    @ResponseBody
    @RequestMapping(value = "/member/mem/memEmailCheck", method = RequestMethod.POST , produces="application/json")
    public String menEmailCheck(Model model, @RequestBody String m_email){
    	System.out.println("ajax 호출 / menEmailCheck");

    	//인증 번호 생성기
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
    	
    	SimpleMailMessage message = new SimpleMailMessage();
    	message.setTo(m_email);
    	message.setSubject("[UFO] 회원가입을 위한 인증번호 발송");
    	message.setText("인증번호 : " + AuthenticationKey);
    	javaMailSender.send(message);
    	
    	return AuthenticationKey;
    	
    }
	// 성훈 end

}
