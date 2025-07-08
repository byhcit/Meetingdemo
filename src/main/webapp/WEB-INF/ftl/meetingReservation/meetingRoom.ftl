<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/meeting/styles/common.css"/>
        <link rel="stylesheet" href="/meeting/styles/pagination.css"/>
    </head>
    <body>
        <#include '../layout/top.ftl'>
        <div class="page-body">
            <#include '../layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    会议预定 > 查看会议室
                </div>
                <table class="listtable">
                    <caption>所有会议室:</caption>
                    <tr class="listheader">
                        <th>门牌编号</th>
                        <th>会议室名称</th>
                        <th>容纳人数</th>
                        <th>当前状态</th>
                        <th>操作</th>
                    </tr>
                    <#if mrs ??>
                        <#list mrs as mr>
                            <tr>
                                <td>${mr.roomnum}</td>
                                <td>${mr.roomname}</td>
                                <td>${mr.capacity}</td>
                                <td>${("1" == mr.status)?string('启用',(mr.status=="0")?string('停用','已占用'))}</td>
                                <td>
                                    <a class="clickbutton" href="/meeting/roomDetail?id=${mr.roomid}">查看详情</a>
                                </td>
                            </tr>
                        </#list>
                    </#if>
                </table>
                <#if total?? && total gt 0>
                    <#include '../common/pagination.ftl'>
                    <@pagination pageNum=pageNum!1 pageSize=pageSize!10 total=total totalPages=totalPages!1 url="/meeting/meetingRoom"/>
                </#if>
            </div>
        </div>
        <#include '../layout/footer.ftl'>
    </body>
</html>