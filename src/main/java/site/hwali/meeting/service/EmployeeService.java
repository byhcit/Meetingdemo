package site.hwali.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import site.hwali.meeting.mapper.EmployeeMapper;
import site.hwali.meeting.model.Employee;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    public Employee doLogin(String username, String password) {
        System.out.println("前===>"+username+password);
        Employee employee = employeeMapper.loadEmpByUsername(username);
        System.out.println("后===>"+employee);
        if (ObjectUtils.isEmpty(employee) || !employee.getPassword().equals(password)){
            return null;
        }
        return employee;
    }
}
