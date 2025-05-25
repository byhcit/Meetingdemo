<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.7.1/jquery.js"></script>
        <style>
            .listtable {
                margin-top: 10px;
                width: 100%;
                border-collapse: collapse;
                table-layout: fixed;
            }
            /*.listtable caption {*/
            /*    font-weight: bold;*/
            /*    text-align: left;*/
            /*    padding: 10px 0 10px 10px;*/
            /*}*/
            .listtable thead, .listtable tbody tr {
                display: table;
                width: 100%;
                table-layout: fixed;
            }
            .listtable tbody {
                display: block;
                max-height: 250px; /* 你想要的内容区最大高度 */
                overflow-y: auto;
                overflow-x: hidden;
            }
            .listtable th {
                position: sticky;
                top: 0;
                background: #fff;
                z-index: 1;
            }
        </style>
    </head>
    <body>
        <#include '../layout/top.ftl'>
        <div class="page-body">
            <#include '../layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    人员管理 > 部门管理
                </div>
                <form action="/admin/addDept">
                    <fieldset>
                        <legend>添加部门</legend>
                        部门名称:
                        <input type="text" name="name" id="departmentname" maxlength="20"/>
                        <input type="submit" class="clickbutton" value="添加"/>
                    </fieldset>
                </form>
                <table class="listtable">
                    <caption>所有部门:</caption>
                    <tr class="listheader">
                        <th>部门编号</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    <#if deps??>
                        <#list deps as dep>
                        <tr>
                            <td>${dep.departmentid}</td>
                            <td id="depname${dep.departmentid}">${dep.departmentname}</td>
                            <td>
                                <a class="clickbutton" href="#" id="edit${dep.departmentid}"
                                   onclick="editDep(${dep.departmentid})">编辑</a>
                                <a class="clickbutton" style="display: none" href="#" id="cancel${dep.departmentid}"
                                   onclick="cancelDep(${dep.departmentid})">取消</a>
                                <a class="clickbutton" href="/admin/deleteDep?id=${dep.departmentid}">删除</a>
                            </td>
                        </tr>
                        </#list>
                    </#if>
                </table>
            </div>
        </div>
        <#include '../layout/footer.ftl'>
    <script>
        var depName;
        function editDep(depid){
            var editBtn = $('#edit' + depid);
            var cancelBtn = $('#cancel' + depid);
            var ele = $('#depname' + depid);
            console.log('ele===>', ele, typeof ele);
            depName = ele.html();
            console.log("depName===>",depName);
            if (cancelBtn.css('display') === 'none') {
                cancelBtn.css('display', 'inline');
                editBtn.html('确定');
                console.log('ele.text()===>', ele.text());
                depName = ele.text();
                ele.html('<input type="text" value="' + depName + '" />');
            } else {
                var children = ele.children('input');
                window.children = children;
                console.log("children===>", children);
                var val = children.val();
                $.post('/admin/updateDep',{id:depid,name:val},(msg) => {
                    if ('success' === msg){
                        cancelBtn.css('display', 'none');
                        editBtn.html('编辑');
                        ele.html(val)
                    }
                })
            }
        }

        function cancelDep(depid) {
            var editBtn = $('#edit' + depid);
            var cancelBtn = $('#cancel' + depid);
            var ele = $('#depname' + depid);
            cancelBtn.css('display', 'none');
            editBtn.html('编辑');
            ele.html(depName);
        }
    </script>
    </body>
</html>