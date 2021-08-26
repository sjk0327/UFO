package com.use.first.buy;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.use.first.member.UserDAO;
import com.use.first.member.UserInfoVO;
import com.use.first.product.ProductDAO;
import com.use.first.product.ProductVO;
import com.use.first.rent.RentDAO;
import com.use.first.rent.RentVO;

@Controller
public class BuyController {
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   @RequestMapping(value = "/customer/buyInsert" , method = RequestMethod.POST)
   public String buyInsert(Model model, @Param("BuyVO") BuyVO buyVO, @Param("m_id") String m_id, @Param("m_point") String m_point, @Param("total") String total, HttpServletRequest request) throws Exception {

      BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
      UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
      RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
      ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
      
      System.out.println(buyVO.toString());
      
      String[] b_mid = buyVO.getB_mid().split(",");
      String[] b_pid = buyVO.getB_pid().split(",");
      String[] b_mname = buyVO.getB_mname().split(",");
      String[] b_maddr = buyVO.getB_maddr().split("@@,|@@");
      String[] b_mtel = buyVO.getB_mtel().split(",");
      String[] b_amountArray = buyVO.getB_amount().split(",");
      String[] b_how = buyVO.getB_how().split(",");
      String[] b_state = buyVO.getB_state().split(",");
      String[] b_purchase = buyVO.getB_purchase().split(",");
      String[] b_message = buyVO.getB_message().split(",");
      int[] b_amount=new int[b_amountArray.length];
      
      for(int i=0;i<b_amountArray.length;i++) {
    	  int amount=Integer.parseInt(b_amountArray[i]);
    	  
    	  b_amount[i]=amount;
    
      }
      
      
      
      for(int i = 0; i < b_mid.length; i++) {
         
         RentVO rentVO = new RentVO();
         
         if(b_state[i].equals("대여")) {
            
            rentVO.setR_mid(b_mid[i]);
            rentVO.setR_pid(b_pid[i]);
            rentVO.setR_rent(b_amount[i]);
            rentVO.setR_state("대여중");
            
         } else if(b_state[i].equals("구매")) {
            
            rentVO.setR_mid(b_mid[i]);
            rentVO.setR_pid(b_pid[i]);
            rentVO.setR_rent(b_amount[i]);
            rentVO.setR_state("즉시 구매");
            
         }
         rentDAO.rentInsert(rentVO);
         int rid = rentDAO.rentSelect();
         
         buyVO = new BuyVO();
         
         buyVO.setB_mid(b_mid[i]);
         buyVO.setB_pid(b_pid[i]);
         buyVO.setB_rid(rid);
         buyVO.setB_mname(b_mname[i]);
         buyVO.setB_maddr(b_maddr[i]);
         buyVO.setB_mtel(b_mtel[i]);
         buyVO.setB_amount(Integer.toString(b_amount[i]));
         buyVO.setB_how(b_how[i]);
         buyVO.setB_state(b_state[i]);
         buyVO.setB_purchase(b_purchase[i]);
         buyVO.setB_message(b_message[i]);
         
         buyDAO.buyInsert(buyVO);
         
      }
      
      for(int i = 0; i < b_pid.length; i++) {
    	  if(b_state[i].equals("대여")) {
    		  
    		  ProductVO productVO = productDAO.productInfo(b_pid[i]);
    		  
    		  int b_amount1 = (productVO.getP_canRent() - b_amount[i]);
    		  int b_amount2 = (productVO.getP_canBuy() - 0);
    		  
    		  productDAO.productUpdatebuy(b_amount1, b_amount2, b_pid[i]);
    		  
    	  } else if(b_state[i].equals("구매")) {
    		  
    		  ProductVO productVO = productDAO.productInfo(b_pid[i]);
    		  int b_amount1 = (productVO.getP_canRent() - 0);
    		  int b_amount2 = (productVO.getP_canBuy() - b_amount[i]);
    		  
    		  productDAO.productUpdatebuy(b_amount1, b_amount2, b_pid[i]);
    		  
    	  }
      }
   
      userDAO.memUpdateBuy(m_id, m_point);
      
      model.addAttribute("total", total);
      
      return "/member/rent/buysuccess";
   }
   
   @RequestMapping(value = "/buy/addr/{list}")
	public String addrList(Model model, HttpSession session, @PathVariable("list") int list) {
		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
		
		UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
		String userId=userInfo.getM_id();
		
		List<BuyVO> addrList = buyDAO.addrList(userId);
		
		ArrayList<Integer> alist = new ArrayList<Integer>();
		
		for(int i = 0; i < list; i++) {
			alist.add(i);
		}
		
		model.addAttribute("alist", alist);
		model.addAttribute("addrList", addrList);

		
		return "/member/rent/addr";
	}
   
   
   
   

}