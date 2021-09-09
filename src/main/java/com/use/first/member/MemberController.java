package com.use.first.member;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.use.first.buy.BuyDAO;
import com.use.first.buy.BuyVO;
import com.use.first.message.MessageDAO;
import com.use.first.message.MessageVO;
import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.product.ProductDAO;
import com.use.first.product.ProductVO;
import com.use.first.rent.BuyInfoVO;
import com.use.first.rent.CartVO;
import com.use.first.rent.RentDAO;
import com.use.first.rent.RentVO;
import com.use.first.rent.WishListVO;
import com.use.first.visitor.VisitCountDAO;

/**
 * 8.12일 성훈 수정 - 성훈 start 밑에는 이걸 우선으로 통합 승빈 start 부분은 로그인 로그아웃 쪽은 성훈이 수정했음 아마
 * 승빈은 고객쪽 내정보 보기 userInfo 쪽을 오늘 했었음
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
			return "redirect:/";
		} else {
			return "/enterance/login";
		}
	}
	
	// UFO 회원 로그인 체크
		@ResponseBody
		@RequestMapping(value = "/member/mem/loginCheck", method = RequestMethod.POST, produces = "application/json")
		public Map<Object, Object> loginCheck(Model model, @RequestBody String data) throws Exception {
			String datas[] = data.split(",");
			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
			Map<Object, Object> map = new HashMap<Object, Object>();
			int result = dao.loginCheck(datas[0], datas[1]);
			System.out.println("loginCheck :: result : " + result);

			map.put("check", result);
			return map;
		}
	
	// UFO 회원 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpSession session,HttpServletRequest request) {
		model.addAttribute("user", vo);

		// 08월 13일 김수정 : 회원로그인 부분은 반환요청리스트, 연체 리스트 필요없어서 일단 주석처리. 확인할 것
//		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
//		List<RentVO> returnList = rentDAO.returnList();
//		List<RentVO> lateList = rentDAO.lateList();
		//병찬추가
		
		String referer =request.getHeader("referer");
		System.out.println("referer::"+referer);
		String s1 = referer.substring(21); 
		System.out.println("beforeUrl::"+s1);
		
		//병찬추가 여기까지 밑에도 있음
		if (vo.getM_id() == null || vo.getM_id().equals("")) {
			return "redirect:/login";
		} else if (vo.getM_pw() == null || vo.getM_pw().equals("")) {
			return "redirect:/login";
		}

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO user = dao.memInfo(vo.getM_id());

		if (user != null) {
			
			
			if (vo.getM_id().equals(user.getM_id()) && vo.getM_pw().equals(user.getM_pw())) {
				session.setAttribute("loginPl", "ufo");
				UserInfoVO infoVO = new UserInfoVO(user.getM_id(), user.getM_name());
				System.out.println("Login :: " + infoVO.toString());
				session.setAttribute("userInfo", infoVO);
				// session.setAttribute("userId", user.getM_id());
				// session.setAttribute("userName", user.getM_name());
//				session.setAttribute("returnList", returnList);
//				session.setAttribute("lateList", lateList);
				//병찬추가
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				if(s1.contains("/member/cartInsert")) {
					String[] paramArray = s1.split("/");			
					for(int i=0;i<paramArray.length;i++) {
					System.out.println(paramArray[i]);
					}
					System.out.println("분해테스트:::"+paramArray[3]);  //c_vid productDetail에서
					String c_pid = s1.substring(19,25);
					String c_mid= infoVO.getM_id();					
					CartVO cartVO = productDAO.checkCart(c_pid,c_mid);				
					if (cartVO == null) {return "redirect:"+s1;} else { return	"redirect:/member/rent/cartList";}												
				} else if (s1.contains("/member/wishListInsert")){
					String w_pid = s1.substring(23);
					System.out.println("w_pid:::" + w_pid);
					String w_mid = infoVO.getM_id();
					WishListVO wishListVO = productDAO.checkWishList(w_pid,w_mid);
						if (wishListVO == null) {return "redirect:"+s1;} else {
							return "redirect:/member/pro/productDetail/"+w_pid;
						}
							
					
				} else if (s1.contains("/member/rent/buy")){
					String s2 = s1.substring(17);
					return "redirect:"+s1;
					
				}
				//여기까지 병찬추가
				else {
					return "redirect:/";
				}
				
				
				
			} else {
				return "redirect:/login";
			}

		} else {

			return "redirect:/login";
		}
	}	

	// 카카오로그인
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLoginG(UserVO user, Model model, HttpSession session, @RequestParam("code") String code,
			HttpServletResponse response) throws IOException {
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
			// 이메일이 있는지 체크	- 없으면 kakaoJoin으로 이동		
			//					- 있으면 regtype 검사		- 유에프오가 없으면  그 db 정보로 로그인				
			//											- 유에프오가 있으면 아이디 있다고 알럿창 띄우기
			//							
			int isUFO = -1;
			int isKakao = -1;
			List<UserVO> userList = dao.duplicateCheckEmail(email);
			for(int i = 0; i < userList.size(); i++) {
				System.out.println("kakaoLogin :: users :" + userList.get(i).toString());
				if(userList.get(i).getM_regtype().equals("카카오")){
					isKakao = i;
				}
				if(userList.get(i).getM_regtype().equals("유에프오")){
					isUFO = i;
				}
			}
			
			UserInfoVO infoVO;
			if(isKakao == -1) {	
				infoVO = new UserInfoVO(id, userInfo.get("nickname").toString());
				session.setAttribute("userInfo", infoVO);
				int b = email.indexOf("@");
				int e = email.indexOf(".");
				String emailFront = ""; 
				if (b > 0 && e > 0) {
					emailFront = email.substring(b + 1, e);
				}
				System.out.println("kakaoLogin :: go kakaoJoin : 한번도 카카오로 로그인 한 적 없음, DB에 저장");
				String gender = userInfo.get("gender").toString();
				
				return "redirect:/kakaoJoin/" + emailFront + "/" + gender;
			}else {
				if(isUFO == -1) {
					infoVO =  new UserInfoVO(userList.get(isKakao).getM_id(), userList.get(isKakao).getM_name());
					session.setAttribute("userInfo", infoVO);
					System.out.println("kakaoLogin :: go Index : 한번 이상 카카오로 로그인해서 정보가 있음, UFO로 가입한 적은 없음");
					return "redirect:/";
				}else {
					
						//연동이 안됬다면 연동 여부 묻기

						System.out.println("kakaoLogin :: go kakaoLink : 한번 이상 카카오로 로그인해서 정보가 있음, UFO로 가입한 적도 있음");
										
						infoVO =  new UserInfoVO(userList.get(isKakao).getM_id(), userList.get(isKakao).getM_name());
						session.setAttribute("userInfo", infoVO);
						return "redirect:/";
					}
					
				
			}
			
		} else {
			System.out.println("kakaoLoginG else문 in!!!!");
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>action_popup.alert('선택사항을 동의해주세요'); location.href='redirect:/login'; </script>");
			out.flush();
			return null;
		}
	}


	// 카카오 회원가입
	@RequestMapping(value = "/kakaoJoin/{email}/{gender}", method = RequestMethod.GET)
	public String kakaoJoin(UserVO user, Model model, HttpSession session, @PathVariable String email,
			@PathVariable String gender) {

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		user.setM_id(infoVO.getM_id());
		user.setM_name(infoVO.getM_name());
		if (email.equals("naver"))
			email = infoVO.getM_id().split(" ")[1] + "@naver.com";
		else if (email.equals("daum"))
			email = infoVO.getM_id().split(" ")[1] + "@daum.net";
		else if (email.equals("hanmail"))
			email = infoVO.getM_id().split(" ")[1] + "@hanmail.net";
		else if (email.equals("gmail"))
			email = infoVO.getM_id().split(" ")[1] + "@gmail.com";
		else
			email = "동의안함";
		user.setM_email(email);
		if (gender.equals("M") || gender.equals("male"))
			gender = "남자";
		else if (gender.equals("F") || gender.equals("female"))
			gender = "여자";
		else
			gender = "선택안함";
		user.setM_gender(gender);
		user.setM_addr("");
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
			model.addAttribute("result", apiResult);
			String[] devid = email.split("@");
			String id = "naver " + devid[0];
			// 이메일이 있는지 체크	- 없으면 kakaoJoin으로 이동		
			//					- 있으면 regtype 검사		- 유에프오가 없으면  그 db 정보로 로그인				
			//											- 유에프오가 있으면 연동 여부 m_kakakolink 검사
			//							
			int isUFO = -1;
			int isNaver = -1;
			List<UserVO> userList = dao.duplicateCheckEmail(email);
			for(int i = 0; i < userList.size(); i++) {
				System.out.println("NaverLogin :: users :" + userList.get(i).toString());
				if(userList.get(i).getM_regtype().equals("네이버")){
					isNaver = i;
				}
				if(userList.get(i).getM_regtype().equals("유에프오")){
					isUFO = i;
					
				}
			}

			UserInfoVO infoVO;
			if(isNaver == -1) {	
				infoVO = new UserInfoVO(id, name);
				session.setAttribute("userInfo", infoVO);
				int b = email.indexOf("@");
				int e = email.indexOf(".");
				String emailFront = ""; 
				if (b > 0 && e > 0) {
					emailFront = email.substring(b + 1, e);
				}
				System.out.println("email cutting : " + emailFront);
				
				return "redirect:/naverJoin/" + email + "/" + gender + "/" + mobile;
			}else {
				if(isUFO == -1) {
					infoVO =  new UserInfoVO(userList.get(isNaver).getM_id(), userList.get(isNaver).getM_name());
					session.setAttribute("userInfo", infoVO);
				
					return "redirect:/";
				}else {
					//연동이 안됬다면 연동 여부 묻기
							
					infoVO =  new UserInfoVO(userList.get(isNaver).getM_id(), userList.get(isNaver).getM_name());
					session.setAttribute("userInfo", infoVO);
					
					return "redirect:/";
					
				}
			}
			
		} else {
			return "/enterance/login";
		}
	}

	// 네이버 회원가입
	@RequestMapping(value = "/naverJoin/{email}/{gender}/{mobile}", method = RequestMethod.GET)
	public String naverJoin(UserVO user, Model model, HttpSession session, @PathVariable String email,
			@PathVariable String gender, @PathVariable String mobile) {

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		user.setM_id(infoVO.getM_id());
		user.setM_name(infoVO.getM_name());
		if (email.equals("naver"))
			email = infoVO.getM_id().split(" ")[1] + "@naver.com";
		else if (email.equals("daum"))
			email = infoVO.getM_id().split(" ")[1] + "@daum.net";
		else if (email.equals("hanmail"))
			email = infoVO.getM_id().split(" ")[1] + "@hanmail.net";
		else if (email.equals("gmail"))
			email = infoVO.getM_id().split(" ")[1] + "@gmail.com";
		else
			email = "동의안함";
		user.setM_email(email);
		if (gender.equals("M") || gender.equals("male"))
			gender = "남자";
		else if (gender.equals("F") || gender.equals("female"))
			gender = "여자";
		else
			gender = "선택안함";
		user.setM_gender(gender);
		user.setM_tel(mobile);
		user.setM_addr("");
		int n = dao.naverJoin(user);

		if (n == 0) {
			System.out.println("등록 실패");
		}

		return "redirect:/";

	}

	// UFO와 카카오 연동
	@RequestMapping(value = "/naverLink/{email}", method = RequestMethod.GET)
	public String naverLink(UserVO user, Model model, HttpSession session, @PathVariable String email) {

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		user.setM_id(infoVO.getM_id());
		user.setM_name(infoVO.getM_name());
		if (email.equals("naver"))
			email = infoVO.getM_id().split(" ")[1] + "@naver.com";
		else if (email.equals("daum"))
			email = infoVO.getM_id().split(" ")[1] + "@daum.net";
		else if (email.equals("hanmail"))
			email = infoVO.getM_id().split(" ")[1] + "@hanmail.net";
		else if (email.equals("gmail"))
			email = infoVO.getM_id().split(" ")[1] + "@gmail.com";
		else
			email = "동의안함";
		user.setM_email(email);
	

		int n = dao.kakaoJoin(user);

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

	// 내 정보 수정

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

	
	// 메시지 리스트
	
	@RequestMapping(value = "/member/mem/messageList", method = RequestMethod.GET)
	public String messageList(Model model, Criteria cri, HttpSession session) {
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		

		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<MessageVO> messageList = messageDAO.messageList(userId, cri);
		
		// 모델에 추가
		model.addAttribute("messageList", messageList);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함

		int totalCount = messageDAO.countMessageListTotal(userId, cri);
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker.toString());
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/messageList";

	}



	
/*임시
	//메시지 상세보기
	
	@RequestMapping(value = "/member/mem/messageList/{a_id}", method = RequestMethod.GET)
	public String messageDetail(Model model, HttpSession session, @PathVariable int a_id) {
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
		

		MessageVO message = messageDAO.messageInfo(a_id);
		
		
		model.addAttribute("message", message);
	
	
		return "/member/mem/messageDetail";
	}
*/
	
	//메시지 상세보기 해당 대여 구매 정보 가져오기 
	
		@RequestMapping(value = "/member/mem/messageList/{a_id}", method = RequestMethod.GET)
		public String messageDetail(Model model, HttpSession session, @PathVariable int a_id) {
			MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
			
            //대여 구매내역 얻기
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
			BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			
			MessageVO message = messageDAO.messageInfo(a_id);
			System.out.println("message :  " + message.getA_rid());
			int r_id = message.getA_rid();
			RentVO rentVO = rentDAO.rentMessageInfo(r_id);
			ProductVO productVO = productDAO.productInfo(rentVO.getR_pid());
			
			
			List<BuyVO> buyList=buyDAO.buyList(rentVO.getR_id());
			if(!buyList.isEmpty() && buyList.size() != 0) {
				for(int i = 0; i < buyList.size(); i++) {
					System.out.println("memController - memRentDetail - buyInfo : " + buyList.get(i).toString());
				}
			}
			
			
			model.addAttribute("message", message);
			model.addAttribute("rentInfo", rentVO);
			model.addAttribute("proInfo", productVO);
			model.addAttribute("buyList", buyList);
		
		
			return "/member/mem/messageDetail";
		}
	
	
	
	
	
	
	//메시지리스트-다중선택삭제
	@RequestMapping(value = "/member/mem/selectMessageDelete", method = RequestMethod.GET)
	public String messageSelectDelete(@RequestParam HashMap<String, Object> commandMap) {
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
		String[] code_array = null;
		String code = commandMap.get("arrayParam").toString();
		System.out.println("code:  " +  code);
		code_array = code.split(",");
		for (int i = 0; i < code_array.length; i++) {
			System.out.println("code_array[]::::" + code_array[i]);
			messageDAO.selectMessageDelete(Integer.parseInt(code_array[i]));
		
		}
		return "redirect:/member/mem/messageList";
	}
		
	
		
	//메시지 삭제
		@RequestMapping(value = "/member/mem/messageDelete/{a_id}", method = RequestMethod.POST)
		public String messageDelete(Model model, HttpSession session, @PathVariable int a_id) {
			MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);

			int n = messageDAO.messageDelete(a_id);
			
			if (n != 1) {
				// 삭제 실패 시
				System.out.println("messageDelete // message 삭제 실패 // ");
			}

			
			return "redirect:/member/mem/messageList" ;
			
		}
		
		
		
		
		
		//탈퇴 전 확인 
		
		@RequestMapping(value = "/member/mem/accountDelete", method = RequestMethod.GET)
		public String accountDelete(Model model, UserVO userVO, HttpSession session, String userID)
				throws IOException {
			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

			UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
			String userId = infoVO.getM_id();

			int c = dao.userConfirm(userId);
			System.out.println("시작 전" + userId.toString());

			if (c == 0) {
				return "/member/mem/accountDeleteAuth";
			} else {
				// 탈퇴 실패
				System.out.println("userConfirm // user 탈퇴 실패 // " + userId.toString());
				return "redirect:/member/mem/userInfo";
			}

		}
		
	
	// 회원 탈퇴
	
	
	@RequestMapping(value = "/member/mem/userDelete/{userID}", method = RequestMethod.POST)
	public String userDelete(Model model, UserVO userVO, HttpServletRequest request, HttpSession session, @PathVariable String userID)
			throws IOException {
		System.out.println("시작 전" + userVO.toString());
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		String pass = (String)request.getParameter("passinput");
		System.out.println("pass : " + pass);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		UserVO vo = dao.pwMember(userId);
		
		System.out.println("vo : " + vo);

		int c = dao.userConfirm(userId);
		
		if(vo.getM_pw().equals(pass)) {
			if (c == 0 ) {
				int n = dao.userDelete(userVO);

				int n2 = dao.userDeleteUpdateAlert(userId);
				int n3 = dao.userDeleteUpdateCart(userId);
				int n4 = dao.userDeleteUpdateWish(userId);

				int n5 = dao.userDeleteUpdateRental(userId);
				int n6 = dao.userDeleteUpdateBuy(userId);
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
				if (n5 != 1) {
					// 삭제 실패 시
					System.out.println("userDelete // rental 삭제 실패 // " + userId.toString());
				}
				if (n6 != 1) {
					// 삭제 실패 시
					System.out.println("userDelete // buy 삭제 실패 // " + userId.toString());
				}
				if (n7 != 1) {
					// 삭제 실패 시
					System.out.println("userDelete // review 삭제 실패 // " + userId.toString());
				}

				session.invalidate();

				return "/member/mem/accountDeleteComplete";
			} else {
				// 탈퇴 실패
				System.out.println("userConfirm // user 탈퇴 실패 // " + userId.toString());
				model.addAttribute("deleteFail",true);
				return "/member/mem/accountDeleteAuth";
			}

		}else {
			// 탈퇴 실패
			System.out.println("userConfirm // user 탈퇴 실패 // " + userId.toString());
			model.addAttribute("deleteFail",true);
			return "/member/mem/accountDeleteAuth";
		}
	}

		


	
	
	//아이디 찾기
	
	@RequestMapping(value = "/member/mem/id_auth")
	public ModelAndView id_auth(HttpSession session, HttpServletRequest request) throws IOException {
		String name = (String)request.getParameter("name");
		String email = (String)request.getParameter("email");
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		
		UserVO vo = dao.selectMember(email);
		System.out.println("email : " +  email);
		System.out.println("name : " +  name);
		System.out.println("vo : " +  vo);
		
		if(vo != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		if (vo.getM_name().equals(name) && vo.getM_email().equals(email) && vo.getM_regtype().equals("유에프오")  ) {
			session.setAttribute("email", vo.getM_email());

			String setfrom = "usefirstown@gmail.com";
			String tomail = email; //받는사람
			String title = "[UFO] 아이디찾기 인증 이메일 입니다"; 
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "UFO 아이디찾기 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 
			
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			ModelAndView mv = new ModelAndView();
			mv.setViewName("/member/mem/id_auth");
			mv.addObject("num", num);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/member/mem/id_find");
			return mv;
		}
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/member/mem/id_find");
			return mv;
		}


	}
	
		//이메일 인증번호 확인
		@RequestMapping(value = "/member/mem/id_set", method = RequestMethod.POST)
		public String id_set(@RequestParam(value="email_injeung") String email_injeung,
					@RequestParam(value = "num") String num, UserVO user, HttpSession session, Model model) throws IOException{
				
				if(email_injeung.equals(num)) {
					UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
					
					user.setM_email((String) session.getAttribute("email"));

					
					System.out.println("user정보 " + user);
					
					
					String info = dao.selectId(user);
					
					model.addAttribute("info", info);
					
					
					return "/member/mem/id_info";
				}
				else {
					return "/member/mem/id_find";
				}
		} 
		
		
		
			
			
			
			
	
	//비밀번호 찾기
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/member/mem/pw_auth")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = (String)request.getParameter("id");
		String name = (String)request.getParameter("name");
		String email = (String)request.getParameter("email");
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

		UserVO vo = dao.selectMember(email);
		
		if(vo != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		if (vo.getM_name().equals(name) && vo.getM_id().equals(id)  && vo.getM_email().equals(email) && vo.getM_regtype().equals("유에프오")  ) {
			session.setAttribute("email", vo.getM_email());

			String setfrom = "usefirstown@gmail.com";
			String tomail = email; //받는사람
			String title = "[UFO] 비밀번호변경 인증 이메일 입니다"; 
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "UFO 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 
			
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			ModelAndView mv = new ModelAndView();
			mv.setViewName("/member/mem/pw_auth");
			mv.addObject("num", num);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/member/mem/pw_find");
			return mv;
		}
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/member/mem/pw_find");
			return mv;
		}


	}
	
	
	//이메일 인증번호 확인
	@RequestMapping(value = "/member/mem/pw_set", method = RequestMethod.POST)
	public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
				@RequestParam(value = "num") String num) throws IOException{
			
			if(email_injeung.equals(num)) {
				return "/member/mem/pw_new";
			}
			else {
				return "/member/mem/pw_find";
			}
	} 
	
	
	//DB 비밀번호 업데이트
	@RequestMapping(value = "/member/mem/pw_new", method = RequestMethod.POST)
	public String pw_new(UserVO user, HttpSession session, HttpServletRequest request) throws IOException{
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		
		user.setM_email((String) session.getAttribute("email"));
		
		
		
		System.out.println("user정보 " + user);
		int result = dao.pwUpdate_M(user);
		if(result == 1) {
			return "redirect:/login";
		}
		else {
			System.out.println("pw_update"+ result);
			return "member/mem/pw_new";
		}
}
	

	
	
	@RequestMapping(value="/member/mem/pw_change/{count}", method= RequestMethod.GET)
	public String pw_changeFrom(HttpSession session, @PathVariable int count, Model model) {
		UserDAO userDao = sqlSessionTemplate.getMapper(UserDAO.class);
		
		UserVO user = userDao.memInfo(((UserInfoVO) session.getAttribute("userInfo")).getM_id());
		if(count == 1)
		{
			model.addAttribute("count", 1);
		}else if(count == 2) {
			model.addAttribute("count", 2);
		}else if(count == 3) {
			model.addAttribute("count", 3);
		}
		return "/member/mem/pw_change";
	}
	
	
	@RequestMapping(value="/member/mem/pw_change", method= RequestMethod.POST)
	public String pw_changePro(HttpSession session, @RequestParam String pwd, Model model) {
		UserDAO userDao = sqlSessionTemplate.getMapper(UserDAO.class);
		String id =((UserInfoVO) session.getAttribute("userInfo")).getM_id();
		UserVO user = userDao.memInfo(id);
		System.out.println("pw_changePro :: pwd : " + pwd);
		String[] pass = pwd.split(",");
		if(pass[0].equals(user.getM_pw()) || pass[0] == user.getM_pw()) {
			System.out.println("pw_changePro :: pass[0] : " + pass[0]);
			System.out.println("pw_changePro :: pass[1] : " + pass[1]);
			System.out.println("pw_changePro :: pass[2] : " + pass[2]);
			System.out.println("pw_changePro :: compare : " +pass[1] == pass[2] );
			System.out.println("pw_changePro :: compare : " +pass[1].equals(pass[2]));
			if(pass[1] == pass[2] || pass[1].equals(pass[2])) {
				System.out.println("pw_changePro :: commit");
				userDao.pwUpdateId(id, pass[1]);
				return "redirect:/member/mem/pw_change/3";
			}else {
				return "redirect:/member/mem/pw_change/2";
			}
		}else {
			return "redirect:/member/mem/pw_change/2";
		}
	
	}
	
	


	// 관리자
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLoginG(UserVO user, Model model, HttpSession session) {
		model.addAttribute("user", user);
		if (session.getAttribute("userName") != null) {
			if (session.getAttribute("userName").equals("관리자"))
				return "redirect:/admin";
			else
				return "/enterance/adminLogin";
		} else {
			return "/enterance/adminLogin";
		}
	}

	// 관리자 로그인 체크
	@ResponseBody
	@RequestMapping(value = "/admin/adminLoginCheck", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> adminLoginCheck(Model model, @RequestBody String data) throws Exception {
		int result = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		String datas[] = data.split(",");
	
		if(datas[0].equals("admin") || datas[0] == "admin") {
			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
			
			result = dao.loginCheck(datas[0], datas[1]);
			System.out.println("adminLoginCheck :: result : " + result);
		}
		
		map.put("check", result);
		return map;
	}

	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
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
				
				return "redirect:/admin";
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

		return "redirect:/adminLogin";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminIndex(UserVO vo, Model model, Criteria cri,HttpSession session) {

		//9월6일 신영,수정 admin 인덱스 몇개 추가

		
	//수정 시작	
		DecimalFormat df = new DecimalFormat("00");
        Calendar currentCalendar = Calendar.getInstance();
      //이번달
        String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
        String monthago  = df.format(currentCalendar.get(Calendar.MONTH) - 1);

	UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		VisitCountDAO visitDAO = sqlSessionTemplate.getMapper(VisitCountDAO.class);
		int totalBuy = buyDAO.totalPurchase();
		List<RentVO> rentToBuyList =rentDAO.rentToBuyList();
		List<BuyVO> threeMonthPurchase=buyDAO.threeMonthPurchase(month,monthago);
		List<BuyVO> threeMonthRentPurchase=buyDAO.threeMonthRentPurchase(month,monthago);
		List<BuyVO> threeMonthBuyPurchase=buyDAO.threeMonthBuyPurchase(month,monthago);
		BuyVO temp=new BuyVO();
		BuyVO temp2=new BuyVO();
		BuyVO temp3=new BuyVO();
		List<BuyVO> threeMonthPurchase2=new ArrayList<BuyVO>();
		List<BuyVO> threeMonthRentPurchase2=new ArrayList<BuyVO>();
		List<BuyVO> threeMonthBuyPurchase2=new ArrayList<BuyVO>();
		//3개월 총매출 리스트
		if(threeMonthPurchase.size()==0) {
			temp.setB_month(monthago);
			temp.setB_purchase("0");
			threeMonthPurchase2.add(0,temp);
			temp2.setB_month(Integer.toString(Integer.parseInt(monthago)+1));
			temp2.setB_purchase("0");
			threeMonthPurchase2.add(1,temp2);
			temp3.setB_month(month);
			temp3.setB_purchase("0");
			threeMonthPurchase2.add(2,temp3);
		}else {
			int count=-1;
			for(int k=0;k<threeMonthPurchase.size();k++) {
				if(threeMonthPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(month)-2))) {
					count=k;
				}
			}
			if(count==-1) {
				
				temp.setB_month(monthago);
				temp.setB_purchase("0");
				threeMonthPurchase2.add(0,temp);
			}else {
				threeMonthPurchase2.add(0,threeMonthPurchase.get(count));
			}
			
			count=-1;
			for(int k=0;k<threeMonthPurchase.size();k++) {
				if(threeMonthPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(monthago)+1))) {
					count=k;
				}
			}
			if(count==-1) {
				temp2.setB_month(Integer.toString(Integer.parseInt(monthago)+1));
				temp2.setB_purchase("0");
				threeMonthPurchase2.add(1,temp2);
			}else {
				threeMonthPurchase2.add(1,threeMonthPurchase.get(count));
			}
			System.out.println(threeMonthPurchase2.toString());
			count=-1;
			
			for(int k=0;k<threeMonthPurchase.size();k++) {
				if(threeMonthPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(monthago)+2))) {
				
					count=k;
				}
			}
			if(count==-1) {
			
				temp3.setB_month(month);
				temp3.setB_purchase("0");
				threeMonthPurchase2.add(2,temp3);
			}else {
				
				threeMonthPurchase2.add(2,threeMonthPurchase.get(count));
				
			}
	
		}

		//3개월 대여 매출 리스트
		if(threeMonthRentPurchase.size()==0) {
			temp.setB_month(monthago);
			temp.setB_purchase("0");
			threeMonthRentPurchase2.add(0,temp);
			temp2.setB_month(Integer.toString(Integer.parseInt(monthago)+1));
			temp2.setB_purchase("0");
			threeMonthRentPurchase2.add(1,temp2);
			temp3.setB_month(month);
			temp3.setB_purchase("0");
			threeMonthRentPurchase2.add(2,temp3);
		}else {
			int count=-1;
			for(int k=0;k<threeMonthRentPurchase.size();k++) {
				if(threeMonthRentPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(month)-2))) {
					count=k;
				}
			}
			if(count==-1) {
				
				temp.setB_month(monthago);
				temp.setB_purchase("0");
				threeMonthRentPurchase2.add(0,temp);
			}else {
				threeMonthRentPurchase2.add(0,threeMonthRentPurchase.get(count));
			}
			
			count=-1;
			for(int k=0;k<threeMonthRentPurchase.size();k++) {
				if(threeMonthRentPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(monthago)+1))) {
					count=k;
				}
			}
			if(count==-1) {
				temp2.setB_month(Integer.toString(Integer.parseInt(monthago)+1));
				temp2.setB_purchase("0");
				threeMonthRentPurchase2.add(1,temp2);
			}else {
				threeMonthRentPurchase2.add(1,threeMonthRentPurchase.get(count));
			}
			count=-1;
			
			for(int k=0;k<threeMonthRentPurchase.size();k++) {
				if(threeMonthRentPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(monthago)+2))) {
					count=k;
				}
			}
			if(count==-1) {
			
				temp3.setB_month(month);
				temp3.setB_purchase("0");
				threeMonthRentPurchase2.add(2,temp3);
			}else {
				
				threeMonthRentPurchase2.add(2,threeMonthRentPurchase.get(count));
				
			}
			
			
		}
		
		//3개월 구매 매출 리스트
		if(threeMonthBuyPurchase.size()==0) {
			temp.setB_month(monthago);
			temp.setB_purchase("0");
			threeMonthBuyPurchase2.add(0,temp);
			temp2.setB_month(Integer.toString(Integer.parseInt(monthago)+1));
			temp2.setB_purchase("0");
			threeMonthBuyPurchase2.add(1,temp2);
			temp3.setB_month(month);
			temp3.setB_purchase("0");
			threeMonthBuyPurchase2.add(2,temp3);
		}else {
			int count=-1;
			for(int k=0;k<threeMonthBuyPurchase.size();k++) {
				if(threeMonthBuyPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(month)-2))) {
					count=k;
				}
			}
			if(count==-1) {
				
				temp.setB_month(monthago);
				temp.setB_purchase("0");
				threeMonthBuyPurchase2.add(0,temp);
			}else {
				threeMonthBuyPurchase2.add(0,threeMonthBuyPurchase.get(count));
			}
			System.out.println(threeMonthBuyPurchase2.toString()+"7");
			count=-1;
			for(int k=0;k<threeMonthBuyPurchase.size();k++) {
				if(threeMonthBuyPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(monthago)+1))) {
					count=k;
				}
			}
			if(count==-1) {
				System.out.println("어디로");
				temp2.setB_month(Integer.toString(Integer.parseInt(monthago)+1));
				temp2.setB_purchase("0");
				threeMonthBuyPurchase2.add(1,temp2);
			}else {
				
				threeMonthBuyPurchase2.add(1,threeMonthBuyPurchase.get(count));
			}
			System.out.println(threeMonthBuyPurchase2.toString()+"8");
			count=-1;
			
			for(int k=0;k<threeMonthBuyPurchase.size();k++) {
				if(threeMonthBuyPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(monthago)+2))) {
					count=k;
				}
			}
			if(count==-1) {
			
				temp3.setB_month(month);
				temp3.setB_purchase("0");
				threeMonthBuyPurchase2.add(2,temp3);
			}else {
				
				threeMonthBuyPurchase2.add(2,threeMonthBuyPurchase.get(count));		
			}
		}

		model.addAttribute("threeMonthBuyPurchase",threeMonthBuyPurchase2);
		model.addAttribute("threeMonthRentPurchase",threeMonthRentPurchase2);
		model.addAttribute("threeMonthPurchase",threeMonthPurchase2);
		model.addAttribute("totalBuy",totalBuy);
		model.addAttribute("rentToBuyList",rentToBuyList);
		model.addAttribute("user", vo);
	//수정 끝	

	
		List<UserVO> list = dao.memList(cri);
		int listCount = list.size();
		model.addAttribute("listCount", listCount);
				
		int countSmartPhone = productDAO.countSmartPhone();
		int countLaptop = productDAO.countLaptop();
		int countCamera = productDAO.countCamera();
		int countWatch = productDAO.countWatch();
		int countTablet = productDAO.countTablet();
		
		int[] array = {countSmartPhone,countLaptop,countCamera,countWatch,countTablet};		
		for (int i = 0; i < array.length; i++) {					
		model.addAttribute("array0", array[0]);
		model.addAttribute("array1", array[1]);
		model.addAttribute("array2", array[2]);
		model.addAttribute("array3", array[3]);
		model.addAttribute("array4", array[4]);	
		}
		
		List<BuyVO> buyList = buyDAO.buyManyList();
		Calendar cal = Calendar.getInstance();
		String format = "yyyy-MM";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String date = sdf.format(cal.getTime());
		System.out.println(date.substring(5));
		System.out.println(date.substring(5));
		String thisMonth = date.substring(5);
		
		model.addAttribute("thisMonth",Integer.parseInt(thisMonth));
		model.addAttribute("lastMonth",Integer.parseInt(thisMonth)-01);
		model.addAttribute("llastMonth",Integer.parseInt(thisMonth)-02);
		System.out.println(Integer.parseInt(thisMonth)-1);
		
		for (int i = 0; i < 3; i++) {		
			if(i==0) {
			String aamount = buyDAO.buyPurchase(i);	
			model.addAttribute("aamount",aamount);
			}
			else if(i==1) {
			String bamount = buyDAO.buyPurchase(i);	
			model.addAttribute("bamount",bamount);
			}
			else if(i==2) {
			String camount = buyDAO.buyPurchase(i);				
			model.addAttribute("camount",camount);
			}
		
		}
		String sm = buyDAO.countSep("h",thisMonth);
		String ltt = buyDAO.countSep("n",thisMonth);
		String cm = buyDAO.countSep("c",thisMonth);
		String wc = buyDAO.countSep("w",thisMonth);
		String tb = buyDAO.countSep("t",thisMonth);
		
		model.addAttribute("sm", sm);
		model.addAttribute("ltt", ltt);
		model.addAttribute("cm", cm);
		model.addAttribute("wc", wc);
		model.addAttribute("tb", tb);
		
		
		int visitCount = visitDAO.selectVisit();
		int one = 0;
		int visitCountToday = visitDAO.selectVisitToday(one);		
		
		System.out.println("9월 매출액" + sm+ltt+cm+wc+tb);		
		ProductVO readList = productDAO.adminRead();
		
		System.out.println(readList.toString());
		model.addAttribute("buyList", buyList);	
		model.addAttribute("readList", readList);
		model.addAttribute("visitCount", visitCount);
		model.addAttribute("visitCountToday", visitCountToday);
		System.out.println(session.toString());
		
      
		
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
	// 관리자 회원 상세 정보 보기
