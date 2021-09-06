<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>관리자 페이지</title>
     <%@ include file="/WEB-INF/views/adminHeader.jsp" %>
     <!-- 신영 chart.js cdn 삽입 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>

  <body>

<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
     <%@ include file="/WEB-INF/views/adminNav.jsp" %>
<div class="pcoded-main-container">
    <div class="pcoded-wrapper">

       <%@ include file="/WEB-INF/views/adminMenu.jsp" %>

<div class="pcoded-content">
   <div class="pcoded-inner-content">
          <!-- Main-body start -->
<div class="main-body">
    <div class="page-wrapper">
        <!-- Page-body start -->
<div class="page-body">
    <div class="row">
        <!-- task, page, download counter  start -->
<div class="col-xl-3 col-md-6">
    <div class="card">
        <div class="card-block">
            <div class="row align-items-center">
                <div class="col-8">

                    <h4 class="text-c-purple">${listCount}명</h4>

                    <h6 class="text-muted m-b-0">회원수</h6>
                </div>
                <div class="col-4 text-right">
                    <i class="fa fa-bar-chart f-28"></i>
                </div>
            </div>
        </div>
        <div class="card-footer bg-c-purple">
            <div class="row align-items-center">
                <div class="col-9">
                    <p class="text-white m-b-0">% change</p>
                </div>
                <div class="col-3 text-right">
                    <i class="fa fa-line-chart text-white f-16"></i>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="col-xl-3 col-md-6">
    <div class="card">
        <div class="card-block">
            <div class="row align-items-center">
                <div class="col-8">

                    <h4 class="text-c-green">${VisitCounter.getCount()}</h4>

                    <h6 class="text-muted m-b-0">방문자수</h6>
                </div>
                <div class="col-4 text-right">
                    <i class="fa fa-file-text-o f-28"></i>
                </div>
            </div>
        </div>
        <div class="card-footer bg-c-green">
            <div class="row align-items-center">
                <div class="col-9">
                    <p class="text-white m-b-0">% change</p>
                </div>
                <div class="col-3 text-right">
                    <i class="fa fa-line-chart text-white f-16"></i>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-xl-3 col-md-6">
    <div class="card">
        <div class="card-block">
            <div class="row align-items-center">
                <div class="col-8">

                    <h4 class="text-c-red"><fmt:formatNumber var="totalbuy" value="${totalBuy}" type="currency"></fmt:formatNumber>
                    ${totalbuy}
                    </h4>
                    <h6 class="text-muted m-b-0">총매출액</h6>
                </div>
                <div class="col-4 text-right">
                    <i class="fa fa-bar-chart f-28"></i>

                </div>
            </div>
        </div>
        <div class="card-footer bg-c-red">
            <div class="row align-items-center">
                <div class="col-9">
                    <p class="text-white m-b-0">% change</p>
                </div>
                <div class="col-3 text-right">
                    <i class="fa fa-line-chart text-white f-16"></i>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-xl-3 col-md-6">
    <div class="card">
        <div class="card-block">
            <div class="row align-items-center">
                <div class="col-8">

                    <h4 class="text-c-blue">카테고리명 : ${readList.p_category}<br>조회수 : ${readList.p_readCount}</h4>
                    <h6 class="text-muted m-b-0">최다 조회수</h6>

                </div>
                <div class="col-4 text-right">
                    <i class="fa fa-hand-o-down f-28"></i>
                </div>
            </div>
        </div>
        <div class="card-footer bg-c-blue">
            <div class="row align-items-center">
                <div class="col-9">
                    <p class="text-white m-b-0">% change</p>
                </div>
                <div class="col-3 text-right">
                    <i class="fa fa-line-chart text-white f-16"></i>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- task, page, download counter  end -->

