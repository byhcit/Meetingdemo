package site.hwali.meeting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.hwali.meeting.mapper.DepartmentMapper;
import site.hwali.meeting.model.Department;
import site.hwali.meeting.service.DepartmentService;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public Department getDepById(Integer id) {
        return departmentMapper.getDepById(id);
    }

    @Override
    public List<Department> getAllDeps() {
        return departmentMapper.getAllDeps();
    }

    @Override
    public int getDeptCountByName(String name) {
        return departmentMapper.getDeptCountByName(name);
    }

    @Override
    public int addDept(String name) {
        return departmentMapper.addDept(name);
    }

    @Override
    public int deleteDep(int id) {
        return departmentMapper.deleteDep(id);
    }

    @Override
    public int updateDep(int id, int name) {
        return departmentMapper.updateDep(id, name);
    }
}
