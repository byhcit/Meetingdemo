package site.hwali.meeting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.hwali.meeting.mapper.EmployeeMapper;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.service.EmployeeService;

import java.util.List;
import java.util.Objects;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public Employee doLogin(String username, String password) {
        Employee employee = employeeMapper.loadEmpByUsername(username);
        if (Objects.isNull(employee) || !employee.getPassword().equals(password)) {
            return null;
        }
        return employee;
    }

    @Override
    public int doReg(Employee employee) {
        Employee emp = employeeMapper.loadEmpByUsername(employee.getUsername());
        if (!Objects.isNull(emp)) {
            return -1;
        }
        employee.setRole(1);
        employee.setStatus(0);
        return employeeMapper.doReg(employee);
    }

    @Override
    public List<Employee> getAllEmpsByStatus(int status) {
        return employeeMapper.getAllEmpsByStatus(status);
    }

    @Override
    public int updateStatus(Integer id, Integer status) {
        return employeeMapper.updateStatus(id, status);
    }

    @Override
    public List<Employee> getEmpsByStatus(int status, int pageNum, int pageSize) {
        return employeeMapper.getEmpsByStatus(status, (pageNum - 1) * pageSize, pageSize);
    }

    @Override
    public int getTotalByStatus(int status) {
        return employeeMapper.getTotalByStatus(status);
    }
}
