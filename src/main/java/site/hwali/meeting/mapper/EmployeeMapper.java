package site.hwali.meeting.mapper;

import site.hwali.meeting.model.Employee;

public interface EmployeeMapper {
    Employee loadEmpByUsername(String username);

    Integer doReg(Employee employee);
}
