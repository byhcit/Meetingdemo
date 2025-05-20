<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <link rel="stylesheet" href="/styles/pagination.css"/>
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
                                <td>${m.meetingname}</td>
                                <td>${m.roomname}</td>
                                <td>${m.starttime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                <td>${m.endtime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                <td>${m.reservationtime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                <td>${m.reservername}</td>
                                <td><a class="clickbutton" href="/meetingdetails?id=${m.meetingid}">查看详情</a></td>
                            </tr>
                        </#list>
                    <#else>
                        <tr>
                            <td colspan="5" style="text-align: center; padding: 20px; color: #666;">没有您要参加的会议</td>
                        </tr>
                    </#if>
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>Jerry</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
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