<div class="page-header">
    <div class="header-banner">
        <img src="/images/header.png" alt="CoolMeeting"/>
    </div>
    <div class="header-title">
        欢迎访问Cool-Meeting会议管理系统
    </div>
    <div class="header-quicklink">
        欢迎您
        <#if currentuser??>
            <div class="user-dropdown">
                <span class="user-name">${currentuser.employeename!''}</span>
                <div class="dropdown-menu">
                    <a href="/toChangePassword">修改密码</a>
                    <a href="/logout">退出登录</a>
                </div>
            </div>
        </#if>
    </div>
</div>

<style>
    .user-dropdown {
        position: relative;
        display: inline-block;
        margin-left: 5px;
    }

    .user-name {
        cursor: pointer;
        color: #2b579a;
        padding: 5px;
    }

    .dropdown-menu {
        display: none;
        position: absolute;
        right: 0;
        top: 100%;
        background-color: white;
        min-width: 120px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        z-index: 1000;
    }

    .user-dropdown:hover .dropdown-menu {
        display: block;
    }

    .dropdown-menu a {
        display: block;
        padding: 8px 15px;
        color: #333;
        text-decoration: none;
        white-space: nowrap;
    }

    .dropdown-menu a:hover {
        background-color: #f5f5f5;
    }
</style>