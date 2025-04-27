package site.hwali.meeting.mapper;

import site.hwali.meeting.model.Department;

import java.util.List;

public interface DepartmentMapper {
    Department getDepById(Integer id);

    List<Department> getAllDeps();
}
