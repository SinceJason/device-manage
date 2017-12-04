
--����Ȩ�ޱ�

CREATE TABLE test_right
(
  right_code varchar2(50) primary key,           --���
  right_parent_code varchar2(50) NULL,           --�����
  right_type varchar2(20) NULL,                  --Ȩ������
  right_text varchar2(50) NULL,                  --Ȩ�ޱ���
  right_url varchar2(100) NULL,                  --Ȩ��·��
   right_tip varchar2(50) NULL                    --Ȩ����ʾ
)
select * from test_right;
select * from test_role;

--������ɫ��
CREATE TABLE test_role
(
  role_id number(8) primary key NOT NULL,          --���
  role_name varchar2(50) NOT NULL,               --��ɫ����
  role_desc varchar2(50) NULL,                   --��ɫ����
  role_flag number(8) NULL                         --״̬��1-���ã�0-������
);

--������ɫȨ�޹�ϵ��
CREATE TABLE test_role_right
(
  rf_id number(8) primary key ,            --���
  rf_role_id number(8) NOT NULL,                   --��ɫ���           
  rf_right_code varchar2(50) NOT NULL            --�˵����
);

--������ɫȨ�޹�ϵ����Ȩ�ޱ�����
ALTER TABLE test_role_right 
ADD  CONSTRAINT FK_test_role_right_test_right FOREIGN KEY(rf_right_code)
REFERENCES test_right (right_code);

--������ɫȨ�޹�ϵ�����ɫ������
ALTER TABLE test_role_right  
ADD  CONSTRAINT FK_test_role_right_test_role FOREIGN KEY(rf_role_id)
REFERENCES test_role (role_id);

--������¼�û���
CREATE TABLE test_user
(
  usr_id number(8) primary key NOT NULL,           --���
  usr_name varchar2(50)NOT NULL,                 --�û���
  usr_password varchar2(50) NOT NULL,            --����
  usr_role_id number(8) NULL,                      --��ɫ���
  usr_flag number(8) NOT NULL                      --״̬��1-���ã�0-������
);


--������¼�û������ɫ������
ALTER TABLE test_user 
ADD  CONSTRAINT FK_test_user_test_role FOREIGN KEY(usr_role_id)
REFERENCES test_role (role_id);

------------------------------------------------------------------------------��������
drop table test_role_right;
drop table test_user;
drop table test_right;
drop table test_role;

select t.* from test_right t;
select * from test_role_right;
select * from test_role;


insert into test_right values('L01','ROOT_MENU','Folder','ϵͳ�û�����',' ','Ӫ������');
insert into test_right values('L0101','L01','Document','ϵͳ�û�����','userAction!add.action','Ӫ������');
insert into test_right values('L0102','L01','Document','ϵͳ�û�ɾ��','userAction!delete.action','Ӫ������');
insert into test_right values('L0103','L01','Document','ϵͳ�û��޸�','userAction!update.action','Ӫ������');
insert into test_right values('L0104','L01','Document','ϵͳ�û���ѯ','userAction!query.action','Ӫ������');


insert into test_role values(1,'����Ա','ӵ������Ȩ��',1);
insert into test_role values(2,'a','ֻӵ�������û�Ȩ��',1);
insert into test_role values(3,'b','ӵ�в�ѯ������Ȩ��',1);
insert into test_role values(4,'c','ӵ�в�ѯ���������޸�Ȩ��',1);
insert into test_role values(5,'d','ӵ�в�ѯȨ��',1);

--����Ա
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