//	@RequestMapping(value = "/admin/mem/memDetail", method = RequestMethod.GET)
//	public String adminMenDetail(Model model, @RequestParam String m_id) {
//		System.out.println("admin/mem/memDetail // 들어가서 처음");
//		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
//		UserVO userInfo = dao.memInfo(m_id);
//
//		model.addAttribute("userInfo", userInfo);
//
//		return "/admin/mem/memDetail";
//	}
	// 관리자 회원 상세 정보 보기
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

	// 관리자 회원 상세 정보에서 수정 클릭
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

	// 회원 가입 폼
	/*@RequestMapping(value = "/member/mem/memJoin", method = RequestMethod.GET)
	public String menJoinForm(Model model) {

		return "/member/mem/memJoin";
	}*/
	@RequestMapping(value = "/member/mem/memJoin", method = RequestMethod.GET)
	public String menJoinForm(Model model, HttpServletRequest request) {
		//병찬추가  (위에 주석된게 원래 있던것임)
		String referer =request.getHeader("referer");
		String s1 = referer.substring(21); 
		model.addAttribute("beforeUrl", s1);	
		//병찬 여기까지
		return "/member/mem/memJoin";		
	}

	// 회원 가입 - 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/member/mem/idCheck", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> menIdCheck(Model model, @RequestBody String m_id) throws Exception {
		System.out.println("ajax 호출 / memIdCheck");
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		Map<Object, Object> map = new HashMap<Object, Object>();
		int result = dao.duplicateCheckId(m_id);

		map.put("check", result);

		return map;
	}
	
	// 회원 가입 - 이메일 중복 검사
	@ResponseBody
	@RequestMapping(value = "/member/mem/emailCheck", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> menEmailCheck(Model model, @RequestBody String m_email) throws Exception {
		System.out.println("ajax 호출 / menEmailCheck");
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		Map<Object, Object> map = new HashMap<Object, Object>();
		List<UserVO> userList = dao.duplicateCheckEmail(m_email);
		System.out.println("menEmailCheck :: userList.size() :" + userList.size());
		map.put("ufo", false);
		map.put("kakao", false);
		map.put("naver", false);
		
		for(UserVO user : userList) {
			if(user.getM_regtype().equals("유에프오")) {
				map.replace("ufo", true);
			}
			if(user.getM_regtype().equals("카카오")) {
				map.replace("kakao", true);
			}
			if(user.getM_regtype().equals("네이버")) {
				map.replace("naver", true);
			}
			
		}
		System.out.println("menEmailCheck :: ufo :" + map.get("ufo") + " kakao :" + map.get("kakao") + " naver :" + map.get("naver"));
		return map;
	}

	// 회원 가입 - 이메일 인증
	@Autowired
	private JavaMailSender javaMailSender;

	@ResponseBody
	@RequestMapping(value = "/member/mem/memEmailSend", method = RequestMethod.POST, produces = "application/json")
	public String menEmailSend(Model model, @RequestBody String m_email) {
		System.out.println("ajax 호출 / menEmailCheck");

		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
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

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom("ufo@ufo.com");
			helper.setTo(m_email);
			helper.setSubject("[UFO]회원가입 이메일 인증 메일 입니다.");
			String content = System.getProperty("line.separator") 
					+ "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "UFO 이메일 인증번호는 " + AuthenticationKey + " 입니다." + System.getProperty("line.separator"); // 
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			System.out.println("catch 안");
			e.printStackTrace();
		}

		System.out.println("email send success");
		return AuthenticationKey;

	}

	// 회원 가입 submit
	@RequestMapping(value = "/member/mem/memJoin", method = RequestMethod.POST)
	public String menJoinPro(Model model, UserVO userVO, @RequestParam String beforeUrl) throws IOException {
		
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
		userVO.setM_regtype("유에프오");
		int n = dao.memJoin(userVO);
		System.out.println("시작 후" + userVO.toString());
		if (n != 1) {
			// 업데이트 실패 시
			System.out.println("menJoinPro // member 회원가입 // " + userVO.toString());
		}
		//병찬 추가
		if(beforeUrl.contains("/member/cartInsert")) {
			return "redirect:"+beforeUrl;
			} else if (beforeUrl.contains("/member/wishListInsert")){
			return "redirect:"+beforeUrl;
			}  else if (beforeUrl.contains("/member/rent/buy")){
			return "redirect:"+beforeUrl;
			} else {
		return "member/mem/join_complete";
			}
		//병찬추가함 (return에 있던거 else로 감쌈)
	}

	// 회원 상세 정보 - 대여 상세 정보
	// method 를 Post 로 수정해야 한다.
	@RequestMapping(value = "/member/mem/memRentDetail/{r_id}", method = RequestMethod.GET)
	public String memRentDetail(Model model, @PathVariable int r_id) {

		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);

		//선택한 대여정보의 구매확정 내역 확인
		RentVO rentBuy=rentDAO.rentToBuyListByrid(r_id);
		// 선택한 대여 정보 가져오기
		RentVO rentVO = rentDAO.rentInfo(r_id);
		System.out.println("memController - memRentDetail - rentVO : " + rentVO.toString());
		// 선택한 대여 상품 정보 가져오기
		ProductVO productVO = productDAO.productInfo(rentVO.getR_pid());
		System.out.println("memController - memRentDetail - productVO : " + productVO.toString());
		// 선택한 대여의 결제 정보 가져오기
		List<BuyVO> buyList=buyDAO.buyList(rentVO.getR_id());
		if(!buyList.isEmpty() && buyList.size() != 0) {
			for(int i = 0; i < buyList.size(); i++) {
				System.out.println("memController - memRentDetail - buyInfo : " + buyList.get(i).toString());
			}
		}
		model.addAttribute("rentBuy", rentBuy);
		model.addAttribute("rentInfo", rentVO);
		model.addAttribute("proInfo", productVO);
		model.addAttribute("buyList", buyList);
		return "/member/mem/memRentDetail";
	}

    
    
  //회원 상세 정보 - 대여 상세 정보 - 반납
    @RequestMapping(value ="/member/mem/memRentReturn/{r_id}", method = RequestMethod.GET)
	public String memRentReturn(Model model, @PathVariable int r_id) throws Exception{

		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		System.out.println("memController - memRentReturn  :  반납 하기 클릭 컨트롤러");
		// 선택한 대여 정보 가져오기
		RentVO rentVO = new RentVO();
		rentVO.setR_id(r_id);
		rentVO.setR_state("반납 요청");
		System.out.println("memController - memRentReturn new rentVO : " + rentVO.toString());

    	int result = rentDAO.rentUpdate(rentVO);
    	System.out.println("memController - memRentReturn result : " + result);
    	
    	
    	return "redirect:/member/mem/memRentDetail/"+r_id;
	}
    
    
    // 회원 상세 정보 - 대여 상세 정보 - 환불
    @RequestMapping(value ="/member/mem/memRentRefund/{r_id}", method = RequestMethod.GET)
   	public String memRentRefund(Model model, @PathVariable int r_id) throws Exception{
   		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
   		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
   		System.out.println("memController - memRentRefund  :  환불 하기 클릭 컨트롤러");
   		// 선택한 대여 정보 가져오기
   		RentVO rentVO = rentDAO.rentInfo(r_id);
   		if(rentVO.getR_state().equals("대여중") || rentVO.getR_state() == "대여중") {
   			rentVO.setR_state("환불 요청(대여)");
   		} else if(rentVO.getR_state().equals("구매 확정") || rentVO.getR_state() == "구매 확정") {
   			rentVO.setR_state("환불 요청(구매 확정)");
   		} else if(rentVO.getR_state().equals("즉시 구매") || rentVO.getR_state() == "즉시 구매") {
   			rentVO.setR_state("환불 요청(즉시 구매)");
   		}
		System.out.println("memController - memRentReturn new rentVO : " + rentVO.toString());
    	int result = rentDAO.rentUpdate(rentVO);
   		System.out.println("memController - memRentRefund 1result : " + result);
    	
   		return "redirect:/member/mem/memRentDetail/" + r_id ;
   	}
    
    // 회원 상세 정보 - 대여 상세 정보 - 연체료 존재
    @RequestMapping(value ="/member/mem/memRentLate/{r_id}", method = RequestMethod.GET)
	public String memRentLate(Model model, @PathVariable int r_id, HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
		BuyInfoVO buyInfoVO = new BuyInfoVO();
		
		// 선택한 대여 정보 가져오기
		RentVO rentVO = rentDAO.rentInfo(r_id);
		System.out.println("memController - memRentDetail - rentVO : " + rentVO.toString());

		// 연체료 납부 후 반납
		long gap = new Date().getTime() - rentVO.getR_sdate().getTime();
		int late = Double.valueOf(Math.floor(gap / (1000 * 60 * 60 * 24))).intValue();
		System.out.println(late+"late");
		int realLate=late-2;
		
		// 선택한 대여의 결제 정보 가져오기
		List<BuyVO> buyList = buyDAO.buyList(rentVO.getR_id());
		int lateFee=Double.valueOf(Double.parseDouble(buyList.get(0).getB_purchase())*0.3).intValue();
		System.out.println(lateFee);
		
		
		//세션에서 해당 회원의 아이디 받음
		UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
		String userId=userInfo.getM_id();
		
			
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		//제품 아이디 getter로 받아옴
		String productId=rentVO.getR_pid();
		// 제품 아이디로 해당 제품 정보 끌어옴
		ProductVO productVO=productDAO.productInfo(productId);
		//나머지 필요한 제품 정보들 BuyInfoBean에 setter로 넣어줌 
		buyInfoVO.setProductId(productId);
		buyInfoVO.setProductPrice(lateFee);
		buyInfoVO.setProductImg(productVO.getP_mainImg());
		buyInfoVO.setProductName(productVO.getP_name());
		buyInfoVO.setBuyType("연체료 납부");
		buyInfoVO.setProamount(rentVO.getR_rent());
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		buyInfoVO.setRentdate(dateFormat.format(rentVO.getR_sdate()));
		//회원 정보 받아옴
		UserVO userVO = userDAO.memInfo(userId);

		ArrayList<BuyInfoVO> buyInfoList = new ArrayList<BuyInfoVO>();
		buyInfoList.add(buyInfoVO);
		
		//모델에 저장
		model.addAttribute("buyInfoList", buyInfoList);
		model.addAttribute("userVO", userVO);
		model.addAttribute("r_id", r_id);
		return "member/rent/buy";
	}
		

    // 회원 상세 정보 - 구매 상세 정보
    @RequestMapping(value ="/member/mem/memBuyDetail/{r_id}", method = RequestMethod.GET)
   	public String memBuyDetail(Model model, @PathVariable int r_id) {
   		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
   		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
   		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
   		// 선택한 구매 정보 가져오기

		RentVO rentVO = rentDAO.rentInfo(r_id);
		System.out.println("memController - memRentDetail - rentVO : " + rentVO.toString());
		// 선택한 대여 상품 정보 가져오기
				ProductVO productVO = productDAO.productInfo(rentVO.getR_pid());
				System.out.println("memController - memRentDetail - productVO : " + productVO.toString());
		// 선택한 구매의 결제 정보 가져오기

		List<BuyVO> buyList=buyDAO.buyList(rentVO.getR_id());
		if(!buyList.isEmpty() && buyList.size() != 0) {
			for(int i = 0; i < buyList.size(); i++) {
				System.out.println("memController - memRentDetail - buyInfo : " + buyList.get(i).toString());
			}
		}

		model.addAttribute("rentInfo", rentVO);
		model.addAttribute("proInfo", productVO);
		model.addAttribute("buyList", buyList);
		return "/member/mem/memBuyDetail";
	}
    
    //회원 내정보 - 대여 내역
    @RequestMapping(value = "/member/mem/memRentList", method = RequestMethod.GET)
	public String memRentListForm(Criteria cri, Model model,HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		
		// 대여 정보 가져오기
		List<RentVO> rentList = rentDAO.rentListByMidAndSearch(cri, userId, "구매");
		List<RentVO> rentBuyList= rentDAO.rentbuyListByMid(userId);
		System.out.println("rentList size : " + rentList.size());
		System.out.println(rentBuyList.toString());
	
		// 모델에 추가
		model.addAttribute("rentList", rentList);
		model.addAttribute("rentBuyList", rentBuyList);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = rentDAO.getMyRentTotalCount(cri, userId, "구매");
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		System.out.println("memRentList:: pageMaker : "+pageMaker);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/memRentList";
	}
  //회원 내정보 - 대여 내역 검색
    @RequestMapping(value = "/member/mem/memRentList", method = RequestMethod.POST)
	public String memRentListPro(Criteria cri, Model model,HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		
		// 대여 정보 가져오기
		List<RentVO> rentList = rentDAO.rentListByMidAndSearch(cri, userId, "구매");
		System.out.println("rentList size : " + rentList.size());
	
		// 모델에 추가
		model.addAttribute("rentList", rentList);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = rentDAO.getMyRentTotalCount(cri, userId, "구매");
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		System.out.println("memRentList:: pageMaker : "+pageMaker);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/memRentList";
	}
    
    
    
    //회원 내정보 - 구매 내역
    @RequestMapping(value = "/member/mem/memBuyList", method = RequestMethod.GET)
	public String memBuyListForm(Criteria cri, Model model,HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		
		// 대여 정보 가져오기
		List<RentVO> buyList = rentDAO.purchaseListByMidAndSearch(cri, userId, "구매");
		System.out.println("buyList size : " + buyList.size());
	
		// 모델에 추가
		model.addAttribute("buyList", buyList);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = rentDAO.getMyBuyTotalCount(cri, userId, "구매");

		System.out.println("memBuyList:: pageMaker : "+pageMaker);
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/memBuyList";
	}
    
  //회원 내정보 - 구매 내역 검색
    @RequestMapping(value = "/member/mem/memBuyList", method = RequestMethod.POST)
	public String memBuyListPro(Criteria cri, Model model,HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		
		// 대여 정보 가져오기
		List<RentVO> buyList = rentDAO.purchaseListByMidAndSearch(cri, userId, "구매");
		System.out.println("user Id : " + userId);
		for(RentVO buys : buyList) {
			System.out.println("buys : " + buys.toString());
		}
		// 모델에 추가
		model.addAttribute("buyList", buyList);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = rentDAO.getMyBuyTotalCount(cri, userId, "구매");

		System.out.println("memBuyList:: pageMaker : "+pageMaker);
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/memBuyList";
	}
    
    @RequestMapping(value = "/pythonTest", method = RequestMethod.GET)
   	public String adminPythonTest(Model model,HttpSession session) throws IOException, InterruptedException{
//   		String command = "C:\\ProgramData\\Anaconda3\\python.exe";
//   		String arg1 = "C:\\FinalProject\\UFO\\src\\main\\webapp\\resources\\python\\pythonTest.py";
//    	//String arg1 = "C:\\FinalProject\\UFO\\src\\main\\webapp\\resources\\python\\pythonTest2.py";
//    	ProcessBuilder builder = new ProcessBuilder(command, arg1);
//    	builder.redirectErrorStream(true);  // 표준 에러도 표준 출력에 쓴다
//    	Process process = builder.start();
//    	int exitVal = process.waitFor();
//    	
//    	BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "utf-8")); // 서브 프로세스가 출력하는 내용을 받기 위해
//    	StringBuilder buffer = new StringBuilder(); 
//    	String line = "";
//    	System.out.println("pythonTest :: while문 앞 :" + line);
//    	while ((line = br.readLine()) != null) {
//    		buffer.append(line + ",");
//    	     System.out.println(">>>  " + buffer.toString()); // 표준출력에 쓴다
//    	}
//    	System.out.println("pythonTest :: while문 뒤 :" + process.exitValue());
//    	model.addAttribute("status", "결과 확인");
//    	model.addAttribute("line",buffer.toString());
//    	if(exitVal != 0) {
//    	  // 비정상 종료
//    	  System.out.println("서브 프로세스가 비정상 종료되었다.");
//    	}
    	
    	String filePath = "C:\\FinalProject\\UFO\\src\\main\\webapp\\resources\\python\\pythonTest3.py";      
        ProcessBuilder pb = new ProcessBuilder()
            .command("python", "-u", filePath, "main33");        
        Process p = pb.start(); 
        BufferedReader in = new BufferedReader(
            new InputStreamReader(p.getInputStream(),"euc-kr")); 
        String line = null;
        StringBuilder output = new StringBuilder();
        while ((line = in.readLine()) != null) {
            output.append(line);
            output.append('\n');
        }
        
        int exitCode = p.waitFor();
        System.out.println("value is : " + output);
        System.out.println("Process exit value:"+exitCode);        
        in.close();
    	model.addAttribute("status", "결과 확인");
    	model.addAttribute("line",output);
    	return "/member/mem/pythonTest";
   	}
	// 성훈 end

}
