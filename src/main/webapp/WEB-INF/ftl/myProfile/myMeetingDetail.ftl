<!DOCTYPE html>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/styles/common.css"/>
        <script src="/My97DatePicker/WdatePicker.js"></script>
        <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.7.1/jquery.js"></script>
        <script type="text/javascript">
            function validateParticipants(input) {
                var value = parseInt(input.value);
                if (value < 2) {
                    alert('预计参加人数不能小于2人');
                    input.value = 2;
                }
            }
        </script>
        <style type="text/css">
            #divfrom{
                float:left;
                width:200px;
            }
            #divto{
                float:left;
                width:200px;
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
            function employee(employeeid, employeename){
                this.employeeid = employeeid;
                this.employeename = employeename;
            }
            function department(departmentid, departmentname, employees){
                this.departmentid = departmentid;
                this.departmentname = departmentname;
                this.employees = employees;
            }
            var data = new Array(
                new department(1, "技术部", new Array(
                    new employee(1001, "a00"), new employee(1002, "a01"), new employee(1003, "a02"), new employee(1004, "a03"))),
                new department(2, "销售部", new Array(
                    new employee(2001, "b00"), new employee(2002, "b01"), new employee(2003, "b02"), new employee(2004, "b03"))),
                new department(3, "市场部", new Array(
                    new employee(3001, "c00"), new employee(3002, "c01"), new employee(3003, "c02"), new employee(3004, "c03"))),
                new department(4, "行政部", new Array(
                    new employee(4001, "d00"), new employee(4002, "d01"), new employee(4003, "d02"), new employee(4004, "d03"))));
            
            var selDepartments;
            var selEmployees;
            var selSelectedEmployees;
            
            function body_load(){
                selDepartments = document.getElementById("selDepartments");
                selEmployees = document.getElementById("selEmployees");
                selSelectedEmployees = document.getElementById("selSelectedEmployees");
                
                $.get("/allDeps",function (data) {
                    for(let i =0; i <data.length; i++){
                        var item = data[i];
                        var dep = document.createElement("option");
                        dep.value = item.departmentid;
                        dep.text = item.departmentname;
                        selDepartments.appendChild(dep);
                    }
                    if(selDepartments.options.length > 0) {
                        selDepartments.selectedIndex = 0;
                        fillEmployees();
                    }
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
                    会议预定 > 修改会议预定
                </div>
                <#if error??>
                    <div class="error-message" style="color: red; margin: 10px 0;">${error}</div>
                </#if>
                <form action="/updateBooking" method="post">
                    <fieldset>
                        <legend>会议信息</legend>
                        <table class="formtable">
                            <tr>
                                <td>会议名称：</td>
                                <td><input type="text" name="meetingname" maxlength="20" value="${meeting.meetingname}" required/></td>
                            </tr>
                            <tr>
                                <td>会议室名称：</td>
                                <td>
                                    <select name="roomid" required>
                                        <#list meetingRooms as room>
                                            <option value="${room.roomid}" <#if room.roomid==meeting.roomid>selected</#if>>${room.roomname}</option>
                                        </#list>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>预计参加人数：</td>
                                <td><input type="number" name="numberofparticipants" value="${meeting.numberofparticipants}" min="2" required onchange="validateParticipants(this)" onkeyup="validateParticipants(this)"/></td>
                            </tr>
                            <tr>
                                <td>开始时间：</td>
                                <td>
                                    <input type="text" class="Wdate" name="starttime" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'})" autocomplete="off" value="${meeting.starttime?string('yyyy-MM-dd HH:mm:ss')}" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>结束时间：</td>
                                <td>
                                    <input type="text" class="Wdate" name="endtime" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'})" autocomplete="off" value="${meeting.endtime?string('yyyy-MM-dd HH:mm:ss')}" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>会议说明：</td>
                                <td><textarea name="description" rows="5">${meeting.description}</textarea></td>
                            </tr>
                            <tr>
                                <td>参会人员：</td>
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
                                        <select id="selSelectedEmployees" name="mps" multiple="true">
                                            <#if selectedEmps??>
                                                <#list selectedEmps as emp>
                                                    <option value="${emp.employeeid}" selected>${emp.employeename}</option>
                                                </#list>
                                            </#if>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <input type="hidden" name="meetingid" value="${meeting.meetingid}"/>
                                    <input type="submit" class="clickbutton" value="保存修改"/>
                                    <input type="button" class="clickbutton" value="返回" onclick="window.history.back();"/>
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