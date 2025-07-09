# MeetingDemo - 会议室管理系统
二次开发 demo([开源地址](https://github.com/lenve/CoolMeeting))
## 项目简介

MeetingDemo 是一个基于 Spring MVC + MyBatis + FreeMarker 的会议室管理系统，提供会议室预订、员工管理、会议管理等功能。

## 技术栈

- **后端框架**: Spring MVC 6.2.5
- **数据库**: MySQL 5.7+
- **ORM框架**: MyBatis 3.5.19
- **模板引擎**: FreeMarker 2.3.34
- **数据库连接池**: Druid 1.2.24
- **构建工具**: Maven 3.6+

## 功能特性

### 用户管理
- 员工注册和登录
- 账户审批管理
- 部门管理
- 权限控制

### 会议室管理
- 会议室信息维护
- 会议室状态管理
- 设备信息记录

### 会议管理
- 会议室预订
- 会议安排
- 参与者管理
- 会议状态跟踪

### 通知系统
- 系统通知
- 会议提醒

## 快速开始

### 环境要求

- Java 8+
- Maven 3.6+
- MySQL 5.7+


#### 访问地址

- **直接访问**: http://hwali.site:8080/meeting/

#### 默认账户

- **管理员**: lih / 1

## 项目结构

```
MeetingDemo/
├── src/
│   ├── main/
│   │   ├── java/site/hwali/meeting/
│   │   │   ├── controller/          # 控制器层
│   │   │   ├── service/             # 服务层
│   │   │   ├── mapper/              # 数据访问层
│   │   │   ├── model/               # 实体类
│   │   │   ├── interceptor/         # 拦截器
│   │   │   └── converter/           # 转换器
│   │   ├── resources/
│   │   │   ├── applicationContext.xml  # Spring配置
│   │   │   ├── spring-servlet.xml      # Spring MVC配置
│   │   │   └── db.properties           # 数据库配置
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── ftl/              # FreeMarker模板
│   │       │   └── web.xml           # Web配置
│   │       ├── styles/               # CSS样式
│   │       └── images/               # 图片资源
```

## 配置说明

### 数据库配置

编辑 `src/main/resources/db.properties`:

```properties
db.url=jdbc:mysql://localhost:3306/meeting_demo?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai
db.username=meeting_user
db.password=meeting_password
```

## 开发指南

### 添加新功能

1. 在 `model` 包中创建实体类
2. 在 `mapper` 包中创建数据访问接口和XML
3. 在 `service` 包中创建业务逻辑
4. 在 `controller` 包中创建控制器
5. 在 `ftl` 目录中创建视图模板

### 代码规范

- 遵循Java命名规范
- 使用有意义的变量和方法名
- 添加必要的注释
- 保持代码简洁清晰




