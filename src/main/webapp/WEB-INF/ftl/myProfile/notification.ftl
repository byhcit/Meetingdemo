<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <style>
            .cell {
                max-width: 200px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .cell:hover {
                position: relative;
            }
            .cell:hover::after {
                content: attr(title);
                position: absolute;
                left: 0;
                top: 100%;
                background: white;
                border: 1px solid #ccc;
                padding: 5px;
                z-index: 1000;
                white-space: normal;
                width: 200px;
                box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
            }
            .listtable {
                width: 100%;
                table-layout: fixed;
            }
            .listtable th:nth-child(1) { width: 25%; }
            .listtable th:nth-child(2) { width: 15%; }
            .listtable th:nth-child(3) { width: 15%; }
            .listtable th:nth-child(4) { width: 15%; }
            .listtable th:nth-child(5) { width: 20%; }
            .listtable th:nth-child(6) { width: 10%; }
        </style>
    </head>
    <body>
    <#include '../layout/top.ftl'>
    <div class="page-body">
        <#include '../layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    个人中心 > <a href="notifications">最新通知</a>
                </div>
                <table class="listtable">
                    <caption style="text-align:left; position:relative;">
                        未来7天我要参加的会议:
                        <span style="float:right;">
                            <#if upcomingTotalPages gt 0>
                                <#if upcomingPage gt 1>
                                    <a href="?upcomingPage=1" class="clickbutton">首页</a>
                                    <a href="?upcomingPage=${upcomingPage-1}" class="clickbutton">上一页</a>
                                </#if>
                                第${upcomingPage}/${upcomingTotalPages}页
                                <#if upcomingPage lt upcomingTotalPages>
                                    <a href="?upcomingPage=${upcomingPage+1}" class="clickbutton">下一页</a>
                                    <a href="?upcomingPage=${upcomingTotalPages}" class="clickbutton">末页</a>
                                </#if>
                            </#if>
                        </span>
                    </caption>
                    <tr class="listheader">
                        <th style="width:300px">会议名称</th>
                        <th>会议室</th>
                        <th>起始时间</th>
                        <th>结束时间</th>
                        <th style="width:100px">操作</th>
                    </tr>
                    <#if upcomingMeetings?? && upcomingMeetings?is_sequence && upcomingMeetings?size gt 0>
                        <#list upcomingMeetings as m>
                            <tr>
                                <td class="cell" title="${m.meetingName}">${m.meetingName}</td>
                                <td class="cell" title="${m.roomName}">${m.roomName}</td>
                                <td class="cell" title="${m.startTime}">${m.startTime}</td>
                                <td class="cell" title="${m.endTime}">${m.endTime}</td>
                                <td><a class="clickbutton" href="/meetingdetails?id=${m.meetingId}">查看详情</a></td>
                            </tr>
                        </#list>
                    <#else>
                        <tr>
                            <td colspan="5" style="text-align: center; padding: 20px; color: #666;">未来7天内没有您要参加的会议</td>
                        </tr>
                    </#if>
                </table>
                <table class="listtable">
                    <caption style="text-align:left; position:relative;">
                        已取消的会议:
                        <span style="float:right;">
                            <#if cancelledTotalPages gt 0>
                                <#if cancelledPage gt 1>
                                    <a href="?cancelledPage=1" class="clickbutton">首页</a>
                                    <a href="?cancelledPage=${cancelledPage-1}" class="clickbutton">上一页</a>
                                </#if>
                                第${cancelledPage}/${cancelledTotalPages}页
                                <#if cancelledPage lt cancelledTotalPages>
                                    <a href="?cancelledPage=${cancelledPage+1}" class="clickbutton">下一页</a>
                                    <a href="?cancelledPage=${cancelledTotalPages}" class="clickbutton">末页</a>
                                </#if>
                            </#if>
                        </span>
                    </caption>
                    <tr class="listheader">
                        <th style="width:300px">会议名称</th>
                        <th>会议室</th>
                        <th>起始时间</th>
                        <th>结束时间</th>
                        <th>取消原因</th>
                        <th style="width:100px">操作</th>
                    </tr>
                        <#if cancelledMeetings?? && cancelledMeetings?is_sequence && cancelledMeetings?size gt 0>
                            <#list cancelledMeetings as m>
                                <tr>
                                    <td class="cell" title="${m.meetingName}">${m.meetingName}</td>
                                    <td class="cell" title="${m.roomName}">${m.roomName}</td>
                                    <td class="cell" title="${m.startTime}">${m.startTime}</td>
                                    <td class="cell" title="${m.endTime}">${m.endTime}</td>
                                    <td class="cell" title="${m.canceledReason!''}">${m.canceledReason!''}</td>
                                    <td><a class="clickbutton" href="/meetingdetails?id=${m.meetingId}">查看详情</a></td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="5" style="text-align: center; padding: 20px; color: #666;">没有已取消的会议</td>
                            </tr>
                        </#if>
                </table>
                
            </div>
        </div>
    <#include '../layout/footer.ftl'>
    </body>
</html>