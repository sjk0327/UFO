<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>관리자 인덱스 - UF&#38;O</title>
     <%@ include file="/WEB-INF/views/adminHeader.jsp" %>
     <!-- 신영 chart.js cdn 삽입 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<style type="text/css">


</style> 
   
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

                    <h4 class="text-c-green">${visitCountToday}명</h4>

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

                    <h4 class="text-c-blue">${readList.p_category}&nbsp;${readList.p_readCount}회</h4>
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
      
                         
          <input type="hidden"  id="array0" value="${array0 }" >
          <input type="hidden"  id="array1" value="${array1 }" >
          <input type="hidden"  id="array2" value="${array2 }" >
          <input type="hidden"  id="array3" value="${array3 }" >
          <input type="hidden"  id="array4" value="${array4 }" >
                  
            
          <c:forEach var="rentToBuyList" items="${rentToBuyList}">
          <input type="hidden" id="proId" value="${rentToBuyList.r_pid }" >
          <input type="hidden" id="proName" value="${rentToBuyList.p_name }" >
          <input type="hidden" id="proCate" value="${rentToBuyList.p_category }" >
          <input type="hidden" id="amount" value="${rentToBuyList.total }" >
          </c:forEach>
                
                
               <canvas id="mySellingChart" style="width:100%;max-width:600px"></canvas>
                 
               
            </div>
         </div>

            
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
        <div id="threeMonth">
           <c:forEach var="threeMonthList" items="${threeMonthPurchase}">
          <input type="hidden" id="bPurchase" value="${threeMonthList.b_purchase }" >
          </c:forEach>
          <c:forEach var="threeMonthRentList" items="${threeMonthRentPurchase}">
          <input type="hidden" id="bPurchaseRent" value="${threeMonthRentList.b_purchase }" >
          </c:forEach>
          <c:forEach var="threeMonthBuyList" items="${threeMonthBuyPurchase}">
          <input type="hidden" id="bPurchaseBuy" value="${threeMonthBuyList.b_purchase }" >
          </c:forEach>
                
                
               <canvas id="threeSellingChart" style="width:100%; max-width:600px;"></canvas>
        </div>
    </div>
</div>
<div class="col-xl-4 col-md-12">

  <div class="card">
        <div class="card-header">                                    
              <h5>3개월 매출액</h5>                              
        </div>
        <div class="card-block table-border-style">
           <div class="table-responsive">
              <table class="table table-hover">
<thead>
    <tr>                        
      <th width="100">${llastMonth}월</th>
      <th width="100">${lastMonth}월</th>
      <th width="100">${thisMonth}월</th>
      
   </tr>
   
  </thead> <tbody> 
  <tr style="cursor:hand" >
           
<td><fmt:formatNumber value="${camount}" pattern="###,###,###" />원</td>
<td><fmt:formatNumber value="${bamount}" pattern="###,###,###" />원</td>
<td><fmt:formatNumber value="${aamount}" pattern="###,###,###" />원</td>

</tr> 

   </tbody>


   </table>
  
  
</div>
   </div>

    
<div class="card">
    <div class="card-header">
      
        <h5>카테고리별 ${thisMonth }월 매출액</h5>
      <canvas id="cateSepChart" style="width:100%;max-width:600px"></canvas>
 		<input type="hidden" id="sm" value="${sm}" >
        <input type="hidden" id="ltt" value="${ltt}" >
        <input type="hidden" id="cm" value="${cm}" >
        <input type="hidden" id="wc" value="${wc}" >
        <input type="hidden" id="tb" value="${tb}" >
    
        <!-- <h4>$3,9452.50</h4>
        <p class="text-muted">$3,9452.50</p>
        <h5>87</h5>
        <p class="text-muted">Online Revenue<span class="f-right">80%</span></p>
        <div class="progress"><div class="progress-bar bg-c-blue" style="width: 80%"></div></div>
<h5 class="m-t-15">68</h5>
<p class="text-muted">Offline Revenue<span class="f-right">50%</span></p>
<div class="progress"><div class="progress-bar bg-c-green" style="width: 50%"></div></div>
        </div>
    </div> -->

    </div>
    </div>
    
     <div class="card ">
        <div class="card-header">
            <h5>UFO VIP회원 리스트</h5>

      <%--  <div class="card-block table-border-style">
           <div class="table-responsive">
              <table class="table table-hover">
<thead>
    <tr>                        
      <th width="100">회원 ID</th>
      <th width="100">회원 명</th>
      <th width="100">총 구입금액</th>
      
   </tr>
   
  </thead> <tbody> 
  <tr style="cursor:hand" >
  <c:forEach var="list" items="${buyList}" begin="0" end="5" step="1" varStatus="status"> 
<td width="100">${list.b_mid}</td>
<td width="100">${list.b_mname}</td>
<td><fmt:formatNumber value="${list.b_purchase}" pattern="###,###,###" />원</td>       

</c:forEach>
</tr> 

   </tbody>


   </table>
  
  
</div>
   </div>
 --%>

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
            	<div class="col-md-6">
                <img src="/resources/Images/member/${list.m_img }" alt="user image" class="img-radius img-40 align-top m-r-15">
                <div class="d-inline-block">
                  <h6>${list.b_mid}${list.b_mname }</h6><h6><fmt:formatNumber value="${list.b_purchase}" pattern="###,###,###" /></h6>
                  
                </div>
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

var xValues = ["스마트폰", "노트북", "카메라", "워치", "태블릿"];

var sm = $('#sm').val();
var ltt = $('#ltt').val();
var cm = $('#cm').val();
var wc = $('#wc').val();
var tb = $('#tb').val();

var yValues = [sm, ltt, cm, wc, tb];
var barColors = ["#7971ea", "#00aba9","#2b5797","#e8c3b9","#1e7145"];

new Chart("cateSepChart", {
  type: "horizontalBar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: ""
    }
  }
});


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
var idsize=proId.length;
var proName=document.querySelectorAll("#proName");
var proCate=document.querySelectorAll("#proCate");
var amount=document.querySelectorAll("#amount");

var arrayId=new Array();
var arraypercent=new Array();

var totalamount=0;
for(var k=0;k<idsize;k++){
	totalamount=totalamount+Number(amount[k].value);
	arrayId.push(proName[k].value);
}

for(var l=0;l<idsize;l++){

	arraypercent.push(amount[l].value/totalamount);
}

var xValues = arrayId;
var yValues = arraypercent;
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