<!--  sale analytics start -->
<div class="col-xl-8 col-md-12">
    <div class="card">
        <div class="card-header">
            <h5>UFO 현황</h5>
         <div class="container">

         	<div class="row">
		     
		                       
		       
		      	 <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
		      
		                         
		          <input type="number" hidden="ture" id="array0" value="${array0 }" >
		          <input type="number" hidden="ture" id="array1" value="${array1 }" >
		          <input type="number" hidden="ture" id="array2" value="${array2 }" >
		          <input type="number" hidden="ture" id="array3" value="${array3 }" >
		          <input type="number" hidden="ture" id="array4" value="${array4 }" >
		                  
            
          <c:forEach var="rentToBuyList" items="${rentToBuyList}">
          <input type="hidden" id="proId" value="${rentToBuyList.r_pid }" >
          <input type="hidden" id="proName" value="${rentToBuyList.p_name }" >
          <input type="hidden" id="proCate" value="${rentToBuyList.p_category }" >
          <input type="hidden" id="amount" value="${rentToBuyList.total }" >
          </c:forEach>
                
                
               <canvas id="mySellingChart" style="width:100%;max-width:600px"></canvas>
                 
               
            </div>
         </div>

            <span class="text-muted">Get 15% Off on <a href="https://www.amcharts.com/" target="_blank">amCharts</a> licences. Use code "codedthemes" and get the discount.</span>
            <div class="card-header-right">
                <ul class="list-unstyled card-option">
                    <li><i class="fa fa fa-wrench open-card-option"></i></li>
                    <li><i class="fa fa-window-maximize full-card"></i></li>
                    <li><i class="fa fa-minus minimize-card"></i></li>
                    <li><i class="fa fa-refresh reload-card"></i></li>
                    <li><i class="fa fa-trash close-card"></i></li>
                </ul>
            </div>
        </div>
        <div class="card-block">
           <c:forEach var="threeMonthList" items="${threeMonthPurchase}">
          <input type="hidden" id="bPurchase" value="${threeMonthList.b_purchase }" >
          </c:forEach>
          <c:forEach var="threeMonthRentList" items="${threeMonthRentPurchase}">
          <input type="hidden" id="bPurchaseRent" value="${threeMonthRentList.b_purchase }" >
          </c:forEach>
          <c:forEach var="threeMonthBuyList" items="${threeMonthBuyPurchase}">
          <input type="hidden" id="bPurchaseBuy" value="${threeMonthBuyList.b_purchase }" >
          </c:forEach>
                
                
               <canvas id="threeSellingChart" style="width:100%;max-width:600px"></canvas>
        </div>
    </div>
</div>
<div class="col-xl-4 col-md-12">

<div class="card">
    <div class="card-header"><h5>최근 3개월 매출액</h5></div>
     <div>
      	<h5>&nbsp;&nbsp;&nbsp;7월 : <fmt:formatNumber value="${seven }" pattern="###,###,###" />&nbsp;원</p></h5><br>
        <h5>&nbsp;&nbsp;&nbsp;8월 : <fmt:formatNumber value="${eight }" pattern="###,###,###" />&nbsp;원</p></h5><br>
        <h5>&nbsp;&nbsp;&nbsp;9월 : <fmt:formatNumber value="${nine }" pattern="###,###,###" />&nbsp;원</p></h5> 
       
    </div>
</div>
    
<div class="card">
    <div class="card-header">
      
        <h5>카테고리별 월별 매출액</h5>

        <h4>$3,9452.50</h4>
        <p class="text-muted">$3,9452.50</p>
        <h5>87</h5>
        <p class="text-muted">Online Revenue<span class="f-right">80%</span></p>
        <div class="progress"><div class="progress-bar bg-c-blue" style="width: 80%"></div></div>
