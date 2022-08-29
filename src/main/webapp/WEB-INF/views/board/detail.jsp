<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <button class="btn btn-secondary" onclick="history.back()">돌아가기</button>

            <c:if test="${board.user.username == principal.user.username}">
                    <a href="/board/${board.id}/updateForm"class="btn btn-warning">수정</a>
                    <button id="btn-delete" class="btn btn-danger">삭제</button>
                </c:if>
            <br /><br />
            <div>
                글 번호 : <span id="id"><i>${board.id}</i></span>
                작성자 : <span><i>${board.user.username}</i></span>
            </div>
            <br />
            <div>
                <h3>${board.title}</h3>
            </div>
            <hr />
            <div>
                <div>${board.content}</div>
            </div>
            <hr />
        <div class="card">
        <form>
            <input type="hidden" id="boardId" value="${board.id}" />
            <div class="card-body">
                <textarea id="reply-content" class="form-control" row = "1"></textarea>
            </div>
            <div class="card-footer">

                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal2">등록</button>

                           <!-- Modal -->
                <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">댓글 등록</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">
                        댓글을 등록 하시겠습니까?
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="btn-reply-save" class="badge">확인</button>     
                    </div>
                    </div>
                </div>
            </div>                       


            </div>
        </form>
    </div>
    <br />
    <div class="card">
        <div class="card-header">댓글 리스트</dv>
            <ul id="reply--box" class="list-group">
                <c:forEach var="reply" items="${board.replys}">
                    <li id="replyId" class="list-group-item d-flex justify-content-between">
                        <div>${reply.content}</div>
                        <div class="d-flex">
                            <div class="font-italic">작성자 : ${reply.user.username} &nbsp;</div>
                           <!-- Button trigger modal -->
                           <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal">삭제</button>

                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                             <div class="modal-dialog">
                               <div class="modal-content">
                                 <div class="modal-header">
                                   <h5 class="modal-title" id="exampleModalLabel">댓글 삭제</h5>
                                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                     <span aria-hidden="true">&times;</span>
                                   </button>
                                 </div>
                                 <div class="modal-body">
                                   댓글을 삭제 하시겠습니까?
                                 </div>
                                 <div class="modal-footer">
                                   <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                   <button type="button" class="btn btn-primary" onclick="index.replyDelete(${board.id},${reply.id})" class="badge">확인</button>     
                               </div>
                             </div>
                           </div>
                        </div>                       
                    </li>
                </c:forEach>
            </ul>
        </div>
        <script src="/js/board.js"></script>
        <%@ include file="../layout/footer.jsp" %>