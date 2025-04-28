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
                    人员管理 > 部门管理
                </div>
                <form action="/admin/addDept">
                    <fieldset>
                        <legend>添加部门</legend>
                        部门名称:
                        <input type="text" name="name" id="departmentname" maxlength="20"/>
                        <input type="submit" class="clickbutton" value="添加"/>
                    </fieldset>
                </form>
                <table class="listtable">
                    <caption>所有部门:</caption>
                    <tr class="listheader">
                        <th>部门编号</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    <#if deps??>
                        <#list deps as dep>
                        <tr>
                            <td>${dep.departmentid}</td>
                            <td>${dep.departmentname}</td>
                            <td>
                                <a class="clickbutton" href="#" id="edit${dep.departmentid}"
                                   onclick="editDep(${dep.departmentid})">编辑</a>
                                <a class="clickbutton" style="display: none" href="#" id="edit${dep.departmentid}"
                                   onclick="cancelDep(${dep.departmentid})">取消</a>
                                <a class="clickbutton" href="/admin/deletedep?departmentid=${dep.departmentid}">删除</a>
                            </td>
                        </tr>
                        </#list>
                    </#if>
<#--                    <tr>-->
<#--                        <td>1</td>-->
<#--                        <td>技术部</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="#">编辑</a>-->
<#--                            <a class="clickbutton" href="#">删除</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>2</td>-->
<#--                        <td>-->
<#--                            <input type="text" value="销售部"/>-->
<#--                        </td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="#">编辑</a>-->
<#--                            <a class="clickbutton" href="#">取消</a>-->
<#--                            <a class="clickbutton" href="#">删除</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>3</td>-->
<#--                        <td>市场部</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="#">编辑</a>-->
<#--                            <a class="clickbutton" href="#">删除</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>4</td>-->
<#--                        <td>行政部</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="#">编辑</a>-->
<#--                            <a class="clickbutton" href="#">删除</a>-->
<#--                        </td>-->
<#--                    </tr>-->
                </table>
            </div>
        </div>
        <#include 'footer.ftl'>
    </body>
</html>