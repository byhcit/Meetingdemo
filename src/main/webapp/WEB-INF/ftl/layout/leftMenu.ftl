<div class="page-sidebar">
    <div class="sidebar-menugroup">
        <div class="sidebar-grouptitle">个人中心</div>
        <ul class="sidebar-menu">
                    <li class="sidebar-menuitem"><a href="/meeting/notifications">最新通知</a></li>
        <li class="sidebar-menuitem active"><a href="/meeting/myBooking">我的预定</a></li>
        <li class="sidebar-menuitem"><a href="/meeting/myMeeting">我的会议</a></li>
        </ul>
    </div>
    <div class="sidebar-menugroup">
        <div class="sidebar-grouptitle">人员管理</div>
        <ul class="sidebar-menu">
            <li class="sidebar-menuitem"><a href="/meeting/register">员工注册</a></li>
            <#if currentuser?? && currentuser.role==2>
                          <li class="sidebar-menuitem"><a href="/meeting/admin/deps">部门管理</a></li>
              <li class="sidebar-menuitem"><a href="/meeting/admin/approveAccount">注册审批</a></li>
              <li class="sidebar-menuitem"><a href="/meeting/admin/searchEmps">搜索员工</a></li>
            </#if>
        </ul>
    </div>
    <div class="sidebar-menugroup">
        <div class="sidebar-grouptitle">会议预定</div>
        <ul class="sidebar-menu">
            <#if currentuser?? && currentuser.role==2>
            <li class="sidebar-menuitem"><a href="/meeting/admin/addMeetingRoom">添加会议室</a></li>
            </#if>
            <li class="sidebar-menuitem"><a href="/meeting/meetingRoom">查看会议室</a></li>
            <li class="sidebar-menuitem"><a href="/meeting/bookMeeting">预定会议</a></li>
            <li class="sidebar-menuitem"><a href="/meeting/searchMeetings">搜索会议</a></li>
        </ul>
    </div>
</div>