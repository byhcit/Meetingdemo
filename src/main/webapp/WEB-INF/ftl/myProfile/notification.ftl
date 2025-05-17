<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
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
                    <#if upcomingMeetings?? && upcomingMeetings?size gt 0>
                            <#list upcomingMeetings as m>
                                <tr>
                                <td>${m.meetingName}</td>
                                <td>${m.roomName}</td>
                                <td>${m.startTime}</td>
                                <td>${m.endTime}</td>
                                <td><a class="clickbutton" href="/meetingdetails?id=${m.meetingId}">查看详情</a></td>
                                </tr>
                            </#list>
                    <#else>
                        <tr>
                            <td colspan="5" style="text-align: center; padding: 20px; color: #666;">未来7天内没有您要参加的会议</td>
                        </tr>
                    </#if>
<#--                    <tr>-->
<#--                        <td>三季度销售总结会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-11-20 9：00</td>-->
<#--                        <td>2013-11-20 11：00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>与Google合作推广Android技术培训会议</td>-->
<#--                        <td>第三会议室</td>-->
<#--                        <td>2013-11-18 9：00</td>-->
<#--                        <td>2013-11-18 11：00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>员工例行面谈</td>-->
<#--                        <td>小会议室</td>-->
<#--                        <td>2013-11-16 16：00</td>-->
<#--                        <td>2013-11-16 17：00</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
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
                    <tr>
                        <#if cancelledMeetings?? && cancelledMeetings?size gt 0>
                            <#list cancelledMeetings as m>
                                <td>${m.meetingName}</td>
                                <td>${m.roomName}</td>
                                <td>${m.startTime}</td>
                                <td>${m.endTime}</td>
                                <td><a class="clickbutton" href="/meetingdetails?id=${m.meetingId}">查看详情</a></td>
                            </#list>
                        <#else>
                            <td colspan="5" style="text-align: center; padding: 20px; color: #666;">没有已取消的会议</td>
                        </#if>
<#--                        <td>三季度销售总结会</td>-->
<#--                        <td>第一会议室</td>-->
<#--                        <td>2013-11-20 9：00</td>-->
<#--                        <td>2013-11-20 11：00</td>-->
<#--                        <td>人员出差</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
                    </tr>
<#--                    <tr>-->
<#--                        <td>与Google合作推广Android技术培训会议</td>-->
<#--                        <td>第三会议室</td>-->
<#--                        <td>2013-11-18 9：00</td>-->
<#--                        <td>2013-11-18 11：00</td>-->
<#--                        <td>人员出差</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
<#--                    <tr>-->
<#--                        <td>员工例行面谈</td>-->
<#--                        <td>小会议室</td>-->
<#--                        <td>2013-11-16 16：00</td>-->
<#--                        <td>2013-11-16 17：00</td>-->
<#--                        <td>人员出差</td>-->
<#--                        <td>-->
<#--                            <a class="clickbutton" href="meetingdetails.html">查看详情</a>-->
<#--                        </td>-->
<#--                    </tr>-->
                </table>
                
            </div>
        </div>
    <#include '../layout/footer.ftl'>
    </body>
</html>