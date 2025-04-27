package site.hwali.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.hwali.meeting.mapper.EmployeeMapper;
import site.hwali.meeting.model.Employee;

import java.util.Objects;

public interface EmployeeService {

    public Employee doLogin(String username, String password);

    public int doReg(Employee employee);
}
