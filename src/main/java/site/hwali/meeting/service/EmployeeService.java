package site.hwali.meeting.service;

import site.hwali.meeting.model.Employee;

import java.util.List;

public interface EmployeeService {

    public Employee doLogin(String username, String password);

    public int doReg(Employee employee);

    int updateStatus(int id, int status);

    List<Employee> getEmpsByStatus(String status, int pageNum, int pageSize);
    
    int getTotalByStatus(String status);

    List<Employee> getEmpsByPage(Employee empCond, int page, int size);
}
