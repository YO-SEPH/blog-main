<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>

        <div class="container">

            <form id="submitForm">
                <input type="hidden" id="id" value="${principal.user.id}" />
                <div class="form-group">
                    <label for="username">username</label>
                    <input type="text" value="${principal.user.username}" class="form-control" id="username"
                        name="username" readonly>
                </div>

                <div class="form-group ">
                    <label for="password">password</label>
                    <input type="password" class="form-control" id="password" name="password" value="****" required>
                </div>

                <div class="form-group">
                    <label for="email">email</label>
                    <input type="email" value="${principal.user.email}" class="form-control" id="email" name="email"
                        required>
                </div>

                </br>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-block" data-toggle="modal"
                    data-target="#exampleModal">회원수정하기</button>
                <button type="button" class="btn btn-danger btn-block" onclick="history.back()">돌아가기</button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">회원 수정</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                회원 수정 하시겠습니까??
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" data-toggle="modal" id="submit">확인</button>


                                <!-- <div class="modal fade" tabindex="-1" id="exampleModal2" data-toggle="modal">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                회원수정이 완료되었습니다
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" id="submit">확인</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                -->

                            </div>
                        </div>
                    </div>
                    </br>

                </div>

            </form>

        </div>

        <script src="/js/update.js"></script>
        <%@ include file="../layout/footer.jsp" %>
            <style>
                .container {
                    width: 500px;
                    margin: 0 auto;
                }

                /* input 태그에 클래스가 error 인 요소 */
                input.error {
                    border: 1px solid red;
                }

                /* label 태그에 클래스가 error 인 요소 */
                label.error {
                    color: red;
                    font-size: 13px;
                }
            </style>