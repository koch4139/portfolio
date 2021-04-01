<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- common.jsp 적용 -->
<%@ include file="/WEB-INF/views/include/common.jsp"%>
<style>
/**{outline: 1px solid red;}*/
.container {
	display: block;
	width: 1200px;
	margin: 0 auto;
}
.content {
	width: 100%;
	/* display: flex;
            justify-content:flex-start;
            flex-wrap: wrap; */
}
ul {
	list-style-type: none;
	padding-left: 0;
	text-align: center;
}

li {
	display: inline-block;
}

span {
	display: block;
}
</style>
</head>
<body>
	<!-- uppermost부분을 이어주는 링크 -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>
	<!-- header부분을 이어주는 링크 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
		<!-- 레시피 검색 결과가 있는 경우 -->
		<h1>레시피 검색 결과</h1>
		<c:if test="${searchList != '[]'}">
			<ul class="content">
				<c:forEach var="searchList" items="${searchList }">
					<li>
						<div>
							<a href="${contextPath }/recipe/recipeDetail/${searchList.recipe_id}"><img src="https://picsum.photos/200/300" alt="사진 없음"></a>
						</div> <span>${searchList.recipe_name }</span> <span>${searchList.recipe_c_date }</span>
						<span>${searchList.recipe_id }</span>
					</li>
				</c:forEach>
			</ul>
		</c:if>		
		<hr>
		<!-- 레시피 검색 결과가 없는 경우 -->
		<c:if test="${searchList == '[]'}">
			<div style="color: red; margin-left: 20px;">레시피 결과가 나타나지 않았습니다.</div>
		</c:if>
		<hr>
		<h2>검색어가 들어간 재료 검색 결과</h2>
		<!-- 재료 검색 결과가 있는 경우 -->
		<c:if test="${materialList != '[]'}">
			<ul class="content">
				<c:forEach var="materialList" items="${materialList }">
					<li>
						<div>
							<a href="${contextPath }/recipe/recipeDetail/${materialList.recipe_id}"><img src="https://picsum.photos/200/300" alt="사진 없음"></a>
						</div> <span>${materialList.recipe_name }</span> <span>${materialList.recipe_c_date }</span>
						<span>${materialList.recipe_id }</span>
					</li>
				</c:forEach>
			</ul>
		</c:if>		
		<hr>
		<!-- 재료 검색 결과가 없는 경우 -->
		<c:if test="${materialList == '[]'}">
			<div style="color: red; margin-left: 20px;">재료 결과가 나타나지 않았습니다.</div>
		</c:if>
	</div>
<div style="margin-bottom: 140px;"></div>	
<%@ include file="/WEB-INF/views/include/footer.jsp"%>	
</body>
</html>