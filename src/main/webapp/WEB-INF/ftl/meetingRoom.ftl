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
                                <td>${("1" == mr.status)?string('启用',(mr.status=="0")?string('停用''已占用'))}</td>
                                <td>
                                    <a class="clickbutton" href="/roomDetail?id=${mr.roomid}">查看详情</a>
                                </td>
                            </tr>
                        </#list>
                    </#if>
                </table>
                <#include 'pagination.ftl'>
                <@pagination pageNum=pageNum pageSize=pageSize total=total totalPages=totalPages url="/meetingRoom"/>
            </div>
        </div>
        <#include 'footer.ftl'>
    </body>
</html>