<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <style type="text/css">
            .pagination {
                margin-top: 20px;
                text-align: center;
            }
            
            .pagination a, .pagination span {
                display: inline-block;
                padding: 5px 10px;
                margin: 0 5px;
                border: 1px solid #ddd;
                text-decoration: none;
                color: #333;
            }
            
            .pagination .current {
                background-color: #337ab7;
                color: white;
                border-color: #2e6da4;
            }
            
            .pagination a:hover {
                background-color: #f5f5f5;
            }
            
            .page-info {
                margin-left: 20px;
                color: #666;
            }

            .page-size-select {
                margin-left: 20px;
                padding: 5px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .listtable {
                width: 100%;
                table-layout: fixed;
                overflow-x: hidden;
            }

            .listtable thead {
                position: sticky;
                top: 0;
                background-color: #f5f5f5;
                z-index: 1;
            }

            .listtable tbody {
                display: block;
                height: 403px; /* 刚好显示10条数据 */
                overflow-y: auto; /* 超过10条时显示滚动条 */
                overflow-x: hidden;
            }

            .listtable tr {
                display: table;
                width: 100%;
                table-layout: fixed;
                height: 36px; /* 每条记录的高度 */
            }

            .listtable td, .listtable th {
                text-align: center;
                padding: 8px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
        </style>
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
            <div class="pagination">
                <#if pageNum gt 1>
                    <a href="/admin/approveAccount?pageNum=${pageNum - 1}&pageSize=${pageSize}">上一页</a>
                </#if>
                
                <#list 1..totalPages as p>
                    <#if p == pageNum>
                        <span class="current">${p}</span>
                    <#else>
                        <a href="/admin/approveAccount?pageNum=${p}&pageSize=${pageSize}">${p}</a>
                    </#if>
                </#list>
                
                <#if pageNum lt totalPages>
                    <a href="/admin/approveAccount?pageNum=${pageNum + 1}&pageSize=${pageSize}">下一页</a>
                </#if>
                
                <span class="page-info">
                    共 ${total} 条记录，每页显示 
                    <select class="page-size-select" onchange="changePageSize(this.value)">
                        <option value="10" <#if pageSize == 10>selected</#if>>10</option>
                        <option value="20" <#if pageSize == 20>selected</#if>>20</option>
                        <option value="30" <#if pageSize == 30>selected</#if>>30</option>
                    </select>
                    条，当前第 ${pageNum}/${totalPages} 页
                </span>
            </div>
        </div>
    </div>
    <#include 'footer.ftl'>
    <script>
        function changePageSize(size) {
            window.location.href = '/admin/approveAccount?pageNum=1&pageSize=' + size;
        }
    </script>
    </body>
</html>