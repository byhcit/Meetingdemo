<#setting date_format="yyyy-MM-dd HH:mm:ss">
<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <style type="text/css">
            
        </style>
    </head>
    <body>
        <#include '../layout/top.ftl'>
        <div class="page-body">
            <#include '../layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    会议预定 > 搜索会议
                </div>
                <form action="/searchMeetings" method="post">
                    <fieldset>
                        <legend>搜索会议</legend>
                        <table class="formtable">
                            <tr>
                                <td>会议名称：</td>
                                <td>
                                    <input type="text" name="meetingname" value="${meetingCond.meetingname!''}" maxlength="20"/>
                                </td>
                                <td>会议室名称：</td>
                                <td>
                                    <input type="text" name="roomname" value="${meetingCond.roomname!''}" maxlength="20"/>
                                </td>
                                <td>预定者姓名：</td>
                                <td>
                                    <input type="text" name="reservername" value="${meetingCond.reservername!''}" maxlength="20"/>
                                </td>
                            </tr>
                            <tr>
                                <td>预定日期：</td>
                                <td colspan="5">
                                    从&nbsp;<input type="date" name="reservefromdate" value="${meetingCond.reservefromdate!''}" placeholder="例如：2013-10-20"/>
                                    到&nbsp;<input type="date" name="reservetodate" value="${meetingCond.reservetodate!''}" placeholder="例如：2013-10-22"/>
                                </td>
                            </tr>
                            <tr>
                                <td>会议日期：</td>
                                <td colspan="5">
                                    从&nbsp;<input type="date" name="meetingfromdate" value="${meetingCond.meetingfromdate!''}" placeholder="例如：2013-10-20"/>
                                    到&nbsp;<input type="date" name="meetingtodate" value="${meetingCond.meetingtodate!''}" placeholder="例如：2013-10-22"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="command">
                                    <input type="submit" value="查询" class="clickbutton"/>
                                    <input type="button" class="clickbutton" value="重置" onclick="window.location.href='/searchMeetings'"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
                <div>
                    <h3 style="text-align:center;color:black">查询结果</h3>
                    <div class="pager-header">
                        <div class="header-info">
                            共<span class="info-number">${total}</span>条结果，
                            分成<span class="info-number">${totalPages}</span>页显示，
                            当前第<span class="info-number">${page}</span>页
                        </div>
                        <div class="header-nav">
                            <#assign queryParams = "">
                            <#if meetingCond.meetingname??>
                                <#assign queryParams = queryParams + "&meetingname=" + meetingCond.meetingname>
                            </#if>
                            <#if meetingCond.roomname??>
                                <#assign queryParams = queryParams + "&roomname=" + meetingCond.roomname>
                            </#if>
                            <#if meetingCond.reservername??>
                                <#assign queryParams = queryParams + "&reservername=" + meetingCond.reservername>
                            </#if>
                            <#if meetingCond.reservefromdate??>
                                <#assign queryParams = queryParams + "&reservefromdate=" + meetingCond.reservefromdate>
                            </#if>
                            <#if meetingCond.reservetodate??>
                                <#assign queryParams = queryParams + "&reservetodate=" + meetingCond.reservetodate>
                            </#if>
                            <#if meetingCond.meetingfromdate??>
                                <#assign queryParams = queryParams + "&meetingfromdate=" + meetingCond.meetingfromdate>
                            </#if>
                            <#if meetingCond.meetingtodate??>
                                <#assign queryParams = queryParams + "&meetingtodate=" + meetingCond.meetingtodate>
                            </#if>
                            
                            <a href="/searchMeetings?page=1${queryParams}" class="clickbutton">首页</a>
                            <#if page gt 1>
                                <a href="/searchMeetings?page=${page-1}${queryParams}" class="clickbutton">上页</a>
                            </#if>
                            <#if page lt totalPages>
                                <a href="/searchMeetings?page=${page+1}${queryParams}" class="clickbutton">下页</a>
                            </#if>
                            <a href="/searchMeetings?page=${totalPages}${queryParams}" class="clickbutton">末页</a>
                            跳到第<input type="text" id="pagenum" class="nav-number"/>页
                            <input type="button" class="clickbutton" value="跳转" onclick="goToPage()"/>
                        </div>
                    </div>
                </div>
                <table class="listtable">
                    <tr class="listheader">
                        <th>会议名称</th>
                        <th>会议室名称</th>
                        <th>会议开始时间</th>
                        <th>会议结束时间</th>
                        <th>会议预定时间</th>
                        <th>预定者</th>
                        <th>操作</th>
                    </tr>
                    <#if meetings ??>
                        <#list meetings as meeting>
                            <tr>
                                <td>${meeting.meetingname}</td>
                                <td>${meeting.roomname}</td>
                                <td>${meeting.starttime?string("yyyy-MM:dd HH:mm:ss")}</td>
                                <td>${meeting.endtime?string("yyyy-MM:dd HH:mm:ss")}</td>
                                <td>${meeting.reservationtime?string("yyyy-MM:dd HH:mm:ss")}</td>
                                <td>${meeting.reservername}</td>
                                <td>
                                    <a class="clickbutton" href="/meetingdetails?id=${meeting.meetingid}">查看详情</a>
                                </td>
                            </tr>
                        </#list>
                    </#if>
                </table>
            </div>
        </div>
        <#include '../layout/footer.ftl'>
    </body>
    <script>
        function goToPage() {
            var pageNum = document.getElementById('pagenum').value;
            if (pageNum && pageNum > 0) {
                var queryParams = '';
                <#if meetingCond.meetingname??>
                    queryParams += '&meetingname=${meetingCond.meetingname}';
                </#if>
                <#if meetingCond.roomname??>
                    queryParams += '&roomname=${meetingCond.roomname}';
                </#if>
                <#if meetingCond.reservername??>
                    queryParams += '&reservername=${meetingCond.reservername}';
                </#if>
                <#if meetingCond.reservefromdate??>
                    queryParams += '&reservefromdate=${meetingCond.reservefromdate}';
                </#if>
                <#if meetingCond.reservetodate??>
                    queryParams += '&reservetodate=${meetingCond.reservetodate}';
                </#if>
                <#if meetingCond.meetingfromdate??>
                    queryParams += '&meetingfromdate=${meetingCond.meetingfromdate}';
                </#if>
                <#if meetingCond.meetingtodate??>
                    queryParams += '&meetingtodate=${meetingCond.meetingtodate}';
                </#if>
                window.location.href = '/searchMeetings?page=' + pageNum + queryParams;
            } else {
                alert('请输入有效的页码！');
            }
        }
    </script>
</html>