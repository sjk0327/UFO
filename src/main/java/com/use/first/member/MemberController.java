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
 * 8.12??? ?????? ?????? - ?????? start ????????? ?????? ???????????? ?????? ?????? start ????????? ????????? ???????????? ?????? ????????? ???????????? ??????
 * ????????? ????????? ????????? ?????? userInfo ?????? ?????? ?????????
 */
@Controller
public class MemberController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private KakaoAPI kakao;

	// ?????? start

	// ??????
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginG(UserVO user, Model model, HttpSession session) {
		model.addAttribute("user", user);

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("?????????:" + naverAuthUrl);
		// ?????????
		model.addAttribute("url", naverAuthUrl);

		if (session.getAttribute("userName") != null) {
			return "redirect:/";
		} else {
			return "/enterance/login";
		}
	}
	
	// UFO ?????? ????????? ??????
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
	
	// UFO ?????? ?????????
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpSession session,HttpServletRequest request) {
		model.addAttribute("user", vo);

		// 08??? 13??? ????????? : ??????????????? ????????? ?????????????????????, ?????? ????????? ??????????????? ?????? ????????????. ????????? ???
//		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
//		List<RentVO> returnList = rentDAO.returnList();
//		List<RentVO> lateList = rentDAO.lateList();
		//????????????
		
		String referer =request.getHeader("referer");
		System.out.println("referer::"+referer);
		String s1 = referer;
		System.out.println("beforeUrl::"+s1);
		
		//???????????? ???????????? ????????? ??????
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
				//????????????
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				if(s1.contains("/member/cartInsert")) {
					String[] paramArray = s1.split("/");			
					for(int i=0;i<paramArray.length;i++) {
					System.out.println(paramArray[i]);
					}
					System.out.println("???????????????:::"+paramArray[3]);  //c_vid productDetail??????
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
				//???????????? ????????????
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

	// ??????????????????
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLoginG(UserVO user, Model model, HttpSession session, @RequestParam("code") String code,
			HttpServletResponse response) throws IOException {
		model.addAttribute("user", user);
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		System.out.println("dao.duplicateCheckId(\"email\")::::" + dao.duplicateCheckId("email"));
		// ?????????????????? ???????????? ????????? ??? ????????? ?????? ???????????? ?????? ??????
		String id = "";
		if (userInfo.get("email") != null && !userInfo.get("email").equals("")) {
			System.out.println("kakaoLoginG if??? in!!!!");
			String email = (String) userInfo.get("email");
			String[] devid = email.split("@");
			id = "kakao " + devid[0];

			session.setAttribute("loginPl", "kakao");
			// ???????????? ????????? ??????	- ????????? kakaoJoin?????? ??????		
			//					- ????????? regtype ??????		- ??????????????? ?????????  ??? db ????????? ?????????				
			//											- ??????????????? ????????? ????????? ????????? ????????? ?????????
			//							
			int isUFO = -1;
			int isKakao = -1;
			List<UserVO> userList = dao.duplicateCheckEmail(email);
			for(int i = 0; i < userList.size(); i++) {
				System.out.println("kakaoLogin :: users :" + userList.get(i).toString());
				if(userList.get(i).getM_regtype().equals("?????????")){
					isKakao = i;
				}
				if(userList.get(i).getM_regtype().equals("????????????")){
					isUFO = i;
				}
			}
			
			UserInfoVO infoVO;
			if(isKakao == -1) {	
				infoVO = new UserInfoVO(id, userInfo.get("nickname").toString());
				session.setAttribute("userInfo", infoVO);
				int b = email.indexOf("@");
				int e = email.lastIndexOf(".");
				String emailFront = ""; 
				if (b > 0 && e > 0) {
					emailFront = email.substring(b + 1, e);
				}
				System.out.println("kakaoLogin :: go kakaoJoin : ????????? ???????????? ????????? ??? ??? ??????, DB??? ??????");
				String gender = userInfo.get("gender").toString();
				
				return "redirect:/kakaoJoin/" + emailFront + "/" + gender;
			}else {
				if(isUFO == -1) {
					infoVO =  new UserInfoVO(userList.get(isKakao).getM_id(), userList.get(isKakao).getM_name());
					session.setAttribute("userInfo", infoVO);
					System.out.println("kakaoLogin :: go Index : ?????? ?????? ???????????? ??????????????? ????????? ??????, UFO??? ????????? ?????? ??????");
					return "redirect:/";
				}else {
					
						//????????? ???????????? ?????? ?????? ??????

						System.out.println("kakaoLogin :: go kakaoLink : ?????? ?????? ???????????? ??????????????? ????????? ??????, UFO??? ????????? ?????? ??????");
										
						infoVO =  new UserInfoVO(userList.get(isKakao).getM_id(), userList.get(isKakao).getM_name());
						session.setAttribute("userInfo", infoVO);
						return "redirect:/";
					}
					
				
			}
			
		} else {
			System.out.println("kakaoLoginG else??? in!!!!");
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>action_popup.alert('??????????????? ??????????????????'); location.href='redirect:/login'; </script>");
			out.flush();
			return null;
		}
	}


	// ????????? ????????????
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
			email = "????????????";
		user.setM_email(email);
		if (gender.equals("M") || gender.equals("male"))
			gender = "??????";
		else if (gender.equals("F") || gender.equals("female"))
			gender = "??????";
		else
			gender = "????????????";
		user.setM_gender(gender);
		user.setM_addr("");
		int n = dao.kakaoJoin(user);

		if (n == 0) {
			System.out.println("?????? ??????");
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

	// ????????? ?????????
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("????????? callback");
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		if (oauthToken != null) {
			// 1. ????????? ????????? ????????? ????????????.
			apiResult = naverLoginBO.getUserProfile(oauthToken); // String????????? json?????????
			/**
			 * apiResult json ?????? {"resultcode":"00", "message":"success",
			 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			 **/

			System.out.println("naver apiResult : " + apiResult);
			// 2. String????????? apiResult??? json????????? ??????
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			// 3. ????????? ??????
			// Top?????? ?????? _response ??????
			JSONObject response_obj = (JSONObject) jsonObj.get("response");
			// response??? nickname??? ??????
			String email = (String) response_obj.get("email");
			String name = (String) response_obj.get("name");
			String gender = (String) response_obj.get("gender");
			String mobile = (String) response_obj.get("mobile");
			// 4.?????? ????????? ???????????? ??????
			session.setAttribute("loginPl", "naver");
			model.addAttribute("result", apiResult);
			String[] devid = email.split("@");
			String id = "naver " + devid[0];
			// ???????????? ????????? ??????	- ????????? kakaoJoin?????? ??????		
			//					- ????????? regtype ??????		- ??????????????? ?????????  ??? db ????????? ?????????				
			//											- ??????????????? ????????? ?????? ?????? m_kakakolink ??????
			//							
			int isUFO = -1;
			int isNaver = -1;
			List<UserVO> userList = dao.duplicateCheckEmail(email);
			for(int i = 0; i < userList.size(); i++) {
				System.out.println("NaverLogin :: users :" + userList.get(i).toString());
				if(userList.get(i).getM_regtype().equals("?????????")){
					isNaver = i;
				}
				if(userList.get(i).getM_regtype().equals("????????????")){
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
					//????????? ???????????? ?????? ?????? ??????
							
					infoVO =  new UserInfoVO(userList.get(isNaver).getM_id(), userList.get(isNaver).getM_name());
					session.setAttribute("userInfo", infoVO);
					
					return "redirect:/";
					
				}
			}
			
		} else {
			return "/enterance/login";
		}
	}

	// ????????? ????????????
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
			email = "????????????";
		user.setM_email(email);
		if (gender.equals("M") || gender.equals("male"))
			gender = "??????";
		else if (gender.equals("F") || gender.equals("female"))
			gender = "??????";
		else
			gender = "????????????";
		user.setM_gender(gender);
		user.setM_tel(mobile);
		user.setM_addr("");
		int n = dao.naverJoin(user);

		if (n == 0) {
			System.out.println("?????? ??????");
		}

		return "redirect:/";

	}

	// UFO??? ????????? ??????
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
			email = "????????????";
		user.setM_email(email);
	

		int n = dao.kakaoJoin(user);

		if (n == 0) {
			System.out.println("?????? ??????");
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

	// ??? ??????

	@RequestMapping(value = "/member/mem/userInfo", method = RequestMethod.GET)
	public String userInfo(UserVO user, Model model, HttpSession session) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();

		UserVO userInfo = dao.userInfo(userId);

		model.addAttribute("userInfo", userInfo);

		List<RentVO> rentList = rentDAO.rentListByMid(userId, "??????");
		List<RentVO> purchaseList = rentDAO.purchaseListByMid(userId, "??????");
		List<MessageVO> messageList = messageDAO.messageByMid(userId);
		model.addAttribute("rentList", rentList);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("messageList", messageList);

		return "/member/mem/userInfo";
	}

	// ??? ?????? ??????

	@RequestMapping(value = "/member/mem/userInfo", method = RequestMethod.POST)
	public String userInfoUpdateByPath(Model model, UserVO userVO) throws IOException {
		System.out.println("?????? ???" + userVO.toString());
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

		//String path = "\\var\\lib\\tomcat8\\webapps\\UFO\\resources\\Images\\member\\";
		//String path = "\\resources\\uploads\\";
//		String path = "\\var\\lib\\tomcat8\\webapps\\UFO\\resources\\";
		// ?????? ?????????
		MultipartFile uploadFile = userVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			userVO.setM_img(uploadFile.getOriginalFilename());
			uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/UFO/resources/Images/member/" + userVO.getM_img()));
		}
		int n = dao.userUpdate(userVO);
		System.out.println("?????? ???" + userVO.toString());
		if (n != 1) {
			// ???????????? ?????? ???
			System.out.println("userInfoUpdateByPath // user ?????? ?????? // " + userVO.toString());
		}

		return "redirect:/member/mem/userInfo";
	}

	
	// ????????? ?????????
	
	@RequestMapping(value = "/member/mem/messageList", method = RequestMethod.GET)
	public String messageList(Model model, Criteria cri, HttpSession session) {
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		

		// ?????? ???????????? ???????????? ???????????? ????????? ???
		List<MessageVO> messageList = messageDAO.messageList(userId, cri);
		
		// ????????? ??????
		model.addAttribute("messageList", messageList);
		// PageMaker ?????? ??????
		PageMaker pageMaker = new PageMaker(cri);
		// ?????? ????????? ?????? ??????

		int totalCount = messageDAO.countMessageListTotal(userId, cri);
		// pageMaker??? ??????
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker.toString());
		// ????????? ??????
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/messageList";

	}



	
