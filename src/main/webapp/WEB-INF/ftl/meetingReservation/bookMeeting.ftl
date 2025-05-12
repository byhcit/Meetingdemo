<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.7.1/jquery.js"></script>
        <script src="/My97DatePicker/WdatePicker.js"></script>
        <style type="text/css">
            #divfrom{
                float:left;
                width:150px;
            }
            #divto{
                float:left;
                width:150px;
            }
            #divoperator{
                float:left;
                width:50px;
                padding:60px 5px;
            }
            #divoperator input[type="button"]{
                margin:10px 0;
            }
            #selDepartments{
                display:block;
                width:100%;
            }
            #selEmployees{
                display:block;
                width:100%;
                height:200px;
            }
            #selSelectedEmployees{
                display:block;
                width:100%;
                height:225px;
            }
        </style>
        <script type="application/javascript">

            var selDepartments;
            var selEmployees;
            var selSelectedEmployees;

            function body_load(){
                selDepartments = document.getElementById("selDepartments");
                selEmployees = document.getElementById("selEmployees");
                selSelectedEmployees = document.getElementById("selSelectedEmployees");
                console.log(selDepartments);
                console.log(selEmployees);
                console.log(selSelectedEmployees);
                $.get("/allDeps",function (data) {
                    console.log("data",data)
                    for(let i =0; i <data.length; i++){
                    var item = data[i];
                    var dep = document.createElement("option");
                    dep.value = item.departmentid;
                    dep.text = item.departmentname;
                    selDepartments.appendChild(dep);
                    }
                    fillEmployees();
                    <#if selectedMps??>
                    var selectedMps = [<#list selectedMps as mp>${mp}<#if mp_has_next>,</#if></#list>];
                    if (selectedMps.length > 0) {
                        for (var i = 0; i < selDepartments.options.length; i++) {
                            setTimeout(function() {
                                for (var j = 0; j < selEmployees.options.length; j++) {
                                    if (selectedMps.indexOf(parseInt(selEmployees.options[j].value)) !== -1) {
                                        addEmployee(selEmployees.options[j]);
                                    }
                                }
                            }, 100);
                        }
                    }
                    </#if>
                })
            }

            function fillEmployees(){
                clearList(selEmployees);
                var departmentid = selDepartments.options[selDepartments.selectedIndex].value;
                $.get("/getEmpsByDepid?id="+departmentid,function (data) {
                    for (let i = 0; i < data.length; i++) {
                        var emp = document.createElement("option");
                        emp.value = data[i].employeeid;
                        emp.text = data[i].employeename;
                        selEmployees.appendChild(emp);
                    }
                })
            }

            function clearList(list){
                while(list.childElementCount > 0){
                    list.removeChild(list.lastChild);
                }
            }

            function selectEmployees(){
                for(var i=0;i<selEmployees.options.length;i++){
                    if (selEmployees.options[i].selected){
                        addEmployee(selEmployees.options[i]);
                        selEmployees.options[i].selected = false;
                    }
                }
            }

            function deSelectEmployees(){
                var elementsToRemoved = new Array();
                var options = selSelectedEmployees.options;
                for(var i=0;i<options.length;i++){
                    if (options[i].selected){
                        elementsToRemoved.push(options[i]);
                    }
                }
                for(i=0;i<elementsToRemoved.length;i++){
                    selSelectedEmployees.removeChild(elementsToRemoved[i]);
                }
            }

            function addEmployee(optEmployee){
                var options = selSelectedEmployees.options;
                var i = 0;
                var insertIndex = -1;
                while(i < options.length){
                    if (optEmployee.value == options[i].value){
                        return;
                    } else if (optEmployee.value < options[i].value) {
                        insertIndex = i;
                        break;
                    }
                    i++;
                }
                var opt = document.createElement("option");
                opt.value = optEmployee.value;
                opt.text = optEmployee.text;
                opt.selected = true;

                if (insertIndex == -1){
                    selSelectedEmployees.appendChild(opt);
                } else {
                    selSelectedEmployees.insertBefore(opt, options[insertIndex]);
                }
            }
        </script>
    </head>
    <body onload="body_load()">
        <#include '../layout/top.ftl'>
        <div class="page-body">
            <#include '../layout/leftMenu.ftl'>
            <div class="page-content">
                <div class="content-nav">
                    会议预定 > 预定会议
                </div>
                <#if error??>
                    <div class="error-message" style="color: red; margin: 10px 0;">${error}</div>
                </#if>
                <form action="/doAddMeeting" method="post">
                    <fieldset>
                        <legend>会议信息</legend>
                        <table class="formtable">
                            <tr>
                                <td>会议名称：</td>
                                <td>
                                    <input type="text" name="meetingname" maxlength="20" value="${(meeting.meetingname)!''}"/>
                                </td>
                            </tr>
                            <tr>
                                <td>预计参加人数：</td>
                                <td>
                                    <input type="text" name="numberofparticipants" value="${(meeting.numberofparticipants)!''}"/>
                                </td>
                            </tr>
                            <tr>
                                <td>预计开始时间：</td>
                                <td>
                                    <input type="text" class="Wdate" name="starttime" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'})" autocomplete="off" value="${(meeting.starttime?string('yyyy-MM-dd HH:mm:ss'))!''}">
                                </td>
                            </tr>
                            <tr>
                                <td>预计结束时间：</td>
                                <td>
                                    <input type="text" class="Wdate" name="endtime" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'})" autocomplete="off" value="${(meeting.endtime?string('yyyy-MM-dd HH:mm:ss'))!''}">
                                </td>
                            </tr>
							<tr>
                                <td>会议室名称：</td>
                                <td>
                                    <select name="roomid">
                                        <#list mrs as mr>
                                            <option value="${mr.roomid}" <#if meeting?? && meeting.roomid?? && meeting.roomid == mr.roomid>selected</#if>>${mr.roomname}</option>
                                        </#list>
                                     </select>
                                </td>
                            </tr>
                            <tr>
                                <td>会议说明：</td>
                                <td>
                                    <textarea name="description" rows="5">${(meeting.description)!''}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>选择参会人员：</td>
                                <td>
                                    <div id="divfrom">
                                        <select id="selDepartments" onchange="fillEmployees()">
                                        </select>
                                        <select id="selEmployees" multiple="true">
                                        </select>
                                    </div>
                                    <div id="divoperator">
                                        <input type="button" class="clickbutton" value="&gt;" onclick="selectEmployees()"/>
                                        <input type="button" class="clickbutton" value="&lt;" onclick="deSelectEmployees()"/>
                                    </div>
                                    <div id="divto">
                                        <select name="mps" id="selSelectedEmployees" multiple="true">
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="command" colspan="2">
                                    <input type="submit" class="clickbutton" value="预定会议"/>
                                    <input type="button" class="clickbutton" value="重置" onclick="clearForm()"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </div>
        </div>
        <#include '../layout/footer.ftl'>
        <script type="text/javascript">
            function clearForm() {
                // 清空所有输入字段
                document.querySelector('input[name="meetingname"]').value = '';
                document.querySelector('input[name="numberofparticipants"]').value = '';
                document.querySelector('input[name="starttime"]').value = '';
                document.querySelector('input[name="endtime"]').value = '';
                document.querySelector('textarea[name="description"]').value = '';
                
                // 重置会议室选择
                var roomSelect = document.querySelector('select[name="roomid"]');
                if (roomSelect.options.length > 0) {
                    roomSelect.selectedIndex = 0;
                }
                
                // 清空选中的参会员工
                clearList(document.getElementById('selSelectedEmployees'));
                
                // 清空错误信息
                var errorDiv = document.querySelector('.error-message');
                if (errorDiv) {
                    errorDiv.remove();
                }
            }
        </script>
    </body>
</html>