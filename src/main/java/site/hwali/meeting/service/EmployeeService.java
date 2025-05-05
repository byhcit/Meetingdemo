package site.hwali.meeting.service;

import site.hwali.meeting.model.Employee;

public interface EmployeeService {

    public Employee doLogin(String username, String password);

    public int doReg(Employee employee);
}
