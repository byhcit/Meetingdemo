package site.hwali.meeting.mapper;

import org.apache.ibatis.annotations.Param;
import site.hwali.meeting.model.Employee;

import java.util.List;

public interface EmployeeMapper {
    Employee loadEmpByUsername(String username);

    int doReg(Employee employee);

    int updateStatus(@Param("employeeid") int id, @Param("status") String status);

    List<Employee> getEmpsByStatus(@Param("status") String status,
                                  @Param("offset") int offset, 
                                  @Param("limit") int limit);
    
    int getTotalByStatus(@Param("status") String status);

    List<Employee> getEmpsByPage(@Param("empCond") Employee empCond, @Param("offset")int offset, int limit);

    void updateStatus(@Param("employeeid") int employeeid);

    List<Employee> getEmpsByDepid(int id);
}
