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
                    个人中心 > 我的预定
                </div>
                <table class="listtable">
                    <caption>我预定的会议：</caption>
                    <tr class="listheader">
                        <th>会议名称</th>
                        <th>会议室名称</th>
                        <th>会议开始时间</th>
                        <th>会议结束时间</th>
                        <th>会议预定时间</th>
                        <th>操作</th>
                    </tr>
                    <#if booking?? && booking?is_sequence && booking?size gt 0>
                        <#list booking as b>
                            <tr><td>${b.meetingname}</td>
                                <td>${b.roomname}</td>
                                <td>${b.starttime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td>${b.endtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td>${b.reservationtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td>
                                    <a class="clickbutton" href="/meetingdetails?id=${b.meetingid}">查看</a>
                                    <a class="clickbutton" href="/cancelMeeting?id=${b.meetingid}&name=${b.meetingname}">取消</a>
                                </td>
                            </tr>
                        </#list>
                    <#else>
                        <tr>
                            <td colspan="5" style="text-align: center; padding: 20px; color: #666;">没有您预定的会议</td>
                        </tr>
                    </#if>
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="mymeetingdetails.html">查看/撤销</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="mymeetingdetails.html">查看/撤销</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="mymeetingdetails.html">查看/撤销</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="mymeetingdetails.html">查看/撤销</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="mymeetingdetails.html">查看/撤销</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="mymeetingdetails.html">查看/撤销</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="mymeetingdetails.html">查看/撤销</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>业务洽谈会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-10-12 8:00</td>-->
<#--                        <td>2013-10-12 12:00</td>-->
<#--                        <td>2013-10-10 16:00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="mymeetingdetails.html">查看/撤销</a>-->
<#--                        </td>-->
<#--                    </tr>-->
                </table>
                <#if total?? && total gt 0>
                    <#include '../common/pagination.ftl'>
                    <@pagination pageNum=pageNum!1 pageSize=pageSize!1 total=total totalPages=totalPages!1 url="/myBooking"/>
                </#if>
            </div>
        </div>
        <#include '../layout/footer.ftl'>
    </body>
</html>