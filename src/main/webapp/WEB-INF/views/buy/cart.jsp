<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- common.jsp 적용 -->
<%@ include file="/WEB-INF/views/include/common.jsp"%>
<link rel="stylesheet" href="${contextPath }/css/buy/cart.css" />
<script defer src="${contextPath }/js/buy/cart.js"></script>
</head>
<body>
	<!-- uppermost부분을 이어주는 링크 -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>
	<!-- header부분을 이어주는 링크 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="wrapper">
		<!-- cart -->
		<div class="content_cart">

			<h1>장바구니</h1>
			<div class="warn">
				<ul>
					<li id="one">장바구니 상품은 최대 30일간 저장됩니다.</li>
					<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
					<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘 출발 여부가 변경될 수 있으니 주문시에 꼭 확인해주시기
						바랍니다.</li>
				</ul>
			</div>

			<table class="item-information">
				<thead>
					<tr>
						<th class="info">상품정보</th>
						<th class="option">옵션</th>
						<th class="price">상품금액</th>
						<th class="shipping">배송비</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="item"><img src="foodpic.PNG"> [더 알찬]
							매콤찜닭(2인분/840g)<br>12,600원</td>
						<td class="ea">상품 주문 수량 : 1개
							<hr>
							<button>주문조건 추가/변경</button>
						</td>
						<td class="pr">12,600원<br />
							<button>주문하기</button></td>
						<td class="sh">2,500원 (월) 발송 예정</td>
					</tr>
					<tr>
						<td class="bt2" colspan="4">
							<button>선택상품 삭제</button>
							<button>선택상품 찜</button>
						</td>
					</tr>
					<tr>
						<td class="total" colspan="4">총 상품금액 (12,600원) + 배송비 2,500원 =
							<span>총 주문금액 <b>15,100</b></span>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="lastbtn">
				<button id="bt1">쇼핑 계속하기</button>
				<button id="bt2">주문하기</button>
			</div>
			<!-- footer부분을 이어주는 링크 -->
		</div>
		<div id="space"></div>
	</div>
	<br>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>