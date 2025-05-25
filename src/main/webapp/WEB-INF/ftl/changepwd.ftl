<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <script type="text/javascript">
            function validateForm(){
                var oldPwd = document.getElementById("oldPwd").value;
                var newPwd = document.getElementById("newPwd").value;
                var confirmPwd = document.getElementById("confirmPwd").value;

                if (oldPwd === "") {
                    alert("请输入原密码！");
                    return false;
                }
                if (newPwd === "") {
                    alert("请输入新密码！");
                    return false;
                }
                if (confirmPwd === "") {
                    alert("请确认新密码！");
                    return false;
                }
                if (newPwd !== confirmPwd) {
                    alert("两次输入的新密码不一致！");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <#include 'layout/top.ftl'>
        <div class="page-body">
            <#include 'layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    修改密码
                </div>
                <form action="/changepwd" method="post" onsubmit="return validateForm()">
                    <fieldset>
                        <legend>修改密码信息</legend>
                        <table class="formtable" style="width:50%">
                            <tr>
                                <td>原密码:</td>
                                <td>
                                    <input id="oldPwd" name="oldPwd" type="password" />
                                </td>
                            </tr>
                            <tr>
                                <td>新密码:</td>
                                <td>
                                    <input id="newPwd" name="newPwd" type="password" />
                                </td>
                            </tr>
                            <tr>
                                <td>确认新密码：</td>
                                <td>
                                    <input id="confirmPwd" name="confirmPwd" type="password"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <input type="submit" value="确认修改" class="clickbutton"/>
                                    <input type="button" value="返回" class="clickbutton" onclick="window.history.back();"/>
                                </td>
                            </tr>
                        </table>
                        <div class="error">${error!''}</div>
                    </fieldset>
                </form>
            </div>
        </div>
        <#include 'layout/footer.ftl'>
    </body>
</html>