/*??????
	//????????? ????????????
	
	@RequestMapping(value = "/member/mem/messageList/{a_id}", method = RequestMethod.GET)
	public String messageDetail(Model model, HttpSession session, @PathVariable int a_id) {
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
		

		MessageVO message = messageDAO.messageInfo(a_id);
		
		
		model.addAttribute("message", message);
	
	
		return "/member/mem/messageDetail";
	}
*/
	
	//????????? ???????????? ?????? ?????? ?????? ?????? ???????????? 
	
		@RequestMapping(value = "/member/mem/messageList/{a_id}", method = RequestMethod.GET)
		public String messageDetail(Model model, HttpSession session, @PathVariable int a_id) {
			MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
			
            //?????? ???????????? ??????
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
	
	
	
	
	
	
	//??????????????????-??????????????????
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
		
	
		
	//????????? ??????
		@RequestMapping(value = "/member/mem/messageDelete/{a_id}", method = RequestMethod.POST)
		public String messageDelete(Model model, HttpSession session, @PathVariable int a_id) {
			MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);

			int n = messageDAO.messageDelete(a_id);
			
			if (n != 1) {
				// ?????? ?????? ???
				System.out.println("messageDelete // message ?????? ?????? // ");
			}

			
			return "redirect:/member/mem/messageList" ;
			
		}
		
		
		
		
		
		//?????? ??? ?????? 
		
		@RequestMapping(value = "/member/mem/accountDelete", method = RequestMethod.GET)
		public String accountDelete(Model model, UserVO userVO, HttpSession session, String userID)
				throws IOException {
			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

			UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
			String userId = infoVO.getM_id();

			int c = dao.userConfirm(userId);
			System.out.println("?????? ???" + userId.toString());

			if (c == 0) {
				return "/member/mem/accountDeleteAuth";
			} else {
				// ?????? ??????
				System.out.println("userConfirm // user ?????? ?????? // " + userId.toString());
				return "redirect:/member/mem/userInfo";
			}

		}
		
	
	// ?????? ??????
	
	
	@RequestMapping(value = "/member/mem/userDelete/{userID}", method = RequestMethod.POST)
	public String userDelete(Model model, UserVO userVO, HttpServletRequest request, HttpSession session, @PathVariable String userID)
			throws IOException {
		System.out.println("?????? ???" + userVO.toString());
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

				System.out.println("?????? ???" + userVO.toString());
				if (n != 1) {
					// ?????? ?????? ???
					System.out.println("userDelete // user ?????? ?????? // " + userVO.toString());
				}
				if (n2 != 1) {
					// ?????? ?????? ???
					System.out.println("userDelete // alertmessage ?????? ?????? // " + userId.toString());
				}
				if (n3 != 1) {
					// ?????? ?????? ???
					System.out.println("userDelete // cart ?????? ?????? // " + userId.toString());
				}
				if (n4 != 1) {
					// ?????? ?????? ???
					System.out.println("userDelete // wish ?????? ?????? // " + userId.toString());
				}
				if (n5 != 1) {
					// ?????? ?????? ???
					System.out.println("userDelete // rental ?????? ?????? // " + userId.toString());
				}
				if (n6 != 1) {
					// ?????? ?????? ???
					System.out.println("userDelete // buy ?????? ?????? // " + userId.toString());
				}
				if (n7 != 1) {
					// ?????? ?????? ???
					System.out.println("userDelete // review ?????? ?????? // " + userId.toString());
				}

				session.invalidate();

				return "/member/mem/accountDeleteComplete";
			} else {
				// ?????? ??????
				System.out.println("userConfirm // user ?????? ?????? // " + userId.toString());
				model.addAttribute("deleteFail",true);
				return "/member/mem/accountDeleteAuth";
			}

		}else {
			// ?????? ??????
			System.out.println("userConfirm // user ?????? ?????? // " + userId.toString());
			model.addAttribute("deleteFail",true);
			return "/member/mem/accountDeleteAuth";
		}
	}

		


	
	
	//????????? ??????
	
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
		int num = r.nextInt(999999); // ??????????????????
		
		if (vo.getM_name().equals(name) && vo.getM_email().equals(email) && vo.getM_regtype().equals("????????????")  ) {
			session.setAttribute("email", vo.getM_email());

			String setfrom = "usefirstown@gmail.com";
			String tomail = email; //????????????
			String title = "[UFO] ??????????????? ?????? ????????? ?????????"; 
			String content = System.getProperty("line.separator") + "??????????????? ?????????" + System.getProperty("line.separator")
					+ "UFO ??????????????? ??????????????? " + num + " ?????????." + System.getProperty("line.separator"); // 

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
	
		//????????? ???????????? ??????
		@RequestMapping(value = "/member/mem/id_set", method = RequestMethod.POST)
		public String id_set(@RequestParam(value="email_injeung") String email_injeung,
					@RequestParam(value = "num") String num, UserVO user, HttpSession session, Model model) throws IOException{
				
				if(email_injeung.equals(num)) {
					UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
					
					user.setM_email((String) session.getAttribute("email"));

					
					System.out.println("user?????? " + user);
					
					
					String info = dao.selectId(user);
					
					model.addAttribute("info", info);
					
					
					return "/member/mem/id_info";
				}
				else {
					return "/member/mem/id_find";
				}
		} 
		
		
		
			
			
			
			
	
	//???????????? ??????
	
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
		int num = r.nextInt(999999); // ??????????????????
		
		if (vo.getM_name().equals(name) && vo.getM_id().equals(id)  && vo.getM_email().equals(email) && vo.getM_regtype().equals("????????????")  ) {
			session.setAttribute("email", vo.getM_email());

			String setfrom = "usefirstown@gmail.com";
			String tomail = email; //????????????
			String title = "[UFO] ?????????????????? ?????? ????????? ?????????"; 
			String content = System.getProperty("line.separator") + "??????????????? ?????????" + System.getProperty("line.separator")
					+ "UFO ??????????????????(??????) ??????????????? " + num + " ?????????." + System.getProperty("line.separator"); // 

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
	
	
	//????????? ???????????? ??????
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
	
	
	//DB ???????????? ????????????
	@RequestMapping(value = "/member/mem/pw_new", method = RequestMethod.POST)
	public String pw_new(UserVO user, HttpSession session, HttpServletRequest request) throws IOException{
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		
		user.setM_email((String) session.getAttribute("email"));
		
		
		
		System.out.println("user?????? " + user);
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
	
	


	// ?????????
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLoginG(UserVO user, Model model, HttpSession session) {
		model.addAttribute("user", user);
		if (session.getAttribute("userName") != null) {
			if (session.getAttribute("userName").equals("?????????"))
				return "redirect:/admin";
			else
				return "/enterance/adminLogin";
		} else {
			return "/enterance/adminLogin";
		}
	}

	// ????????? ????????? ??????
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
	
	
	@RequestMapping(value = "/adminLogout2", method = RequestMethod.GET)
	public String adminLoginout2(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminIndex(UserVO vo, Model model, Criteria cri,HttpSession session) {

		//9???6??? ??????,?????? admin ????????? ?????? ??????

		
	//?????? ??????	
		DecimalFormat df = new DecimalFormat("00");
        Calendar currentCalendar = Calendar.getInstance();
      //?????????
        String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
        String monthago  = df.format(currentCalendar.get(Calendar.MONTH) - 1);

	UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		VisitCountDAO visitDAO = sqlSessionTemplate.getMapper(VisitCountDAO.class);
		Integer totalBuy = buyDAO.totalPurchase();
		if (totalBuy== null) {
			totalBuy=0;
		}
		
		List<RentVO> rentToBuyList =rentDAO.rentToBuyList();
		if(rentToBuyList.size()==0) {
			RentVO zerorent = new RentVO();
			zerorent.setR_pid("?????? ??????");
			zerorent.setP_category("?????? ??????");
			zerorent.setP_name("?????? ??????");
			zerorent.setTotal(1);
			rentToBuyList.add(zerorent);
		}
		List<BuyVO> threeMonthPurchase=buyDAO.threeMonthPurchase(month,monthago);
		List<BuyVO> threeMonthRentPurchase=buyDAO.threeMonthRentPurchase(month,monthago);
		List<BuyVO> threeMonthBuyPurchase=buyDAO.threeMonthBuyPurchase(month,monthago);
		BuyVO temp=new BuyVO();
		BuyVO temp2=new BuyVO();
		BuyVO temp3=new BuyVO();
		List<BuyVO> threeMonthPurchase2=new ArrayList<BuyVO>();
		List<BuyVO> threeMonthRentPurchase2=new ArrayList<BuyVO>();
		List<BuyVO> threeMonthBuyPurchase2=new ArrayList<BuyVO>();
		//3?????? ????????? ?????????
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

		//3?????? ?????? ?????? ?????????
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
		
		//3?????? ?????? ?????? ?????????
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
			
			count=-1;
			for(int k=0;k<threeMonthBuyPurchase.size();k++) {
				if(threeMonthBuyPurchase.get(k).getB_month().equals(Integer.toString(Integer.parseInt(monthago)+1))) {
					count=k;
				}
			}
			if(count==-1) {
				System.out.println("?????????");
				temp2.setB_month(Integer.toString(Integer.parseInt(monthago)+1));
				temp2.setB_purchase("0");
				threeMonthBuyPurchase2.add(1,temp2);
			}else {
				
				threeMonthBuyPurchase2.add(1,threeMonthBuyPurchase.get(count));
			}
		
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
	//?????? ???	

	
		int listCount = dao.countMemListTotal(cri);
		//int listCount = list.size();
		model.addAttribute("listCount", listCount);
		System.out.println(listCount + "listCount");		
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
		
		System.out.println("9??? ?????????" + sm+ltt+cm+wc+tb);		
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

		// ?????? ???????????? ???????????? ???????????? ????????? ???
		List<UserVO> list = dao.memList(cri);
		// ????????? ??????
		model.addAttribute("memList", list);
		// PageMaker ?????? ??????
		PageMaker pageMaker = new PageMaker(cri);
		// ?????? ????????? ?????? ??????

		int totalCount = dao.countMemListTotal(cri);
		// pageMaker??? ??????
		pageMaker.setTotalCount(totalCount);
		// ????????? ??????
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/mem/memList";

	}

	@RequestMapping(value = "/admin/mem/memList", method = RequestMethod.POST)
	public String adminMemListSearch(Criteria cri, Model model) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

		// ?????? ???????????? ???????????? ???????????? ????????? ???
		List<UserVO> list = dao.memList(cri);
		System.out.println(list.toString());
		// ????????? ??????
		model.addAttribute("memList", list);
		// PageMaker ?????? ??????
		PageMaker pageMaker = new PageMaker(cri);
		// ?????? ????????? ?????? ??????

		int totalCount = dao.countMemListTotal(cri);
		// pageMaker??? ??????
		pageMaker.setTotalCount(totalCount);
		System.out.println("adminMemListSearch :: pageMaker : " +pageMaker.toString());
		
		// ????????? ??????
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/mem/memList";
	}

	// ?????? end

	// ?????? start
	// ????????? ?????? ?????? ?????? ??????
//	@RequestMapping(value = "/admin/mem/memDetail", method = RequestMethod.GET)
//	public String adminMenDetail(Model model, @RequestParam String m_id) {
//		System.out.println("admin/mem/memDetail // ???????????? ??????");
//		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
//		UserVO userInfo = dao.memInfo(m_id);
//
//		model.addAttribute("userInfo", userInfo);
//
//		return "/admin/mem/memDetail";
//	}
	// ????????? ?????? ?????? ?????? ??????
	@RequestMapping(value = "/admin/mem/memDetail/{m_id}", method = RequestMethod.GET)
	public String adminMenDetailByPath(Model model, @PathVariable String m_id) {
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		System.out.println("m_id " + m_id);
		// User ?????? ????????????
		System.out.println("adminMenDetailByPath() // ???????????? ????????????");
		UserVO userVO = userDAO.memInfo(m_id);
		// ?????? ?????? ????????????
		System.out.println("userVO : " + userVO.toString());
		System.out.println("adminMenDetailByPath() // ???????????? ????????????");

		List<RentVO> rentList = rentDAO.rentListByMid(m_id, "??????");
		System.out.println("rentList size : " + rentList.size());
		// ?????? ?????? ????????????
		System.out.println("adminMenDetailByPath() // ???????????? ????????????");

		List<RentVO> purchaseList = rentDAO.purchaseListByMid(m_id, "??????");
		System.out.println("purchaseList size : " + purchaseList.size());
		model.addAttribute("userVO", userVO);
		model.addAttribute("rentList", rentList);
		model.addAttribute("purchaseList", purchaseList);

		return "/admin/mem/memDetail";
	}

	// ????????? ?????? ?????? ???????????? ?????? ??????
	@RequestMapping(value = "/admin/mem/memDetail/{userID}", method = RequestMethod.POST)
	public String adminMenUpdateByPath(Model model, UserVO userVO, @PathVariable String userID) throws IOException {
		System.out.println("?????? ???" + userVO.toString());
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		// ?????? 
		MultipartFile uploadFile = userVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			userVO.setM_img(uploadFile.getOriginalFilename());
			uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/UFO/resources/Images/member/" + userVO.getM_img()));
		}

		int n = dao.memUpdate(userVO);
		System.out.println("?????? ???" + userVO.toString());
		if (n != 1) {
			// ???????????? ?????? ???
			System.out.println("adminMenUpdateByPath // member ?????? ?????? // " + userVO.toString());
		}

		return "redirect:/admin/mem/memDetail/" + userID;
	}

	// ?????? ?????? ???
	/*@RequestMapping(value = "/member/mem/memJoin", method = RequestMethod.GET)
	public String menJoinForm(Model model) {

		return "/member/mem/memJoin";
	}*/
	@RequestMapping(value = "/member/mem/memJoin", method = RequestMethod.GET)
	public String menJoinForm(Model model, HttpServletRequest request) {
		//????????????  (?????? ???????????? ?????? ????????????)
		String referer =request.getHeader("referer");
		if(referer!=null) {
		String s1 = referer; 
		model.addAttribute("beforeUrl", s1);}	
		//?????? ????????????
		return "/member/mem/memJoin";		
	}

	// ?????? ?????? - ????????? ?????? ??????
	@ResponseBody
	@RequestMapping(value = "/member/mem/idCheck", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> menIdCheck(Model model, @RequestBody String m_id) throws Exception {
		System.out.println("ajax ?????? / memIdCheck");
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		Map<Object, Object> map = new HashMap<Object, Object>();
		int result = dao.duplicateCheckId(m_id);

		map.put("check", result);

		return map;
	}
	
	// ?????? ?????? - ????????? ?????? ??????
	@ResponseBody
	@RequestMapping(value = "/member/mem/emailCheck", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> menEmailCheck(Model model, @RequestBody String m_email) throws Exception {
		System.out.println("ajax ?????? / menEmailCheck");
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		Map<Object, Object> map = new HashMap<Object, Object>();
		List<UserVO> userList = dao.duplicateCheckEmail(m_email);
		System.out.println("menEmailCheck :: userList.size() :" + userList.size());
		map.put("ufo", false);
		map.put("kakao", false);
		map.put("naver", false);
		
		for(UserVO user : userList) {
			if(user.getM_regtype().equals("????????????")) {
				map.replace("ufo", true);
			}
			if(user.getM_regtype().equals("?????????")) {
				map.replace("kakao", true);
			}
			if(user.getM_regtype().equals("?????????")) {
				map.replace("naver", true);
			}
			
		}
		System.out.println("menEmailCheck :: ufo :" + map.get("ufo") + " kakao :" + map.get("kakao") + " naver :" + map.get("naver"));
		return map;
	}

	// ?????? ?????? - ????????? ??????
	@Autowired
	private JavaMailSender javaMailSender;

	@ResponseBody
	@RequestMapping(value = "/member/mem/memEmailSend", method = RequestMethod.POST, produces = "application/json")
	public String menEmailSend(Model model, @RequestBody String m_email) {
		System.out.println("ajax ?????? / menEmailCheck");

		// ?????? ?????? ?????????
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
			helper.setSubject("[UFO]???????????? ????????? ?????? ?????? ?????????.");
			String content = System.getProperty("line.separator") 
					+ "??????????????? ?????????" + System.getProperty("line.separator")
					+ "UFO ????????? ??????????????? " + AuthenticationKey + " ?????????." + System.getProperty("line.separator"); // 
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			System.out.println("catch ???");
			e.printStackTrace();
		}

		System.out.println("email send success");
		return AuthenticationKey;

	}

	// ?????? ?????? submit
	@RequestMapping(value = "/member/mem/memJoin", method = RequestMethod.POST)
	public String menJoinPro(Model model, UserVO userVO, @RequestParam String beforeUrl) throws IOException {
		
		System.out.println("?????? ???" + userVO.toString());
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		// ?????? ?????????
		MultipartFile uploadFile = userVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			userVO.setM_img(uploadFile.getOriginalFilename());
			uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/UFO/resources/Images/member/" + userVO.getM_img()));
		}
		userVO.setM_regtype("????????????");
		int n = dao.memJoin(userVO);
		System.out.println("?????? ???" + userVO.toString());
		if (n != 1) {
			// ???????????? ?????? ???
			System.out.println("menJoinPro // member ???????????? // " + userVO.toString());
		}
		//?????? ??????
		if(beforeUrl.contains("/member/cartInsert")) {
			return "redirect:"+beforeUrl;
			} else if (beforeUrl.contains("/member/wishListInsert")){
			return "redirect:"+beforeUrl;
			}  else if (beforeUrl.contains("/member/rent/buy")){
			return "redirect:"+beforeUrl;
			} else {
		return "member/mem/join_complete";
			}
		//??????????????? (return??? ????????? else??? ??????)
	}

	// ?????? ?????? ?????? - ?????? ?????? ??????
	// method ??? Post ??? ???????????? ??????.
	@RequestMapping(value = "/member/mem/memRentDetail/{r_id}", method = RequestMethod.GET)
	public String memRentDetail(Model model, @PathVariable int r_id) {

		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);

		//????????? ??????????????? ???????????? ?????? ??????
		RentVO rentBuy=rentDAO.rentToBuyListByrid(r_id);
		// ????????? ?????? ?????? ????????????
		RentVO rentVO = rentDAO.rentInfo(r_id);
		System.out.println("memController - memRentDetail - rentVO : " + rentVO.toString());
		// ????????? ?????? ?????? ?????? ????????????
		ProductVO productVO = productDAO.productInfo(rentVO.getR_pid());
		System.out.println("memController - memRentDetail - productVO : " + productVO.toString());
		// ????????? ????????? ?????? ?????? ????????????
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

    
    
  //?????? ?????? ?????? - ?????? ?????? ?????? - ??????
    @RequestMapping(value ="/member/mem/memRentReturn/{r_id}", method = RequestMethod.GET)
	public String memRentReturn(Model model, @PathVariable int r_id) throws Exception{

		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		System.out.println("memController - memRentReturn  :  ?????? ?????? ?????? ????????????");
		// ????????? ?????? ?????? ????????????
		RentVO rentVO = new RentVO();
		rentVO.setR_id(r_id);
		rentVO.setR_state("?????? ??????");
		System.out.println("memController - memRentReturn new rentVO : " + rentVO.toString());

    	int result = rentDAO.rentUpdate(rentVO);
    	System.out.println("memController - memRentReturn result : " + result);
    	
    	
    	return "redirect:/member/mem/memRentDetail/"+r_id;
	}
    
    
    // ?????? ?????? ?????? - ?????? ?????? ?????? - ??????
    @RequestMapping(value ="/member/mem/memRentRefund/{r_id}", method = RequestMethod.GET)
   	public String memRentRefund(Model model, @PathVariable int r_id) throws Exception{
   		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
   		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
   		System.out.println("memController - memRentRefund  :  ?????? ?????? ?????? ????????????");
   		// ????????? ?????? ?????? ????????????
   		RentVO rentVO = rentDAO.rentInfo(r_id);
   		if(rentVO.getR_state().equals("?????????") || rentVO.getR_state() == "?????????") {
   			rentVO.setR_state("?????? ??????(??????)");
   		} else if(rentVO.getR_state().equals("?????? ??????") || rentVO.getR_state() == "?????? ??????") {
   			rentVO.setR_state("?????? ??????(?????? ??????)");
   		} else if(rentVO.getR_state().equals("?????? ??????") || rentVO.getR_state() == "?????? ??????") {
   			rentVO.setR_state("?????? ??????(?????? ??????)");
   		}
		System.out.println("memController - memRentReturn new rentVO : " + rentVO.toString());
    	int result = rentDAO.rentUpdate(rentVO);
   		System.out.println("memController - memRentRefund 1result : " + result);
    	
   		return "redirect:/member/mem/memRentDetail/" + r_id ;
   	}
    
    // ?????? ?????? ?????? - ?????? ?????? ?????? - ????????? ??????
    @RequestMapping(value ="/member/mem/memRentLate/{r_id}", method = RequestMethod.GET)
	public String memRentLate(Model model, @PathVariable int r_id, HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
		BuyInfoVO buyInfoVO = new BuyInfoVO();
		
		// ????????? ?????? ?????? ????????????
		RentVO rentVO = rentDAO.rentInfo(r_id);
		System.out.println("memController - memRentDetail - rentVO : " + rentVO.toString());

		// ????????? ?????? ??? ??????
		long gap = new Date().getTime() - rentVO.getR_sdate().getTime();
		int late = Double.valueOf(Math.floor(gap / (1000 * 60 * 60 * 24))).intValue();
		System.out.println(late+"late");
		int realLate=late-2;
		
		// ????????? ????????? ?????? ?????? ????????????
		List<BuyVO> buyList = buyDAO.buyList(rentVO.getR_id());
		int lateFee=Double.valueOf(Double.parseDouble(buyList.get(0).getB_purchase())*0.3).intValue();
		System.out.println(lateFee);
		
		
		//???????????? ?????? ????????? ????????? ??????
		UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
		String userId=userInfo.getM_id();
		
			
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		//?????? ????????? getter??? ?????????
		String productId=rentVO.getR_pid();
		// ?????? ???????????? ?????? ?????? ?????? ?????????
		ProductVO productVO=productDAO.productInfo(productId);
		//????????? ????????? ?????? ????????? BuyInfoBean??? setter??? ????????? 
		buyInfoVO.setProductId(productId);
		buyInfoVO.setProductPrice(lateFee);
		buyInfoVO.setProductImg(productVO.getP_mainImg());
		buyInfoVO.setProductName(productVO.getP_name());
		buyInfoVO.setBuyType("????????? ??????");
		buyInfoVO.setProamount(rentVO.getR_rent());
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		buyInfoVO.setRentdate(dateFormat.format(rentVO.getR_sdate()));
		//?????? ?????? ?????????
		UserVO userVO = userDAO.memInfo(userId);

		ArrayList<BuyInfoVO> buyInfoList = new ArrayList<BuyInfoVO>();
		buyInfoList.add(buyInfoVO);
		
		//????????? ??????
		model.addAttribute("buyInfoList", buyInfoList);
		model.addAttribute("userVO", userVO);
		model.addAttribute("r_id", r_id);
		return "member/rent/buy";
	}
		

    // ?????? ?????? ?????? - ?????? ?????? ??????
    @RequestMapping(value ="/member/mem/memBuyDetail/{r_id}", method = RequestMethod.GET)
   	public String memBuyDetail(Model model, @PathVariable int r_id) {
   		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
   		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
   		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
   		// ????????? ?????? ?????? ????????????

		RentVO rentVO = rentDAO.rentInfo(r_id);
		System.out.println("memController - memRentDetail - rentVO : " + rentVO.toString());
		// ????????? ?????? ?????? ?????? ????????????
				ProductVO productVO = productDAO.productInfo(rentVO.getR_pid());
				System.out.println("memController - memRentDetail - productVO : " + productVO.toString());
		// ????????? ????????? ?????? ?????? ????????????

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
    
    //?????? ????????? - ?????? ??????
    @RequestMapping(value = "/member/mem/memRentList", method = RequestMethod.GET)
	public String memRentListForm(Criteria cri, Model model,HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		
		// ?????? ?????? ????????????
		List<RentVO> rentList = rentDAO.rentListByMidAndSearch(cri, userId, "??????");
		List<RentVO> rentBuyList= rentDAO.rentbuyListByMid(userId);
		System.out.println("rentList size : " + rentList.size());
		System.out.println(rentBuyList.toString());
	
		// ????????? ??????
		model.addAttribute("rentList", rentList);
		model.addAttribute("rentBuyList", rentBuyList);
		// PageMaker ?????? ??????
		PageMaker pageMaker = new PageMaker(cri);
		// ?????? ????????? ?????? ??????
		int totalCount = rentDAO.getMyRentTotalCount(cri, userId, "??????");
		// pageMaker??? ??????
		pageMaker.setTotalCount(totalCount);
		System.out.println("memRentList:: pageMaker : "+pageMaker);
		// ????????? ??????
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/memRentList";
	}
  //?????? ????????? - ?????? ?????? ??????
    @RequestMapping(value = "/member/mem/memRentList", method = RequestMethod.POST)
	public String memRentListPro(Criteria cri, Model model,HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		
		// ?????? ?????? ????????????
		List<RentVO> rentList = rentDAO.rentListByMidAndSearch(cri, userId, "??????");
		System.out.println("rentList size : " + rentList.size());
	
		// ????????? ??????
		model.addAttribute("rentList", rentList);
		// PageMaker ?????? ??????
		PageMaker pageMaker = new PageMaker(cri);
		// ?????? ????????? ?????? ??????
		int totalCount = rentDAO.getMyRentTotalCount(cri, userId, "??????");
		// pageMaker??? ??????
		pageMaker.setTotalCount(totalCount);
		System.out.println("memRentList:: pageMaker : "+pageMaker);
		// ????????? ??????
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/memRentList";
	}
    
    
    
    //?????? ????????? - ?????? ??????
    @RequestMapping(value = "/member/mem/memBuyList", method = RequestMethod.GET)
	public String memBuyListForm(Criteria cri, Model model,HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		
		// ?????? ?????? ????????????
		List<RentVO> buyList = rentDAO.purchaseListByMidAndSearch(cri, userId, "??????");
		System.out.println("buyList size : " + buyList.size());
	
		// ????????? ??????
		model.addAttribute("buyList", buyList);
		// PageMaker ?????? ??????
		PageMaker pageMaker = new PageMaker(cri);
		// ?????? ????????? ?????? ??????
		int totalCount = rentDAO.getMyBuyTotalCount(cri, userId, "??????");

		System.out.println("memBuyList:: pageMaker : "+pageMaker);
		// pageMaker??? ??????
		pageMaker.setTotalCount(totalCount);
		// ????????? ??????
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/memBuyList";
	}
    
  //?????? ????????? - ?????? ?????? ??????
    @RequestMapping(value = "/member/mem/memBuyList", method = RequestMethod.POST)
	public String memBuyListPro(Criteria cri, Model model,HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		UserInfoVO infoVO = (UserInfoVO) session.getAttribute("userInfo");
		String userId = infoVO.getM_id();
		
		// ?????? ?????? ????????????
		List<RentVO> buyList = rentDAO.purchaseListByMidAndSearch(cri, userId, "??????");
		System.out.println("user Id : " + userId);
		for(RentVO buys : buyList) {
			System.out.println("buys : " + buys.toString());
		}
		// ????????? ??????
		model.addAttribute("buyList", buyList);
		// PageMaker ?????? ??????
		PageMaker pageMaker = new PageMaker(cri);
		// ?????? ????????? ?????? ??????
		int totalCount = rentDAO.getMyBuyTotalCount(cri, userId, "??????");

		System.out.println("memBuyList:: pageMaker : "+pageMaker);
		// pageMaker??? ??????
		pageMaker.setTotalCount(totalCount);
		// ????????? ??????
		model.addAttribute("pageMaker", pageMaker);
		return "/member/mem/memBuyList";
	}
    
    @RequestMapping(value = "/pythonTest", method = RequestMethod.GET)
   	public String adminPythonTest(Model model,HttpSession session) throws IOException, InterruptedException{
//   		String command = "C:\\ProgramData\\Anaconda3\\python.exe";
//   		String arg1 = "C:\\FinalProject\\UFO\\src\\main\\webapp\\resources\\python\\pythonTest.py";
//    	//String arg1 = "C:\\FinalProject\\UFO\\src\\main\\webapp\\resources\\python\\pythonTest2.py";
//    	ProcessBuilder builder = new ProcessBuilder(command, arg1);
//    	builder.redirectErrorStream(true);  // ?????? ????????? ?????? ????????? ??????
//    	Process process = builder.start();
//    	int exitVal = process.waitFor();
//    	
//    	BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "utf-8")); // ?????? ??????????????? ???????????? ????????? ?????? ??????
//    	StringBuilder buffer = new StringBuilder(); 
//    	String line = "";
//    	System.out.println("pythonTest :: while??? ??? :" + line);
//    	while ((line = br.readLine()) != null) {
//    		buffer.append(line + ",");
//    	     System.out.println(">>>  " + buffer.toString()); // ??????????????? ??????
//    	}
//    	System.out.println("pythonTest :: while??? ??? :" + process.exitValue());
//    	model.addAttribute("status", "?????? ??????");
//    	model.addAttribute("line",buffer.toString());
//    	if(exitVal != 0) {
//    	  // ????????? ??????
//    	  System.out.println("?????? ??????????????? ????????? ???????????????.");
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
    	model.addAttribute("status", "?????? ??????");
    	model.addAttribute("line",output);
    	return "/member/mem/pythonTest";
   	}
	// ?????? end

}
