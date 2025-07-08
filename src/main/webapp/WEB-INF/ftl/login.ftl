<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/meeting/styles/common.css"/>
    </head>
    <body>
        <#include 'layout/top.ftl'>
        <div class="page-body">
            <#include 'layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    登录
                </div>
                <form action="doLogin" method="post">
                    <fieldset>
                        <legend>登录信息</legend>
                        <table class="formtable" style="width:50%">
                            <tr>
                                <td>账号名:</td>
                                <td>
                                    <input name="username" id="accountname" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>密码:</td>
                                <td>
                                    <input name="password" id="new" type="password" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <input type="submit" value="登录" class="clickbutton"/>
<#--                                    <input type="button" value="返回" class="clickbutton" onclick="window.location.href = '/meeting'"/>-->
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