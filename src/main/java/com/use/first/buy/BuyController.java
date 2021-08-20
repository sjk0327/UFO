package com.use.first.buy;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.use.first.member.UserDAO;
import com.use.first.rent.RentDAO;
import com.use.first.rent.RentVO;

@Controller
public class BuyController {
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   @RequestMapping(value = "/customer/buyInsert", method = RequestMethod.POST)
   public String buyInsert(Model model,@Param("BuyVO") BuyVO buyVO, @Param("m_id") String m_id, @Param("m_point") String m_point, @Param("m_tel") String m_tel, @Param("m_addr") String m_addr) throws Exception {
      BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
      UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
      RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
      
      String[] b_mid = buyVO.getB_mid().split(",");
      String[] b_pid = buyVO.getB_pid().split(",");
      String[] b_amount = buyVO.getB_amount().split(",");
      String[] b_how = buyVO.getB_how().split(",");
      String[] b_state = buyVO.getB_state().split(",");
      String[] b_purchase = buyVO.getB_purchase().split(",");
      String[] b_message = buyVO.getB_message().split(",");
      
      for(int i = 0; i < b_mid.length; i++) {
         
         RentVO rentVO = new RentVO();
         
         if(b_state[i].equals("대여")) {
            
            rentVO.setR_mid(b_mid[i]);
            rentVO.setR_pid(b_pid[i]);
            rentVO.setR_state("대여중");
            
         } else if(b_state[i].equals("구매")) {
            
            rentVO.setR_mid(b_mid[i]);
            rentVO.setR_pid(b_pid[i]);
            rentVO.setR_state("즉시 구매");
            
         }
         rentDAO.rentInsert(rentVO);
         int rid = rentDAO.rentSelect();
         
         buyVO = new BuyVO();
         
         buyVO.setB_mid(b_mid[i]);
         buyVO.setB_pid(b_pid[i]);
         buyVO.setB_rid(rid);
         buyVO.setB_amount(b_amount[i]);
         buyVO.setB_how(b_how[i]);
         buyVO.setB_state(b_state[i]);
         buyVO.setB_purchase(b_purchase[i]);
         buyVO.setB_message(b_message[i]);
         
         buyDAO.buyInsert(buyVO);
         
      }
      userDAO.memUpdateBuy(m_id, m_point, m_tel, m_addr);
      
      
      return "/member/rent/buysuccess";
   }

}