<#setting date_format="yyyy-MM-dd HH:mm:ss">
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
        </style>
    </head>
    <body>
        <#include '../layout/top.ftl'>
        <div class="page-body">
            <#include '../layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    会议预定 > 会议详情
                </div>
                <table class="listtable">
                    <tr>
                        <th>会议名称</th>
                        <td>${meeting.meetingname}</td>
                        <th>会议室</th>
                        <td>${meeting.roomname}</td>
                    </tr>
                    <tr>
                        <th>会议开始时间</th>
                        <td>${meeting.starttime?string("yyyy-MM-dd HH:mm:ss")}</td>
                        <th>会议结束时间</th>
                        <td>${meeting.endtime?string("yyyy-MM-dd HH:mm:ss")}</td>
                    </tr>
                    <tr>
                        <th>会议预定时间</th>
                        <td>${meeting.reservationtime?string("yyyy-MM-dd HH:mm:ss")}</td>
                        <th>预定者</th>
                        <td>${meeting.reservername}</td>
                    </tr>
                    <tr>
                        <th>会议状态</th>
                        <td>
                            <#if meeting.status == "0">
                                未开始
                            <#elseif meeting.status == "1">
                                进行中
                            <#elseif meeting.status == "2">
                                已结束
                            <#elseif meeting.status == "3">
                                已取消
                            </#if>
                        </td>
                        <th>取消原因</th>
                        <td class="cell" title="${meeting.canceledReason!''}">${meeting.canceledReason!''}</td>
                    </tr>
                    <tr>
                        <th>会议说明</th>
                        <td colspan="3">${meeting.description!''}</td>
                    </tr>
                </table>
                <div class="command">
                    <input type="button" class="clickbutton" value="返回" onclick="window.history.back();"/>
                </div>
            </div>
        </div>
        <#include '../layout/footer.ftl'>
    </body>
</html> 