package site.hwali.meeting.service;

import site.hwali.meeting.model.Employee;
import java.util.List;

public interface EmployeeService {

    public Employee doLogin(String username, String password);

    public int doReg(Employee employee);

    List<Employee> getAllEmpsByStatus(int status);

    int updateStatus(Integer id, Integer status);

    List<Employee> getEmpsByStatus(int status, int pageNum, int pageSize);
    
    int getTotalByStatus(int status);
}
