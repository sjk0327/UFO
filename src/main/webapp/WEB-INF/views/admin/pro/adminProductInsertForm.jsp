<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>

<head>
    <title>관리자 상품추가</title>


  
<%@ include file="/WEB-INF/views/adminHeader.jsp" %>
  </head>
  
  <body>
  <!-- Pre-loader start -->
  <div class="theme-loader">
      <div class="loader-track">
          <div class="preloader-wrapper">
              <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
              <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Pre-loader end -->
  
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <%@ include file="/WEB-INF/views/adminNav.jsp" %>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
    	<%@ include file="/WEB-INF/views/adminMenu.jsp" %>
                  
                  
                  
                  
                  
                  
                  
                  
                  <div class="pcoded-content">
                      <!-- Page-header start -->
         
                      <!-- Page-header end -->
       <form:form method="post" action="productInsert"  modelAttribute="productVO">
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">

    
                              
                    
    
                                            <!--  project and team member start -->
                                            
              
                                            <div class="col-xl-10 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>상품등록</h5>
                                                        
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="table-responsive col-xl-12">
                                                             <script src="https://kit.fontawesome.com/848d8f1fa9.js" crossorigin="anonymous"></script>
   	 <div class="container-fluid col-xl-12" style="text-align: center;">
   

      <div class="col-lg-12">
         <div
            class="col-1 col-lg-1   flex-column flex-shrink-0 p-3 bg-light "
            style="width: 250px;"></div>

         <main class="col-12  ms-sm-auto col-lg-12">
         <div class="row g-5" id="topmarin">

            <div class="col-md-12">
               <div class="container" >
                  <div class="row">
                
                     <div class="col-12 row">
                     <div class="col-8">
                         <div class="p-4 mb-8 col-lg-12">
                              <img src="/resources/img/${productVO.p_mainImg}" width="50%" height="50%"
							alt="${ productVO.p_mainImg }" title="${ productVO.p_mainImg }" class="img-fluid"> 
							          
                        </div>
                     <div>
				  	 <form:input path="p_mainImg" type="file" accpet=".gif, .jpg, .png"/>		
				   	</div>   
                        </div>
                    <div class="col-4">
                   <br><br>
                   <div style="text-align: left; font-weight: bold; font-size: 15pt;">
                    <label for="p_id">상품 I  D <form:input path="p_id" type="text" id="p_id" size="10"/></label>    
                    <div><label for="p_name">상품이름<form:input path="p_name" type="text" id="p_name" size="10"/></label></div>
					<div><label for="p_price">상품가격<form:input path="p_price" type="text"  id="p_price" size="10"/></label></div>
					<div><label for="p_canBuy">구매가능<form:input path="p_canBuy" type="number"  id="p_canBuy" size="10"/></label></div> 
					<div><label for="p_canRent">대여가능<form:input path="p_canRent" type="number"  id="p_canRent" size="10"/></label></div> 
           		    <div><label for="p_category">카테고리
           		    <form:select path="p_category" id="p_category">
           		     <form:option value="스마트폰">스마트폰</form:option>
           		     <form:option value="노트북">노트북</form:option>
           		     <form:option value="태블릿">태블릿</form:option>
           		     <form:option value="스마트워치">스마트워치</form:option>
           		     <form:option value="카메라">카메라</form:option>
           		    </form:select>
           		    </label></div>  
					<input type="submit" value="등록">&nbsp;&nbsp;&nbsp;  
					<button type="reset">취소</button>
                    </div>                 
       
				
             
                  
                   </div>
                  </div>
                 
                   <div class="rows col-12">	 <hr>				
				  	<img src="/resources/img/${ productVO.p_subImg }"
							alt="${ productVO.p_subImg }" title="${ productVO.p_subImg }" class="img-fluid">	
								
				   </div>
				   <div class="rows col-12">
				   <form:input path="p_subImg" type="file" accpet=".gif, .jpg, .png"/>		
				   </div>
				   <div class="rows col-12"><br><br>
				   <pre><textarea name="p_content" cols="50" rows="30" style="border: none">${ productVO.p_content }</textarea></pre>
				   </div>
               
      </div>
      </div>
              </div>        
                </div>    
         </main>
         <main class="col-12 col-lg-1 ms-sm-auto  px-md-4 bg-light"></main>
         </div>
   </div></div></div></div></div></div>
   
                                                          
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
   				</form:form>
                                            <!--  project and team member end -->
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                     
                            </div>
                        </div>
                        
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>
	jQuery(function($) {
	    var targetText = "${productVO.p_category}";    
	    var targetVal = $('#p_category option:contains(' + targetText + ')').val();   
	    $('#p_category').val(targetVal);   
	});


	function productDelete(p_id) {
	if (confirm(' 상품을 삭제하시겠습니까?')) {
		location.href = 'admin/pro/productDelete/${productVO.p_id }';
	}
}
	function fn_delRow(chkObjNm) { 
		﻿  if ($("input[name="+chkObjNm+"]").is(":checked")){ 
		﻿  if (confirm("삭제 하시겠습니까?")) { 
		﻿        for(var i=$("[name='"+chkObjNm+"']:checked").length-1; i>-1; i--){ 

		﻿                    $("[name='"+chkObjNm+"']:checked").eq(i).closest("tr").remove(); 

		                }﻿ 

		            }﻿ 

		         } else { 

		﻿            alert("선택된 데이터가 없습니다.");  

		         }﻿ 

		    }﻿ 
</script>
  
    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
    
</body>

</html>
