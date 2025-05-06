<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <link rel="stylesheet" href="/styles/pagination.css"/>
    </head>
    <body>
    <#include 'top.ftl'>
    <div class="page-body">
        <#include 'leftMenu.ftl'>
        <div class="page-content">
            <div class="content-nav">
                人员管理 > 注册审批
            </div>
            <table class="listtable">
                <caption>所有待审批注册信息：</caption>
                <tr class="listheader">
                    <th>姓名</th>
                    <th>账号名</th>
                    <th>联系电话</th>
                    <th>电子邮件</th>
                    <th>操作</th>
                </tr>
                <#if emps??>
                    <#list emps as emp>
                        <tr>
                            <td>${emp.employeename}</td>
                            <td>${emp.username}</td>
                            <td>${emp.phone}</td>
                            <td>${emp.email}</td>
                            <td>
                                <a type="button" class="clickbutton" href="/admin/updateStatus?employeeid=${emp.employeeid}&status=1">通过</a>
                                <a type="button" class="clickbutton" href="/admin/updateStatus?employeeid=${emp.employeeid}&status=2">不通过</a>
                            </td>
                        </tr>
                    </#list>
                </#if>
            </table>
            <#include 'pagination.ftl'>
            <@pagination pageNum=pageNum pageSize=pageSize total=total totalPages=totalPages url="/admin/approveAccount"/>
        </div>
    </div>
    <#include 'footer.ftl'>
    </body>
</html>