<h5 class="m-t-15">68</h5>
<p class="text-muted">Offline Revenue<span class="f-right">50%</span></p>
<div class="progress"><div class="progress-bar bg-c-green" style="width: 50%"></div></div>
        </div>
    </div>

    
    
    
     <div class="card ">
        <div class="card-header">
            <h5>UFO VIP회원 리스트</h5>

            <div class="card-header-right">
                <ul class="list-unstyled card-option">
                    <li><i class="fa fa fa-wrench open-card-option"></i></li>
                    <li><i class="fa fa-window-maximize full-card"></i></li>
                    <li><i class="fa fa-minus minimize-card"></i></li>
                    <li><i class="fa fa-refresh reload-card"></i></li>
                    <li><i class="fa fa-trash close-card"></i></li>
                </ul>
            </div>

           
        </div>
        <div class="card-block">
        <c:forEach var="list" items="${buyList}" begin="0" end="5" step="1" varStatus="status">   
            <div class="align-middle m-b-30">
                <img src="/resources/assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                <div class="d-inline-block">
                    <h6><fmt:formatNumber value="${list.b_purchase}" pattern="###,###,###" /></h6>
                    <p class="text-muted m-b-0">${list.b_mid}</p>
                </div>
            </div>
        </c:forEach>
           

        </div>

            <div class="text-center">
                <a href="#!" class="b-b-primary text-primary">View all Projects</a>
            </div>
        </div>
    </div>


<!--  project and team member end -->
    </div>
</div>
<!-- Page-body end -->
                        </div>
                        <div id="styleSelector"> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    </div>

    

<script>
var xValues = ["스마트폰", "노트북", "카메라", "스마트워치", "태블릿"];
var a = $('#array0').val();
var b = $('#array1').val();
var c = $('#array2').val();
var d = $('#array3').val();
var e = $('#array4').val();
console.log(a,b,c,d,e);
var yValues = [a,b,c,d,e];
var barColors = [
  "#7971ea",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
];



new Chart("myChart", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "2021년 제품군 현황"
    }
  }
  
});


var proId=document.querySelectorAll("#proId");
var proName=document.querySelectorAll("#proName");
var proCate=document.querySelectorAll("#proCate");
var amount=document.querySelectorAll("#amount");
var totalamount=amount[0].value+amount[1].value+amount[2].value+amount[3].value+amount[4].value;
var xValues = [proId[0].value+proName[0].value,proId[1].value+proName[1].value,proId[2].value+proName[2].value,proId[3].value+proName[3].value, proId[4].value+proName[4].value];
var yValues = [amount[0].value/totalamount, amount[1].value/totalamount, amount[2].value/totalamount, amount[3].value/totalamount,amount[4].value/totalamount];
var barColors = [
  "#7971ea",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
];
new Chart("mySellingChart", {
    
  type: "pie",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "2021년 구매 확정 최다 상품 추이"
    }
  }
});


var bPurchase=document.querySelectorAll("#bPurchase");
var bPurchaseRent=document.querySelectorAll("#bPurchaseRent");
var bPurchaseBuy=document.querySelectorAll("#bPurchaseBuy");
var size=bPurchase.length;
var now=new Date().getMonth()+1;
var parray = new Array();
var parrayrent = new Array();
var parraybuy = new Array();
for(var i=0;i<size;i++){
	parray.push(bPurchase[i].value/100000);
	parrayrent.push(bPurchaseRent[i].value/100000);
	parraybuy.push(bPurchaseBuy[i].value/100000);
}


var xValues = [now-2+"월", now-1+"월",now+"월" ];
var yValues = parray;
var vValues = parrayrent;
var zValues = parraybuy;
var barColors = [
  "#7971ea",
  "#00aba9",
  "#e8c3b9",
  "#e8c3b9",
  "#1e7145"
];
new Chart("threeSellingChart", {
	  type: 'line',
	  data: {
	    labels: xValues,
	    datasets: [{ 
	        data: yValues,
	        label: "총 매출",
	        borderColor: "#3e95cd",
	        fill: true
	      }, { 
	        data: vValues,
	        label: "대여 매출",
	        borderColor: "#3cba9f",
	        fill: false
	      }, { 
	        data: zValues,
	        label: "구매 매출",
	        borderColor: "#e8c3b9",
	        fill: false
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: '최신 3개월 매출 동향 (단위 : 백만 원)'
	    }
	  }
	});
</script>

    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
</body>

</html>