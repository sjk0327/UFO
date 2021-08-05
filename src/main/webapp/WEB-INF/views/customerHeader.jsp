 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <header class="site-navbar" role="banner" >
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left" >
              <form action="" >
                <span class="icon icon-search2"></span>  
                <input type="text"  placeholder="Search" style="border-radius:5px; border: solid 2px grey;" >
              	<input type="submit" value="검색" style="border-radius:5px; border: solid 2px grey; background-color: white;">
              </form>
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center" >
              <div class="site-logo" >
                <a href="index.html" class="js-logo-clone" style="font-size: 20pt; font-weight: bold;" >UF&O</a>
              </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
            
              <div class="site-top-icons">
                <ul>
                  <li><a href="/longin">[ 로그인 ]</a></li>
                  <li><a href="/member/mem/memJoin">[ 회원가입 ]</a></li>
                   <li><a href="member/noticeList">[ 공지사항 ]</a></li>
                    <li><a href="member/qnaList">[ Q&A ]</a></li>
                 
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div> 
     
    </header>