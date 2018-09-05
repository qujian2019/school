#用户表
DROP TABLE IF EXISTS `gsxy_user`;
CREATE TABLE `gsxy_user` (
`userId`  BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键编号' ,
`userName`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '名称' ,
`userCode`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE COMMENT '帐号' ,
`userPassword`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码' ,
`userAge`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '年龄' ,
`salt` VARCHAR(64) DEFAULT NULL COMMENT '盐',
`userEntryTime`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '入职时间' ,
`userLoginTime`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上次登录时间' ,
`userPermissions`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '权限' ,
`locked` CHAR(1) DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
PRIMARY KEY (`userId`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO 
gsxy_user(`userName`,`userCode`,`userPassword`,`userAge`,`salt`,`userEntryTime`,`userLoginTime`)
VALUES
('小明01','小明01','123456','20',LEFT(UUID(),8),NOW(),NOW()),
('小明02','小明02','123456','20',LEFT(UUID(),8),NOW(),NOW()),
('小明03','小明03','123456','20',LEFT(UUID(),8),NOW(),NOW()),
('小明04','小明04','123456','20',LEFT(UUID(),8),NOW(),NOW()),
('小明05','小明05','123456','20',LEFT(UUID(),8),NOW(),NOW()),
('小明06','小明06','123456','20',LEFT(UUID(),8),NOW(),NOW());

#用户角色表
DROP TABLE IF EXISTS `gsxy_user_role`;
CREATE TABLE `gsxy_user_role` (
  `userRoleId` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键编号' ,
  `UserId` BIGINT COMMENT '用户id',
  `RoleId` BIGINT COMMENT '角色id',
  PRIMARY KEY (`userRoleId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

SELECT * FROM gsxy_role
SELECT * FROM gsxy_user
SELECT * FROM gsxy_user_role
INSERT  INTO `gsxy_user_role`(`UserId`,`RoleId`) 
VALUES 
(1,1),
(2,2);

#取用户下所有的permission
SELECT *
FROM gsxy_permission
WHERE permissionType = 'permission'
    AND permissionId IN(SELECT
                permissionId
              FROM gsxy_role_permission
              WHERE roleId IN(SELECT
                                     RoleId
                                   FROM gsxy_user_role
                                   WHERE UserId = 1))
                                   
SELECT *
FROM gsxy_permission
WHERE permissionType = 'menu'
    AND permissionId IN(SELECT
                permissionId
              FROM gsxy_role_permission
              WHERE roleId IN(SELECT
                                     RoleId
                                   FROM gsxy_user_role
                                   WHERE UserId = 2))
                                   
UPDATE gsxy_permission SET permissionUrl = 'filemanage'
WHERE permissionId = 7 


#角色表
DROP TABLE IF EXISTS `gsxy_role`;
CREATE TABLE `gsxy_role` (
  `roleId` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `roleName` VARCHAR(128) NOT NULL COMMENT '角色名',
  `available` CHAR(1) NOT NULL DEFAULT '1' COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`roleId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
SELECT * FROM gsxy_role
INSERT  INTO `gsxy_role`(`roleName`,`available`) 
VALUES 
('新闻发布员','1'),# 角色id 是 1
('文件管理员','1');# 角色id 是 2

#权限角色表
CREATE TABLE `gsxy_role_permission` (
  `rolePermissionId` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `roleId` BIGINT COMMENT '角色id',
  `permissionId` BIGINT COMMENT '权限id',
  PRIMARY KEY (`rolePermissionId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
SELECT * FROM gsxy_role_permission
INSERT  INTO `gsxy_role_permission`(`roleId`,`permissionId`) 
VALUES 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6);
(2,13),
(2,14),
(2,15),
(2,16),
(2,17),
(2,18);

#权限表
CREATE TABLE `gsxy_permission` (
  `permissionId` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `permissionName` VARCHAR(128) NOT NULL COMMENT '资源名称',
  `permissionType` VARCHAR(32) NOT NULL COMMENT '资源类型：menu,button,',
  `permissionUrl` VARCHAR(128) DEFAULT NULL COMMENT '访问url地址',
  `permissionPercode` VARCHAR(128) DEFAULT NULL COMMENT '权限代码字符串',
  `permissionParentid` BIGINT(20) DEFAULT NULL COMMENT '父结点id',
  `permissionParentids` VARCHAR(128) DEFAULT NULL COMMENT '父结点id列表串',
  `permissionSortstring` VARCHAR(128) DEFAULT NULL COMMENT '排序号',
  `permissionAvailable` CHAR(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`permissionId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
SELECT * FROM gsxy_permission

INSERT  INTO 
`gsxy_permission`
(`permissionName`,`permissionType`,`permissionUrl`,`permissionPercode`,`permissionParentid`,`permissionParentids`,`permissionSortstring`,`permissionAvailable`) 
VALUES 
('文件所有权限','permission','','file:all','','','','1'),
('新闻所有权限','permission','','news:all','','','','1');
('文件夹所有权限','permission','','fileFolder:all','','','','1');
('文件所有权限','permission','','file:all','','','','1');
('新闻所有权限','permission','','news:all','','','','1');
('文件夹修改','permission','','fileFolder:update','','','','1');
#新闻
('新闻管理','menu','',NULL,'','','','1'),
('新闻新增','permission','','news:insert','','','','1'),
('新闻预览','permission','','news:selectOneNews','','','','1'),
('新闻查询','permission','','news:select','','','','1'),
('新闻删除','permission','','news:delete','','','','1'),
('批量新闻删除','permission','','news:delete','','','','1'),
#文件夹
('文件夹管理','menu','',NULL,'','','','1'),
('文件夹新增','permission','','fileFolder:insert','','','','1'),
('文件夹预览','permission','','fileFolder:selectOneNews','','','','1'),
('文件夹查询','permission','','fileFolder:select','','','','1'),
('文件夹删除','permission','','fileFolder:delete','','','','1'),
#文件
('文件查询','permission','','file:select','','','','1'),
('文件修改','permission','','file:update','','','','1'),
('文件新增','permission','','file:inset','','','','1'),
('文件删除','permission','','file:delete','','','','1');






SELECT * 
FROM gsxy_user
WHERE userCode = '小明09' AND userPassword = '123456'


#文件夹表
DROP TABLE IF EXISTS `gsxy_file_folder`;
CREATE TABLE `gsxy_file_folder` (
`fileFolderId`  BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键编号' ,
`userId` BIGINT NOT NULL COMMENT '用户ID',
`fileFolderName`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件夹名称' ,
`fileFolderUserRoleIds`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文档文件夹管理角色id' ,
`fileFolderReminderMode`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文档文件夹提醒方式' ,
`fileFolderReminderUser`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '档文件夹提醒人员' ,
`fileFolderRemarks`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文档文件夹备注' ,
`fileFolderOccupiedSpace`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文档文件夹占用空间' ,
`fileFolderCreateUser`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档创建人' ,
`fileFolderCreateTime`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档创建时间' ,
`fileFolderAddress`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci  COMMENT '所在地址' ,
#`fileFolderParentid`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文档父节点' ,
`fileFolderState`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '文件夹状态 默认是1' ,
PRIMARY KEY (`fileFolderId`)
)
#文件表
DROP TABLE IF EXISTS `gsxy_file`;
CREATE TABLE `gsxy_file` (
`fileId` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键编号',
`userId` BIGINT NOT NULL COMMENT '用户ID',
`fileFolderId` BIGINT NOT NULL COMMENT '文件夹ID',
`fileName`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文件名',
`fileUsers`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文件管理人员',
`fileRemarks`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文件备注',
`fileSize`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文件大小' ,
`fileCreateUser`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文件创建人',
`fileUploadTime`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci  COMMENT '文件创建时间',
`fileAddress`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci  COMMENT '所在地址',
`filePath`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci  COMMENT '文件路径',
`fileState`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '文件状态 默认是1',
PRIMARY KEY (`fileId`)
)
#新闻表
DROP TABLE IF EXISTS `gsxy_news`;
CREATE TABLE `gsxy_news` (
`newsId` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键编号',
`userId` BIGINT COMMENT '用户ID',
`deptId` BIGINT COMMENT '部门ID',
`newsTitle`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '新闻标题',
`newsSource`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '新闻来源',
`newsReleaseUser`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '新闻发布者',
`newType`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '新闻类型',
`newsReleaseTime`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '新闻发布时间' ,
`newsVisitConut`  BIGINT COMMENT '访问人数',
`newsAuditStatus`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1'  COMMENT '新闻审核状态 默认是1',
`newsContext`  LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci  COMMENT '新闻上下文',
PRIMARY KEY (`newsId`)
)


UPDATE gsxy_news 
SET newsVisitConut = 1
WHERE newsId = 1

UPDATE gsxy_news 
SET newsTitle = '',newType = '',newsContext='',newsReleaseTime = NOW() 
WHERE newsId = 1


SELECT * FROM gsxy_news

SELECT DATE_FORMAT(CURDATE()) FROM DUAL ;  

INSERT INTO gsxy_news(`userId`,`deptId`,`newsTitle`,`newsSource`,`newsReleaseUser`,`newType`,`newsReleaseTime`,`newsVisitConut`,`newsContext`)
VALUES(1,1,'新闻标题1','新闻来源','新闻发布者','0',SYSDATE(DATE),998,'啊啊啊');



INSERT INTO gsxy_news(`userId`,`deptId`,`newsTitle`,`newsSource`,`newsReleaseUser`,`newType`,`newsReleaseTime`,`newsVisitConut`,`newsContext`)
VALUES(1,1,'新闻标题2','新闻来源','新闻发布者','工作动态',NOW(),998,'啊啊啊');

INSERT INTO gsxy_news(`userId`,`deptId`,`newsTitle`,`newsSource`,`newsReleaseUser`,`newType`,`newsReleaseTime`,`newsVisitConut`,`newsContext`)
VALUES(1,1,'新闻标题3','新闻来源','新闻发布者','工作动态',NOW(),998,'啊啊啊');

INSERT INTO gsxy_news(`userId`,`deptId`,`newsTitle`,`newsSource`,`newsReleaseUser`,`newType`,`newsReleaseTime`,`newsVisitConut`,`newsContext`)
VALUES(1,1,'新闻标题4','新闻来源','新闻发布者','工作动态',NOW(),998,'啊啊啊');

INSERT INTO gsxy_news
(`userId`,`deptId`,`newsTitle`,`newsSource`,`newsReleaseUser`,`newType`,`newsReleaseTime`,`newsVisitConut`,`newsContext`)
VALUES
(1,1,'新闻标题5','新闻来源','新闻发布者','工作动态',NOW(),998,'啊啊啊');

INSERT INTO gsxy_news(`userId`,`deptId`,`newsTitle`,`newsSource`,`newsReleaseUser`,`newType`,`newsReleaseTime`,`newsVisitConut`,`newsContext`)
VALUES(1,1,'新闻标题6','新闻来源','新闻发布者','工作动态',NOW(),998,'啊啊啊');

INSERT INTO gsxy_news(`userId`,`deptId`,`newsTitle`,`newsSource`,`newsReleaseUser`,`newType`,`newsReleaseTime`,`newsContext`)
VALUES(1,1,'新闻标题7','新闻来源','新闻发布者','工作动态',NOW(),'啊啊啊1');

SELECT * FROM gsxy_news
WHERE userId = 1 AND newsAuditStatus = 1
ORDER BY newsReleaseTime DESC
LIMIT 0,5

UPDATE gsxy_news 
SET newsTitle = '',newType = '',newsContext=''
WHERE newsId = 1


SELECT * 
FROM gsxy_news    
WHERE newsId = 1 
AND newsAuditStatus = 1 

UPDATE gsxy_news 
SET newsAuditStatus = 0 
WHERE newsId = 1 

UPDATE gsxy_news
SET newsAuditStatus = 0
WHERE newsId IN (1,2,3)

SELECT COUNT(1)
 FROM gsxy_news
WHERE userId = 1 AND newsAuditStatus = 1


SELECT * FROM gsxy_news
WHERE newType = 0
ORDER BY newsReleaseTime DESC
LIMIT 0,20



SELECT * FROM gsxy_file

INSERT INTO gsxy_file(`userId`,`fileFolderId`,`fileName`,`fileUsers`,`fileRemarks`,`fileSize`,`fileCreateUser`,`fileUploadTime`,`fileAddress`,`filePath`)
				VALUES(1,1,'文件名1' ,'文件管理人员01','文件备注','文件大小','文件创建人',NOW(),'所在地址','文件路径');
INSERT INTO gsxy_file(`userId`,`fileFolderId`,`fileName`,`fileUsers`,`fileRemarks`,`fileSize`,`fileCreateUser`,`fileUploadTime`,`fileAddress`,`filePath`)
				VALUES(1,1,'文件名2' ,'文件管理人员01','文件备注','文件大小','文件创建人',NOW(),'所在地址','文件路径');
				INSERT INTO gsxy_file(`userId`,`fileFolderId`,`fileName`,`fileUsers`,`fileRemarks`,`fileSize`,`fileCreateUser`,`fileUploadTime`,`fileAddress`,`filePath`)
				VALUES(1,1,'文件名3' ,'文件管理人员01','文件备注','文件大小','文件创建人',NOW(),'所在地址','文件路径');
				INSERT INTO gsxy_file(`userId`,`fileFolderId`,`fileName`,`fileUsers`,`fileRemarks`,`fileSize`,`fileCreateUser`,`fileUploadTime`,`fileAddress`,`filePath`)
				VALUES(1,1,'文件名4' ,'文件管理人员01','文件备注','文件大小','文件创建人',NOW(),'所在地址','文件路径');
				INSERT INTO gsxy_file(`userId`,`fileFolderId`,`fileName`,`fileUsers`,`fileRemarks`,`fileSize`,`fileCreateUser`,`fileUploadTime`,`fileAddress`,`filePath`)
				VALUES(1,1,'文件名5' ,'文件管理人员01','文件备注','文件大小','文件创建人',NOW(),'所在地址','文件路径');


UPDATE gsxy_file 
SET fileRemarks = '阿猫阿狗'
WHERE fileId = 1


SELECT *
FROM gsxy_file_folder
WHERE fileFolderId = 1


SELECT * 
FROM gsxy_file 
WHERE fileId = 1

UPDATE gsxy_file 
SET fileState = 1

UPDATE gsxy_file 
SET fileState = 1
WHERE fileId IN (1,2,3)


SELECT gf.*
FROM gsxy_file gf
WHERE fileFolderId = 1 AND userId = 1 AND fileState = 1


SELECT COUNT(1)
FROM gsxy_file gf
WHERE fileFolderId = 1 AND userId = 1 AND fileState = 1




INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderRemarks`,`fileFolderCreateUser`,`fileFolderCreateTime`)
			VALUES('1','文件夹名称02222','文档文件夹备注01' ,'文档创建人01' ,NOW());




INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称01','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01');
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称02','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01');
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称03','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01');
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称04','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01');
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称05','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01');
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称06','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01' );
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称07','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01');
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称08','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01' );
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称09','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01' );
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
VALUES('1','文件夹名称10','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'所在地址01');


#修改文件夹
UPDATE gsxy_file_folder 
SET fileFolderName = '啊啊啊' , fileFolderRemarks = '啊啊啊'
WHERE fileFolderId = 1

UPDATE gsxy_file_folder 
SET fileFolderState = 1
WHERE fileFolderId IN (1,2,3)

SELECT * 
FROM gsxy_file_folder
fileFolderId

			
SELECT gff.* 
FROM gsxy_file_folder gff
WHERE gff.userId =1 AND gff.fileFolderState = 1
			
			LIMIT #{page},#{limit}
			
			
			
			SELECT gff.* 
			FROM gsxy_file_folder gff
			WHERE gff.userId = #{userId} AND gff.fileFolderState = 1
			LIMIT #{page},#{limit}
			


INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderRemarks`,`fileFolderCreateUser`,`fileFolderCreateTime`)
			VALUES('1','文件夹名称02222','文档文件夹备注01' ,'文档创建人01' ,NOW());



INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
			VALUES('1','文件夹名称10','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'');
INSERT INTO gsxy_file_folder(`userId`,`fileFolderName`,`fileFolderUserRoleIds`,`fileFolderReminderMode`,`fileFolderReminderUser`,`fileFolderRemarks`,`fileFolderOccupiedSpace`,`fileFolderCreateUser`,`fileFolderCreateTime`,`fileFolderAddress`)
			VALUES('1','文件夹名称10','文档文件夹管理角色id01','文档文件夹提醒方式01','档文件夹提醒人员01','文档文件夹备注01','文档文件夹占用空间01' ,'文档创建人01' ,NOW(),'');

			INSERT INTO 
			gsxy_file_folder
				(`userId`,`fileFolderName`,`fileFolderRemarks`,`fileFolderCreateUser`,`fileFolderCreateTime`)
			VALUES
				(#{userId},#{fileFolderName}',#{fileFolderRemarks},#{fileFolderCreateUser},NOW())


SELECT * FROM gsxy_user
WHERE userCode = '小明09'


