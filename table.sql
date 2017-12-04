
--创建权限表

CREATE TABLE test_right
(
  right_code varchar2(50) primary key,           --编号
  right_parent_code varchar2(50) NULL,           --父编号
  right_type varchar2(20) NULL,                  --权限类型
  right_text varchar2(50) NULL,                  --权限标题
  right_url varchar2(100) NULL,                  --权限路径
   right_tip varchar2(50) NULL                    --权限提示
)
select * from test_right;
select * from test_role;

--创建角色表
CREATE TABLE test_role
(
  role_id number(8) primary key NOT NULL,          --编号
  role_name varchar2(50) NOT NULL,               --角色名称
  role_desc varchar2(50) NULL,                   --角色描述
  role_flag number(8) NULL                         --状态，1-可用，0-不可用
);

--创建角色权限关系表
CREATE TABLE test_role_right
(
  rf_id number(8) primary key ,            --编号
  rf_role_id number(8) NOT NULL,                   --角色编号           
  rf_right_code varchar2(50) NOT NULL            --菜单编号
);

--创建角色权限关系表与权限表的外键
ALTER TABLE test_role_right 
ADD  CONSTRAINT FK_test_role_right_test_right FOREIGN KEY(rf_right_code)
REFERENCES test_right (right_code);

--创建角色权限关系表与角色表的外键
ALTER TABLE test_role_right  
ADD  CONSTRAINT FK_test_role_right_test_role FOREIGN KEY(rf_role_id)
REFERENCES test_role (role_id);

--创建登录用户表
CREATE TABLE test_user
(
  usr_id number(8) primary key NOT NULL,           --编号
  usr_name varchar2(50)NOT NULL,                 --用户名
  usr_password varchar2(50) NOT NULL,            --密码
  usr_role_id number(8) NULL,                      --角色编号
  usr_flag number(8) NOT NULL                      --状态，1-可用，0-不可用
);


--创建登录用户表与角色表的外键
ALTER TABLE test_user 
ADD  CONSTRAINT FK_test_user_test_role FOREIGN KEY(usr_role_id)
REFERENCES test_role (role_id);

------------------------------------------------------------------------------测试数据
drop table test_role_right;
drop table test_user;
drop table test_right;
drop table test_role;

select t.* from test_right t;
select * from test_role_right;
select * from test_role;


insert into test_right values('L01','ROOT_MENU','Folder','系统用户管理',' ','营销管理');
insert into test_right values('L0101','L01','Document','系统用户新增','userAction!add.action','营销管理');
insert into test_right values('L0102','L01','Document','系统用户删除','userAction!delete.action','营销管理');
insert into test_right values('L0103','L01','Document','系统用户修改','userAction!update.action','营销管理');
insert into test_right values('L0104','L01','Document','系统用户查询','userAction!query.action','营销管理');


insert into test_role values(1,'管理员','拥有所有权限',1);
insert into test_role values(2,'a','只拥有新增用户权限',1);
insert into test_role values(3,'b','拥有查询和新增权限',1);
insert into test_role values(4,'c','拥有查询、新增、修改权限',1);
insert into test_role values(5,'d','拥有查询权限',1);

--管理员
insert into test_role_right values(1,1,'L01');
insert into test_role_right values(2,1,'L0101');
insert into test_role_right values(3,1,'L0102');
insert into test_role_right values(4,1,'L0103');
insert into test_role_right values(5,1,'L0104');

--a
insert into test_role_right values(6,2,'L0101');

--b
insert into test_role_right values(7,3,'L0101');
insert into test_role_right values(8,3,'L0104');

--c
insert into test_role_right values(9,4,'L0104');
insert into test_role_right values(10,4,'L0101');
insert into test_role_right values(11,4,'L0103');

--d
insert into test_role_right values(12,5,'L0104');


insert into test_user values(1,'admin','123',1,1);
insert into test_user values(2,'testa','123',2,1);
insert into test_user values(3,'testb','123',3,1);
insert into test_user values(4,'testc','123',4,1);
insert into test_user values(5,'testc','123',5,1);
