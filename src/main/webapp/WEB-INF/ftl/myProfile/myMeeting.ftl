<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <link rel="stylesheet" href="/styles/pagination.css"/>
        <style>
            .listtable {
                width: 100%;
                table-layout: fixed;
            }
            .listtable td, .listtable th {
                text-align: center;
                padding: 5px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
        </style>
    </head>
    <body>
        <#include '../layout/top.ftl'>
        <div class="page-body">
            <#include '../layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    个人中心 > 我的会议
                </div>
                <table class="listtable">
                    <caption>我将参加的会议：</caption>
                    <tr class="listheader">
                        <th>会议名称</th>
                        <th>会议室名称</th>
                        <th>会议开始时间</th>
                        <th>会议结束时间</th>
                        <th>会议预定时间</th>
                        <th>预定者</th>
                        <th>操作</th>
                    </tr>
                    <#if meetings?? && meetings?is_sequence && meetings?size gt 0>
                        <#list meetings as m>
                            <tr>
                                <td title="${m.meetingname}">${m.meetingname}</td>
                                <td title="${m.roomname}">${m.roomname}</td>
                                <td title="${m.starttime?string('yyyy-MM-dd HH:mm:ss')}">${m.starttime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td title="${m.endtime?string('yyyy-MM-dd HH:mm:ss')}">${m.endtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td title="${m.reservationtime?string('yyyy-MM-dd HH:mm:ss')}">${m.reservationtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td title="${m.reservername}">${m.reservername}</td>
                                <td><a class="clickbutton" href="/meetingdetails?id=${m.meetingid}">查看详情</a></td>
                            </tr>
                        </#list>
                    <#else>
                        <tr>
                            <td colspan="7" style="text-align: center; padding: 20px; color: #666;">没有您要参加的会议</td>
                        </tr>
                    </#if>
                </table>
                <#if total?? && total gt 0>
                    <#include '../common/pagination.ftl'>
                    <@pagination pageNum=pageNum!1 pageSize=pageSize!10 total=total totalPages=totalPages!1 url="/myMeeting"/>
                </#if>
            </div>
        </div>
        <#include '../layout/footer.ftl'>
    </body>
</html>