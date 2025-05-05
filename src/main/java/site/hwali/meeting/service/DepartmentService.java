package site.hwali.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.hwali.meeting.mapper.DepartmentMapper;
import site.hwali.meeting.model.Department;

import java.util.List;

public interface DepartmentService {

    public Department getDepById(Integer id);

    public List<Department> getAllDeps();

    public int getDeptCountByName(String name);

    public int addDept(String name);

    int deleteDep(int id);

    int updateDep(int id, int name);
}