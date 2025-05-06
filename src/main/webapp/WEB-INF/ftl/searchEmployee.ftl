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
                                    <input type="radio" name="status" value="1" <#if (empCond.status!'') == '1'>checked="checked"</#if>/><label>已批准</label>
                                    <input type="radio" name="status" value="0" <#if (empCond.status!'') == '0'>checked="checked"</#if>/><label>待审批</label>
                                    <input type="radio" name="status" value="-1" <#if (empCond.status!'') == '-1'>checked="checked"</#if>/><label>已关闭</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="command">
                                    <input type="submit" value="查询" class="clickbutton"/>
                                    <input type="reset" class="clickbutton" value="重置"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
                <div>
                    <h3 style="text-align:center;color:black">查询结果</h3>
                    <div class="pager-header">
                        <div class="header-info">
                            共<span class="info-number">54</span>条结果，
                            分成<span class="info-number">6</span>页显示，
                            当前第<span class="info-number">1</span>页
                        </div>
                        <div class="header-nav">
                            <input type="button" class="clickbutton" value="首页"/>
                            <input type="button" class="clickbutton" value="上页"/>
                            <input type="button" class="clickbutton" value="下页"/>
                            <input type="button" class="clickbutton" value="末页"/>
                            跳到第<input type="text" id="pagenum" class="nav-number"/>页
                            <input type="button" class="clickbutton" value="跳转"/>
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
</html>