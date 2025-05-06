package site.hwali.meeting.mapper;

import org.apache.ibatis.annotations.Param;
import site.hwali.meeting.model.Employee;

import java.util.List;

public interface EmployeeMapper {
    Employee loadEmpByUsername(String username);

    int doReg(Employee employee);

    int updateStatus(@Param("employeeid") int id, @Param("status") int status);

    List<Employee> getEmpsByStatus(@Param("status") int status, 
                                  @Param("offset") int offset, 
                                  @Param("limit") int limit);
    
    int getTotalByStatus(@Param("status") int status);

    List<Employee> getEmpsByPage(@Param("empCond") Employee empCond, @Param("offset")int offset, int limit);
}
