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
                    会议预定 > 添加会议室
                </div>
                <#if error??>
                    <div class="error">${error!''}</div>
                </#if>
                <form action="/admin/doAddMr" method="post">
                    <fieldset>
                        <legend>会议室信息</legend>
                        <table class="formtable">
                            <tr>
                                <td>门牌号:</td>
                                <td>
                                    <input name="roomnum" type="text" placeholder="例如：201" maxlength="10"/>
                                </td>
                            </tr>
                            <tr>
                                <td>会议室名称:</td>
                                <td>
                                    <input name="roomname" type="text" placeholder="例如：第一会议室" maxlength="20"/>
                                </td>
                            </tr>
                            <tr>
                                <td>最多容纳人数：</td>
                                <td>
                                    <input name="capacity" type="text" placeholder="填写一个正整数"/>
                                </td>
                            </tr>
                            <tr>
                                <td>当前状态：</td>
                                <td>
                                    <input type="radio" id="status" name="status" checked="checked" value="1"/><label for="status">启用</label>
                                    <input type="radio" id="status" name="status" value="0"/><label for="status">停用</label>
                                </td>
                            </tr>
                            <tr>
                                <td>备注：</td>
                                <td>
                                    <textarea name="description" maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <input type="submit" value="添加" class="clickbutton"/>
                                    <input type="reset" value="重置" class="clickbutton"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </div>
        </div>
    <#include '../layout/footer.ftl'>
    </body>
</html>