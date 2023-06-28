<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="/" class="navbar-brand mx-4 mb-3">
<!--                 <img src="https://cdn.pixabay.com/photo/2021/10/10/04/03/home-6695542_1280.png" width="100px"> -->
<!--                     <h3 class="text-primary">MODERNHOME</h3> -->
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
<!--                         <img class="rounded-circle" src="/resources/img/user.jpg" alt="" style="width: 40px; height: 40px;"> -->
                        <img src="https://cdn.pixabay.com/photo/2021/10/10/04/03/home-6695542_1280.png" width="100px"><br><br>
                        <h3 class="text-primary">MODERNHOME</h3>
<!--                         <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div> -->
                    </div>
<!--                     <div class="ms-3"> -->
<!--                         <h6 class="mb-0">Jhon Doe</h6> -->
<!--                         <span>Admin</span> -->
<!--                     </div> -->
                </div>
                <div class="navbar-nav w-100">
                    <a href="/" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
 					<div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>기준정보관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/info/req/reqList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>소요량관리</a>
                            <a href="/info/item/productList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>완제품관리</a>
                            <a href="/info/item/materialList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>자재관리</a>
                        </div>
                    </div>
 					<div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>자재관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/stock/productStockList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>완제품재고현황</a>
                            <a href="/stock/materialStockList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>자재재고현황</a>
                            <a href="/wms/inorder/inorderlist" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>발주관리</a>
                            <a href="/wms/receive/receivelist" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>입고관리</a>
                            <a href="/release/materialRelease" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>자재출고관리</a>
                            <a href="/release/productRelease" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>제품출고관리</a>
                            <a href="/wms/warehouse/warehouselist" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>창고관리</a>
                        </div>
                    </div>
 					<div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>생산관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/production/instruct/list" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>작업지시관리</a>
                            <a href="/production/performance/list" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>생산실적관리</a>
                            <a href="/production/line/lineList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>생산라인관리</a>
                            <a href="" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>생산관리현황</a>
                        </div>
                    </div>
 					<div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>영업관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/client/clientList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>거래처관리</a>
                            <a href="/client/outOrderList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>수주관리</a>
                            <a href="/client/shipmentList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>출하관리</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
 						<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>품질관리</a>
					 	<div class="dropdown-menu bg-transparent border-0">
                           <a href="/production/quality/qualitylist" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>전수검사</a>
                           <a href="/production/quality/materialQualityList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>수입검사</a>
                           <a href="/production/defective/list" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>불량관리</a>
                       </div>
 					</div>

 					<div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>사원관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/employee/employeeList" class="dropdown-item">ㄴ<i class="far fa-file-alt me-2"></i>사원조회</a>
                        </div>
                    </div>
<!--                     <div class="nav-item dropdown"> -->
<!--                         <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a> -->
<!--                         <div class="dropdown-menu bg-transparent border-0"> -->
<!--                             <a href="button.html" class="dropdown-item">Buttons</a> -->
<!--                             <a href="typography.html" class="dropdown-item">Typography</a> -->
<!--                             <a href="element.html" class="dropdown-item">Other Elements</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a> -->
<!--                     <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a> -->
<!--                     <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a> -->
<!--                     <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a> -->
<!--                     <div class="nav-item dropdown"> -->
<!--                         <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a> -->
<!--                         <div class="dropdown-menu bg-transparent border-0"> -->
<!--                             <a href="signin.html" class="dropdown-item">Sign In</a> -->
<!--                             <a href="signup.html" class="dropdown-item">Sign Up</a> -->
<!--                             <a href="404.html" class="dropdown-item">404 Error</a> -->
<!--                             <a href="blank.html" class="dropdown-item">Blank Page</a> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->
        