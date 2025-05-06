package site.hwali.meeting.service;

import site.hwali.meeting.model.Department;

import java.util.List;

public interface DepartmentService {

    public Department getDepById(int id);

    public List<Department> getAllDeps();

    public int getDeptCountByName(String name);

    public int addDept(String name);

    int deleteDep(int id);

    int updateDep(int id, int name);
}