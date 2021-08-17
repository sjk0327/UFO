package com.use.first.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import com.use.first.buy.BuyVO;
import com.use.first.message.MessageDAO;
import com.use.first.message.MessageVO;
import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.rent.CartVO;
import com.use.first.rent.RentDAO;
import com.use.first.rent.RentVO;
import com.use.first.rent.WishListVO;

/**
 *  8.12일  성훈 수정 - 성훈 start 밑에는 이걸 우선으로 통합
 *  승빈 start 부분은 로그인 로그아웃 쪽은 성훈이 수정했음
 *  아마 승빈은 고객쪽 내정보 보기 userInfo 쪽을 오늘 했었음
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

	// UFO 회원 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpSession session) {
		model.addAttribute("user", vo);
		
		//08월 13일 김수정 : 회원로그인 부분은 반환요청리스트, 연체 리스트 필요없어서 일단 주석처리. 확인할 것
//		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
//		List<RentVO> returnList = rentDAO.returnList();
//		List<RentVO> lateList = rentDAO.lateList();

		if (vo.getM_id() == null || vo.getM_id().equals("")) {
			return "redirect:/login";
		} else if (vo.getM_pw() == null || vo.getM_pw().equals("")) {
			return "redirect:/login";
		}

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO user = dao.memInfo(vo.getM_id());

		if (user != null ) {
			if (vo.getM_id().equals(user.getM_id()) && vo.getM_pw().equals(user.getM_pw())) {
				session.setAttribute("loginPl", "ufo");
				UserInfoVO infoVO = new UserInfoVO(user.getM_id(), user.getM_name());
				session.setAttribute("userInfo", infoVO);
				//session.setAttribute("userId", user.getM_id());
				//session.setAttribute("userName", user.getM_name());
//				session.setAttribute("returnList", returnList);
//				session.setAttribute("lateList", lateList);
				
				return "redirect:/";
			} else {
				return "redirect:/login";
			}

		} else {
			
			return "redirect:/login";
		}
	}

	// 카카오로그인
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLoginG(UserVO user, Model model, HttpSession session, @RequestParam("code") String code, HttpServletResponse response) throws IOException{
		model.addAttribute("user", user);
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		System.out.println("dao.duplicateCheckId(\"email\")::::" + dao.duplicateCheckId("email"));
		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		String id = "";
		if (userInfo.get("email") != null && !userInfo.get("email").equals("")) {
			System.out.println("kakaoLoginG if문 in!!!!");
			String email = (String) userInfo.get("email");
			String[] devid = email.split("@");
			id = "kakao " + devid[0];

			session.setAttribute("loginPl", "kakao");
			UserInfoVO infoVO = new UserInfoVO(id, userInfo.get("nickname").toString());
			session.setAttribute("userInfo", infoVO);
			int b = email.indexOf("@");
			int e = email.indexOf(".");
			if(b > 0 && e > 0)
				email = email.substring(b+1, e);
			System.out.println("email cutting : " + email);
			String gender = userInfo.get("gender").toString();
		
			if (dao.duplicateCheckId(id) > 0) {
				return "redirect:/";
			} else {
				return "redirect:/kakaoJoin/"+email+"/"+gender;
			}
		}else {
			System.out.println("kakaoLoginG else문 in!!!!");
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('선택사항을 동의해주세요'); location.href='redirect:/login'; </script>");
			out.flush();
			return null;
		}
	}

	@RequestMapping(value = "/kakaoReject", method = RequestMethod.GET)
	public String kakaoRejectG(HttpServletResponse response) throws IOException{
		return "";
	}
	@RequestMapping(value = "/kakaoReject", method = RequestMethod.POST)
	public String kakaoRejectP(HttpServletResponse response) throws IOException{
		return "";
	}
	// 카카오 회원가입
	@RequestMapping(value = "/kakaoJoin/{email}/{gender}", method = RequestMethod.GET)
	public String kakaoJoin(UserVO user, Model model, HttpSession session,@PathVariable String email, @PathVariable String gender) {

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		user.setM_id(infoVO.getM_id());
		user.setM_name(infoVO.getM_name());
		if(email.equals("naver")) email = infoVO.getM_id().split(" ")[1] +"@naver.com";
		else if(email.equals("daum")) email = infoVO.getM_id().split(" ")[1] +"@daum.net";
		else if(email.equals("hanmail")) email = infoVO.getM_id().split(" ")[1] +"@hanmail.net";
		else if(email.equals("gmail")) email = infoVO.getM_id().split(" ")[1] +"@gmail.net";
		else email = "동의안함";
		user.setM_email(email);
		if(gender.equals("M") || gender.equals("male")) gender = "남자";
		else if(gender.equals("F") || gender.equals("female")) gender = "여자";
		else gender = "선택안함";
		user.setM_gender(gender);

		int n = dao.kakaoJoin(user);

		if (n == 0) {
			System.out.println("등록 실패");
		}

		return "redirect:/";

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
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		if (oauthToken != null) {
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
			String gender = (String) response_obj.get("gender");
			String mobile = (String) response_obj.get("mobile");
			// 4.파싱 닉네임 세션으로 저장
			session.setAttribute("loginPl", "naver");

			String[] devid = email.split("@");
			String id = "naver " + devid[0];
			UserInfoVO infoVO = new UserInfoVO(id, name);
			session.setAttribute("userInfo", infoVO);
			int b = email.indexOf("@");
			int e = email.indexOf(".");
			if(b > 0 && e > 0)
				email = email.substring(b+1, e);
			System.out.println("email cutting : " + email);

			model.addAttribute("result", apiResult);

			if (dao.duplicateCheckId(id) > 0) {

				return "redirect:/";
			} else {
				return "redirect:/naverJoin/" + email + "/" + gender + "/" + mobile;
			}

		} else {
			return "/enterance/login";
		}
	}

	// 네이버회원가입
	@RequestMapping(value = "/naverJoin/{email}/{gender}/{mobile}", method = RequestMethod.GET)
	public String naverJoin(UserVO user, Model model, HttpSession session,@PathVariable String email, @PathVariable String gender, @PathVariable String mobile) {

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		user.setM_id(infoVO.getM_id());
		user.setM_name(infoVO.getM_name());
		if(email.equals("naver")) email = infoVO.getM_id().split(" ")[1] +"@naver.com";
		else if(email.equals("daum")) email = infoVO.getM_id().split(" ")[1] +"@daum.net";
		else if(email.equals("hanmail")) email = infoVO.getM_id().split(" ")[1] +"@hanmail.net";
		else if(email.equals("gmail")) email = infoVO.getM_id().split(" ")[1] +"@gmail.net";
		else email = "동의안함";
		user.setM_email(email);
		if(gender.equals("M") || gender.equals("male")) gender = "남자";
		else if(gender.equals("F") || gender.equals("female")) gender = "여자";
		else gender = "선택안함";
		user.setM_gender(gender);
		user.setM_tel(mobile);

		int n = dao.naverJoin(user);

		if (n == 0) {
			System.out.println("등록 실패");
		}

		return "redirect:/";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginout(HttpSession session) {

		session.removeAttribute("access_Token");
		session.removeAttribute("userInfo");
		session.invalidate();

		return "redirect:/";
	}

	// 내 정보

	@RequestMapping(value = "/member/mem/userInfo", method = RequestMethod.GET)
	public String userInfo(UserVO user, Model model, HttpSession session) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
		
		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
				
		UserVO userInfo = dao.userInfo(userId);
		
		
		model.addAttribute("userInfo", userInfo);
	
		
		List<RentVO> rentList = rentDAO.rentListByMid(userId, "구매");
		List<RentVO> purchaseList = rentDAO.purchaseListByMid(userId, "구매");
		List<MessageVO> messageList = messageDAO.messageByMid(userId);
		
		model.addAttribute("rentList", rentList);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("messageList", messageList);


		return "/member/mem/userInfo";
	}
	
	
	
	
	//사진 업로드
	
		@RequestMapping(value = "/member/mem/userInfo/{userID}", method = RequestMethod.POST)
		public String userInfoUpdateByPath(Model model, UserVO userVO, @PathVariable String userID) throws IOException {
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

			int n = dao.userUpdate(userVO);
			System.out.println("시작 후" + userVO.toString());
			if (n != 1) {
				// 업데이트 실패 시
				System.out.println("userInfoUpdateByPath // user 수정 실패 // " + userVO.toString());
			}

			return "redirect:/member/mem/userInfo";
		}
		
		
		
	//회원 탈퇴
		
		@RequestMapping(value = "/member/mem/userDelete/{userID}", method = RequestMethod.POST)
		public String userDelete(Model model, UserVO userVO, HttpSession session, @PathVariable String userID) throws IOException {
			System.out.println("시작 전" + userVO.toString());
			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		
			UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
			String userId = infoVO.getM_id();
			
			
			int s = dao.userConfirm(userId);
			
			
		
			int n = dao.userDelete(userVO);
			
			int n2 = dao.userDeleteUpdateAlert(userId);
			int n3 = dao.userDeleteUpdateCart(userId);
			int n4 = dao.userDeleteUpdateWish(userId);
			
//			int n5 = dao.userDeleteUpdateRental(userId);		
//			int n6 = dao.userDeleteUpdateBuy(userId);
	        int n7 = dao.userDeleteUpdateReview(userId);
			
			
			
			System.out.println("시작 후" + userVO.toString());
			if (n != 1) {
				// 삭제 실패 시
				System.out.println("userDelete // user 삭제 실패 // " + userVO.toString());
			}
			if (n2 != 1) {
				// 삭제 실패 시
				System.out.println("userDelete // alertmessage 삭제 실패 // " + userId.toString());
			}
			if (n3 != 1) {
				// 삭제 실패 시
				System.out.println("userDelete // cart 삭제 실패 // " + userId.toString());
			}
			if (n4 != 1) {
				// 삭제 실패 시
				System.out.println("userDelete // wish 삭제 실패 // " + userId.toString());
			}
//			if (n5 != 1) {
//				// 삭제 실패 시
//				System.out.println("userDelete // rental 삭제 실패 // " + userId.toString());
//			}
//			if (n6 != 1) {
//				// 삭제 실패 시
//				System.out.println("userDelete // buy 삭제 실패 // " + userId.toString());
//			}
			if (n7 != 1) {
				// 삭제 실패 시
				System.out.println("userDelete // review 삭제 실패 // " + userId.toString());
			}
		
			
		
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

		System.out.println("m_id " + m_id);
		// User 정보 가져오기
		System.out.println("adminMenDetailByPath() // 들어가서 유저정보");
		UserVO userVO = userDAO.memInfo(m_id);
		// 대여 정보 가져오기
		System.out.println("userVO : " + userVO.toString());
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

	
	
	
	
    @RequestMapping(value = "/member/mem/memJoin", method = RequestMethod.GET)
    public String menJoinForm(Model model){
      
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
    	
        try {
            
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom("ufo@ufo.com");
            helper.setTo(m_email);
            helper.setSubject("[UFO]회원가입 이메일 인증 메일 입니다.");
            helper.setText("인증번호 : " + AuthenticationKey,true);
            javaMailSender.send(message);
            
        }catch(Exception e) {
        	System.out.println("catch 안");
            e.printStackTrace();
        }
    	
        System.out.println("email send success");
    	return AuthenticationKey;
    	
    }

    
    @RequestMapping(value = "/member/mem/memJoin", method = RequestMethod.POST)
    public String menJoinPro(Model model, UserVO userVO) throws IOException{
    	
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

		int n = dao.memJoin(userVO);
		System.out.println("시작 후" + userVO.toString());
		if (n != 1) {
			// 업데이트 실패 시
			System.out.println("menJoinPro // member 회원가입 // " + userVO.toString());
		}

		return "redirect:/";
    	
    }

	// 성훈 end

}
