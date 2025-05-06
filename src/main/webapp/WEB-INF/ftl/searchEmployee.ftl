<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
    </head>
    <body>
        <#include 'top.ftl'>
        <div class="page-body">
            <#include 'leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    人员管理 > 搜索员工
                </div>
                <form action="/admin/searchEmps" method="post">
                    <fieldset>
                        <legend>员工查询</legend>
                        <table class="formtable">
                            <tr>
                                <td>姓名：</td>
                                <td>
                                    <input type="text" name="employeename" value="${empCond.employeename!''}" maxlength="20"/>
                                </td>
                                <td>账号名：</td>
                                <td>
                                    <input type="text" name="username" value="${empCond.username!''}" maxlength="20"/>
                                </td>
                                <td>状态：</td>
                                <td>
                                    <input type="radio" id="status" name="status" value="1" <#if empCond.status?? && empCond.status == '1'>checked="checked"</#if>/><label for="status">已批准</label>
                                    <input type="radio" id="status" name="status" value="0" <#if empCond.status?? && empCond.status == '0'>checked="checked"</#if>/><label for="status">待审批</label>
                                    <input type="radio" id="status" name="status" value="2" <#if empCond.status?? && empCond.status == '2'>checked="checked"</#if>/><label for="status">已关闭</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="command">
                                    <input type="submit" value="查询" class="clickbutton"/>
                                    <input type="button" class="clickbutton" value="重置" onclick="window.location.href='/admin/searchEmps'"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
                <div>
                    <h3 style="text-align:center;color:black">查询结果</h3>
                    <div class="pager-header">
                        <div class="header-info">
                            共<span class="info-number">${total}</span>条结果，
                            分成<span class="info-number">${totalPages}</span>页显示，
                            当前第<span class="info-number">${page}</span>页
                        </div>
                        <div class="header-nav">
                            <#assign queryParams = "">
                            <#if empCond.employeename??>
                                <#assign queryParams = queryParams + "&employeename=" + empCond.employeename>
                            </#if>
                            <#if empCond.username??>
                                <#assign queryParams = queryParams + "&username=" + empCond.username>
                            </#if>
                            <#if empCond.status??>
                                <#assign queryParams = queryParams + "&status=" + empCond.status>
                            </#if>
                            
                            <a href="/admin/searchEmps?page=1${queryParams}" class="clickbutton">首页</a>
                            <#if page gt 1>
                                <a href="/admin/searchEmps?page=${page-1}${queryParams}" class="clickbutton">上页</a>
                            </#if>
                            <#if page lt totalPages>
                                <a href="/admin/searchEmps?page=${page+1}${queryParams}" class="clickbutton">下页</a>
                            </#if>
                            <a href="/admin/searchEmps?page=${totalPages}${queryParams}" class="clickbutton">末页</a>
                            跳到第<input type="text" id="pagenum" class="nav-number"/>页
                            <input type="button" class="clickbutton" value="跳转" onclick="goToPage()"/>
                        </div>
                    </div>
                </div>
                <table class="listtable">
                    <tr class="listheader">
                        <th>姓名</th>
                        <th>账号名</th>
                        <th>联系电话</th>
                        <th>电子邮件</th>
                        <th>操作</th>
                    </tr>
                    <#if emps ??>
                        <#list emps as emp>
                            <tr>
                                <td>${emp.employeename}</td>
                                <td>${emp.username}</td>
                                <td>${emp.phone}</td>
                                <td>${emp.email}</td>
                                <td><a class="clickbutton" href="#">关闭账号</a></td>
                            </tr>
                        </#list>
                    </#if>
                </table>
            </div>
        </div>
        <#include 'footer.ftl'>
    </body>
    <script>
        function goToPage() {
            var pageNum = document.getElementById('pagenum').value;
            if (pageNum && pageNum > 0) {
                var queryParams = '';
                <#if empCond.employeename??>
                    queryParams += '&employeename=${empCond.employeename}';
                </#if>
                <#if empCond.username??>
                    queryParams += '&username=${empCond.username}';
                </#if>
                <#if empCond.status??>
                    queryParams += '&status=${empCond.status}';
                </#if>
                window.location.href = '/admin/searchEmps?page=' + pageNum + queryParams;
            } else {
                alert('请输入有效的页码！');
            }
        }
    </script>
</html>