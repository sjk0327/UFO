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
                    <h4 class="text-c-purple">${listCount}</h4>
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
                    <h4 class="text-c-green">290+</h4>
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
                    <h4 class="text-c-blue">500</h4>
                    <h6 class="text-muted m-b-0">방문자 수</h6>
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
            <div id="sales-analytics" style="height: 400px;"></div>
        </div>
    </div>
</div>
<div class="col-xl-4 col-md-12">
    <div class="card">
        <div class="card-block">
            <div class="row">
                <div class="col">
                    <h4>$256.23</h4>
                    <p class="text-muted">This Month</p>
                </div>
                <div class="col-auto">
                    <label class="label label-success">+20%</label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-8">
                    <canvas id="this-month" style="height: 150px;"></canvas>
            </div>
        </div>
    </div>
</div>
<div class="card quater-card">
    <div class="card-block">
        <h6 class="text-muted m-b-15">This Quarter</h6>
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
</div>
<!--  sale analytics end -->


<!-- 회원 리스트 -->

<!--  project and team member start -->
<div class="col-xl-8 col-md-12">
    <div class="card table-card">
        <div class="card-header">
            <h5>Projects</h5>
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
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>
                            <div class="chk-option">
                                <div class="checkbox-fade fade-in-primary">
                                    <label class="check-task">
                                        <input type="checkbox" value="">
                                        <span class="cr">
                                                <i class="cr-icon fa fa-check txt-default"></i>
                                            </span>
                                    </label>
                                </div>
                            </div>
                            Assigned</th>
                        <th>Name</th>
                        <th>Due Date</th>
                        <th class="text-right">Priority</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="chk-option">
                                <div class="checkbox-fade fade-in-primary">
                                    <label class="check-task">
                                        <input type="checkbox" value="">
                                        <span class="cr">
                                                    <i class="cr-icon fa fa-check txt-default"></i>
                                                </span>
                                    </label>
                                </div>
                            </div>
                            <div class="d-inline-block align-middle">
                                <img src="/resources/assets/images/avatar-4.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                <div class="d-inline-block">
                                    <h6>John Deo</h6>
                                    <p class="text-muted m-b-0">Graphics Designer</p>
                                </div>
                            </div>
                        </td>
                        <td>Able Pro</td>
                        <td>Jun, 26</td>
                        <td class="text-right"><label class="label label-danger">Low</label></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="chk-option">
                                <div class="checkbox-fade fade-in-primary">
                                    <label class="check-task">
                                        <input type="checkbox" value="">
                                        <span class="cr">
                                                    <i class="cr-icon fa fa-check txt-default"></i>
                                                </span>
                                    </label>
                                </div>
                            </div>
                            <div class="d-inline-block align-middle">
                                <img src="/resources/assets/images/avatar-5.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                <div class="d-inline-block">
                                    <h6>Jenifer Vintage</h6>
                                    <p class="text-muted m-b-0">Web Designer</p>
                                </div>
                            </div>
                        </td>
                        <td>Mashable</td>
                        <td>March, 31</td>
                        <td class="text-right"><label class="label label-primary">high</label></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="chk-option">
                                <div class="checkbox-fade fade-in-primary">
                                    <label class="check-task">
                                        <input type="checkbox" value="">
                                        <span class="cr">
                                                    <i class="cr-icon fa fa-check txt-default"></i>
                                                </span>
                                    </label>
                                </div>
                            </div>
                            <div class="d-inline-block align-middle">
                                <img src="/resources/assets/images/avatar-3.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                <div class="d-inline-block">
                                    <h6>William Jem</h6>
                                    <p class="text-muted m-b-0">Developer</p>
                                </div>
                            </div>
                        </td>
                        <td>Flatable</td>
                        <td>Aug, 02</td>
                        <td class="text-right"><label class="label label-success">medium</label></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="chk-option">
                                <div class="checkbox-fade fade-in-primary">
                                    <label class="check-task">
                                        <input type="checkbox" value="">
                                        <span class="cr">
                                                    <i class="cr-icon fa fa-check txt-default"></i>
                                                </span>
                                    </label>
                                </div>
                            </div>
                            <div class="d-inline-block align-middle">
                                <img src="/resources/assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                <div class="d-inline-block">
                                    <h6>David Jones</h6>
                                    <p class="text-muted m-b-0">Developer</p>
                                </div>
                            </div>
                        </td>
                        <td>Guruable</td>
                        <td>Sep, 22</td>
                        <td class="text-right"><label class="label label-primary">high</label></td>
                    </tr>
                    </tbody>
                </table>
                <div class="text-right m-r-20">
                    <a href="#!" class=" b-b-primary text-primary">View all Projects</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-xl-4 col-md-12">
    <div class="card ">
        <div class="card-header">
            <h5>Team Members</h5>
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
            <div class="align-middle m-b-30">
                <img src="/resources/assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                <div class="d-inline-block">
                    <h6>David Jones</h6>
                    <p class="text-muted m-b-0">Developer</p>
                </div>
            </div>
            <div class="align-middle m-b-30">
                <img src="/resources/assets/images/avatar-1.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                <div class="d-inline-block">
                    <h6>David Jones</h6>
                    <p class="text-muted m-b-0">Developer</p>
                </div>
            </div>
            <div class="align-middle m-b-30">
                <img src="/resources/assets/images/avatar-3.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                <div class="d-inline-block">
                    <h6>David Jones</h6>
                    <p class="text-muted m-b-0">Developer</p>
                </div>
            </div>
            <div class="align-middle m-b-30">
                <img src="/resources/assets/images/avatar-4.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                <div class="d-inline-block">
                    <h6>David Jones</h6>
                    <p class="text-muted m-b-0">Developer</p>
                </div>
            </div>
            <div class="align-middle m-b-10">
                <img src="/resources/assets/images/avatar-5.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                <div class="d-inline-block">
                    <h6>David Jones</h6>
                    <p class="text-muted m-b-0">Developer</p>
                </div>
            </div>
            <div class="text-center">
                <a href="#!" class="b-b-primary text-primary">View all Projects</a>
            </div>
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
var xValues = [proId[0].value+proName[0].value,proId[1].value+proName[1].value,proId[2].value+proName[2].value,proId[3].value+proName[3].value,proId[4].value+proName[4].value];
var yValues = [amount[0].value/totalamount, amount[1].value/totalamount, amount[2].value/totalamount, amount[3].value/totalamount, amount[4].value/totalamount];
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


</script>

    <%@ include file="/WEB-INF/views/adminFooter.jsp" %>
</body>

</html>