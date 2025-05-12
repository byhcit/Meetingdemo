<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <style type="text/css">

        </style>
    </head>
    <body>
        <#include '../layout/top.ftl'>
        <div class="page-body">
            <#include '../layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    人员管理 > 员工注册
                </div>
                <form action="/doReg" id="RegForm">
                    <fieldset>
                        <legend>员工信息</legend>
                        <table class="formtable" style="width:50%">
                            <tr>
                                <td>姓名：</td>
                                <td>
                                    <input name="employeename" type="text" value="<#if employee??>${employee.employeename}</#if>" maxlength="20"/>
                                </td>
                            </tr>
                            <tr>
                                <td>账户名：</td>
                                <td>
                                    <input name="username" type="text" value="<#if employee??>${employee.username}</#if>" maxlength="20"/>
                                </td>
                            </tr>
                            <tr>
                                <td>密码：</td>
                                <td>
                                    <input name="password" type="password" id="password" maxlength="20" onblur="checkLen()" placeholder="请输入1位以上的密码"/>
                                    <div class="error" id="passwordinfo"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>确认密码：</td>
                                <td>
                                    <input type="password" id="confirm" maxlength="20" onblur="checkPwdMatch()"/>
                                    <div class="error" id="confirminfo"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>联系电话：</td>
                                <td>
                                    <input name="phone" type="text" value="<#if employee??>${employee.phone}</#if>" id="phone" maxlength="20"/>
                                </td>
                            </tr>
                            <tr>
                                <td>电子邮件：</td>
                                <td>
                                    <input name="email" type="text" value="<#if employee??>${employee.email}</#if>" id="email" maxlength="20"/>
                                </td>
                            </tr>
							<td>所在部门：</td>
                                <td>
                                    <select name="departmentid" id="deptid">
                                        <#if deps??>
                                            <#list deps as dep>
                                                <option value="${dep.departmentid}">${dep.departmentname}</option>
                                            </#list>
                                        </#if>
                                     </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="command">
                                    <input type="submit" value="注册"/>
                                    <input type="reset" value="重置"/>
                                </td>
                            </tr>
                        </table>
                        <div class="error">${error!''}</div>
                    </fieldset>
                </form>
            </div>
        </div>
        <#include '../layout/footer.ftl'>
    <script>
        function checkLen(){
            var password = document.getElementById("password");
            var passwordinfo = document.getElementById("passwordinfo");
            // 密码长度校验
            if (password.value.length < 1) {
                passwordinfo.innerText = "密码长度不能少于1位";
            } else {
                passwordinfo.innerText = "";
            }
        }
        function checkPwdMatch(){
            var password = document.getElementById("password");
            var confirm = document.getElementById("confirm");
            var confirminfo = document.getElementById("confirminfo");

            // 两次密码一致性校验
            if (password.value.length > 0 && password.value !== confirm.value) {
                confirminfo.innerText = "两次输入密码不一致";
            } else {
                confirminfo.innerText = "";
            }

        }
        document.getElementById('RegForm').addEventListener('submit', function(e) {
            console.log("请填写所有必填项")
            var employeename = this.employeename.value.trim();
            var username = this.username.value.trim();
            var password = document.getElementById("password").value.trim();
            var confirm = document.getElementById("confirm").value.trim();
            var phone = document.getElementById("phone").value.trim();
            var email = document.getElementById("email").value.trim();

            if (!employeename || !username || !password || !confirm || !phone || !email) {
                alert("请填写所有必填项");
                e.preventDefault(); // 阻止表单提交
                return false;
            }
        });
    </script>
    </body>
</html>