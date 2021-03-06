<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--common -->
<%@ include file="/WEB-INF/views/include/common.jsp"%>      
<title>게시글 작성</title>
<link rel="stylesheet" href="${contextPath }/css/layout.css">
<link rel="stylesheet" href="${contextPath }/css/board/writeForm.css" />
<!-- ck editor -->
<!-- script defer src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script-->
<script defer src="${contextPath }/js/common/ckeditor.js"></script>
<script defer src="${contextPath }/js/board/writeForm.js"></script>
</head>
<body>
  <!--upper most-->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>
  <!--header-->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<main>
		<div class="container">
			<div class="content">
				<form id='writeForm'
							action="${contextPath }/board/write" 
							method="post"
							enctype="multipart/form-data">	
					<input type="hidden" name="bid" value="${sessionScope.member.user_id }"/>
					<input type="hidden" name="bnickname" value="${sessionScope.member.user_nickname }"/>						
					<legend id="title">게시글 작성</legend>
					<ul>
						<li><label for="cid">분류</label></li>
						<li>
							<select name="boardCategoryVO.cid" id="cid">
								<option value=""></option>
								<c:forEach var="rec" items="${boardCategoryVO}">
								<option value="${rec.cid }" ${rec.cid == boardVO.boardCategoryVO.cid ? 'selected="selected"' : ''}>${rec.cname }</option>
								</c:forEach>							
							</select>
						</li>
						<li>
							<span id='cid_errmsg'></span>
							<span class="svr_msg">${svr_msg["valid_boardCategoryVO.cid"] }</span>
						</li>
						<li><label for="btitle">제목</label></li>
						<li><input type="text" name="btitle" id="btitle" value="${boardVO.btitle}" /></li>
						<li>
							<span id='btitle_errmsg'></span>
							<span class="svr_msg">${svr_msg["valid_btitle"] }</span>
						</li>
						<li><label for="bid">작성자</label></li>
						<li><input type="text" id="bid" 
											 value="${sessionScope.member.user_nickname }(${sessionScope.member.user_id })"
											 readonly="readonly"/>
						</li>
						<li>
							<span id='bid_errmsg'></span>
							<span class="svr_msg">${svr_msg.valid_bid }</span>
						</li>						
						<li><label for="bcontent">내용</label></li>
						<li>
							<textarea name="bcontent" id="bcontent" style="display:none">${boardVO.bcontent }</textarea>
							<div id="word-count"></div>	
						</li>
						<li>
							<span id='bcontent_errmsg'></span>
							<span class="svr_msg">${svr_msg.valid_bcontent }</span>
						</li>						
						<li><label for="files">첨부</label></li>
						<li><input type="file" name="files" id="files" class="form-control" multiple="multiple"/></li>
						<li>
							<button id="writeBtn" type="button" class="btn btn-outline-success btn-sm">등록</button>
							<button id="cancelBtn"  type="button" class="btn btn-outline-danger btn-sm">취소</button>
							<button id="listBtn"  type="button" class="btn btn-outline-dark btn-sm">목록</button>
						</li>
					</ul>				
				</form>
				</div>
			</div>
	</main>
 <!-- footer부분을 이어주는 링크 -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>