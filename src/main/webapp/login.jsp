<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>login</title>
            <style>
                fieldset {
                    width: 400px;
                    margin: auto;
                    margin-top: 200px;
                }

                legend {
                    margin-left: 50px;
                    padding: 15px;
                    font-size: 150%;
                    font-weight: bold;
                }

                div {
                    width: 250px;
                    margin: auto;
                    margin-bottom: 20px;
                    text-align: center;
                }

                input {
                    width: 226px;
                    padding: 10px;
                    font-size: 15px;
                }

                #submit {
                    width: 250px;
                }

                a {
                    line-height: 50px;
                }

                ul {
                    width: 100px;
                    margin: auto;
                    padding: 0px;
                    list-style-type: none;
                }
            </style>
        </head>

        <body>
            <fieldset>
                <legend>登入</legend>
                <form action="login" method="post">
                    <div>
                        <input type="text" name="account" id="account" placeholder="電話號碼/使用者名稱/Email" required>
                    </div>
                    <div>
                        <input type="password" name="password" id="password" placeholder="密碼" required>
                    </div>
                    <div>
                        <input type="submit" name="submit" id="submit" value="登入">
                    </div>
                </form>
            </fieldset>
            <div>
                <a href="registerform.jsp">註冊</a>
            </div>
            <div>
                <% List<String> errors=(List<String>) request.getAttribute("errors");
                        if(errors!=null){
                        %>
                        <ul style="color:red">
                            <% for(String error : errors){ %>
                                <li>
                                    <%= error %>
                                </li>
                                <% } %>
                        </ul>
                        <% } %>
            </div>
        </body>

        </html>