<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <link rel="stylesheet" href="/styles/pagination.css"/>
        <style>
            .table-container {
                width: 100%;
                overflow-x: auto;
                margin-bottom: 20px;
            }
            .listtable {
                min-width: 1200px;
                table-layout: fixed;
            }
            .listtable td:not(:last-child), .listtable th:not(:last-child) {
                text-align: center;
                padding: 5px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .listtable td:last-child {
                text-align: center;
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <#include '../layout/top.ftl'>
        <div class="page-body">
            <#include '../layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    个人中心 > 我的预定
                </div>
                <div class="table-container">
                    <table class="listtable">
                        <caption>我预定的会议：</caption>
                        <tr class="listheader">
                            <th>会议名称</th>
                            <th>会议室名称</th>
                            <th>会议开始时间</th>
                            <th>会议结束时间</th>
                            <th>会议预定时间</th>
                            <th>会议状态</th>
                            <th>操作</th>
                        </tr>
                        <#if booking?? && booking?is_sequence && booking?size gt 0>
                            <#list booking as b>
                                <tr>
                                    <td title="${b.meetingname}">${b.meetingname}</td>
                                    <td title="${b.roomname}">${b.roomname}</td>
                                    <td title="${(b.starttime?string('yyyy-MM-dd HH:mm:ss'))!''}">${(b.starttime?string('yyyy-MM-dd HH:mm:ss'))!''}</td>
                                    <td title="${(b.endtime?string('yyyy-MM-dd HH:mm:ss'))!''}">${(b.endtime?string('yyyy-MM-dd HH:mm:ss'))!''}</td>
                                    <td title="${(b.reservationtime?string('yyyy-MM-dd HH:mm:ss'))!''}">${(b.reservationtime?string('yyyy-MM-dd HH:mm:ss'))!''}</td>
                                    <td title="<#if b.status == '0'>未开始<#elseif b.status == '1'>进行中<#elseif b.status == '2'>已结束</#if>">
                                        <#if b.status == "0">未开始
                                        <#elseif b.status == "1">进行中
                                        <#elseif b.status == "2">已结束
                                        </#if>
                                    </td>
                                    <td>
                                        <a class="clickbutton" href="/meetingdetails?id=${b.meetingid}">查看</a>
                                        <#if b.status == "0">
                                            <a class="clickbutton" href="/myMeetingDetail?id=${b.meetingid}">修改</a>
                                            <a class="clickbutton" href="/cancelMeeting?id=${b.meetingid}&name=${b.meetingname}">取消</a>
                                        </#if>
                                    </td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="7" style="text-align: center; padding: 20px; color: #666;">没有您预定的会议</td>
                            </tr>
                        </#if>
                    </table>
                </div>
                <#if total?? && total gt 0>
                    <#include '../common/pagination.ftl'>
                    <@pagination pageNum=pageNum!1 pageSize=pageSize!1 total=total totalPages=totalPages!1 url="/myBooking"/>
                </#if>
            </div>
        </div>
        <#include '../layout/footer.ftl'>
    </body>
</html>