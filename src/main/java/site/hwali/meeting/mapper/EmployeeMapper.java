package site.hwali.meeting.mapper;

import site.hwali.meeting.model.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    Employee loadEmpByUsername(String username);

    Integer doReg(Employee employee);

    List<Employee> getAllEmpsByStatus(int status);

    int updateStatus(@Param("employeeid") Integer id, @Param("status") Integer status);

    List<Employee> getEmpsByStatus(@Param("status") int status, 
                                  @Param("offset") int offset, 
                                  @Param("limit") int limit);
    
    int getTotalByStatus(@Param("status") int status);
}
