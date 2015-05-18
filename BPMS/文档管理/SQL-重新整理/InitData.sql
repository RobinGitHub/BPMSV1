--数据初始化
-------------------------------------------------插入系统-------------------------------------------------
DECLARE @currId int
exec @currId=GetNewID 'SystemInfo' 
INSERT INTO SystemInfo(ID,NAME,CODE,REMARK,ALLOWEDIT,ALLOWDELETE,ISENABLED,SORTINDEX,DELETEMARK,CREATEDATE,CREATEUSERID,CREATEUSERNAME,MODIFYDATE,MODIFYUSERID,MODIFYUSERNAME)
VALUES(@currId,'权限系统','BPMS','',0,0,1,1,1,GETDATE(),1,'admin',GETDATE(),1,'admin')
-------------------------------------------------插入公司-------------------------------------------------
exec @currId=GetNewID 'Organization'
INSERT INTO Organization(ID,ParentId,Code,ShortName,Name,Category,IsInnerOrganize,REMARK,ALLOWEDIT,ALLOWDELETE,ISENABLED,SORTINDEX,DELETEMARK,CREATEDATE,CREATEUSERID,CREATEUSERNAME,MODIFYDATE,MODIFYUSERID,MODIFYUSERNAME)
VALUES(@currId,0,'TK','TK','天空',0,1,'',0,0,1,1,1,GETDATE(),1,'admin',GETDATE(),1,'admin')
-------------------------------------------------插入角色-------------------------------------------------
exec @currId=GetNewID 'RoleInfo'
INSERT INTO RoleInfo(ID,SystemId,OrganizationId,ParentId,Code,Name,Category,REMARK,ALLOWEDIT,ALLOWDELETE,ISENABLED,SORTINDEX,DELETEMARK,CREATEDATE,CREATEUSERID,CREATEUSERNAME,MODIFYDATE,MODIFYUSERID,MODIFYUSERNAME)
VALUES(@currId,1,1,0,'admin','默认管理员',0,'',0,0,1,1,1,GETDATE(),1,'admin',GETDATE(),1,'admin')
-------------------------------------------------插入用户-------------------------------------------------
exec @currId=GetNewID 'UserInfo'
INSERT INTO UserInfo(ID,Code,Account,Password,Name,Spell,RoleId,Gender,Birthday,DutyId,TitleId,CompanyId,DepartmentId,WorkgroupId,REMARK,ISENABLED,SORTINDEX,DELETEMARK,CREATEDATE,CREATEUSERID,CREATEUSERNAME,MODIFYDATE,MODIFYUSERID,MODIFYUSERNAME)
VALUES(@currId,'admin','0001','0001','admin','admin',1,'男',GETDATE(),0,0,1,0,0,'',1,1,1,GETDATE(),1,'admin',GETDATE(),1,'admin')
-------------------------------------------------插入菜单-------------------------------------------------
--exec @currId=GetNewID 'MenuInfo'
--INSERT INTO MenuInfo(ID,SystemId,ParentId,Code,Name,Category,PurviewId,NavigateUrl,FormName,isSplit,IsUnfold,REMARK,ALLOWEDIT,ALLOWDELETE,ISENABLED,SORTINDEX,DELETEMARK,CREATEDATE,CREATEUSERID,CREATEUSERNAME,MODIFYDATE,MODIFYUSERID,MODIFYUSERNAME)
--VALUES(@currId,1,0,'PurviewApply','权限应用',0,0,'#','#',0,0,'',0,0,1,1,1,GETDATE(),1,'admin',GETDATE(),1,'admin')

--exec @currId=GetNewID 'MenuInfo'
--INSERT INTO MenuInfo(ID,SystemId,ParentId,Code,Name,Category,PurviewId,NavigateUrl,FormName,isSplit,IsUnfold,REMARK,ALLOWEDIT,ALLOWDELETE,ISENABLED,SORTINDEX,DELETEMARK,CREATEDATE,CREATEUSERID,CREATEUSERNAME,MODIFYDATE,MODIFYUSERID,MODIFYUSERNAME)
--VALUES(@currId,1,0,'SystemApply','系统应用',0,0,'#','#',0,0,'',0,0,1,1,1,GETDATE(),1,'admin',GETDATE(),1,'admin')

--exec @currId=GetNewID 'MenuInfo'
--INSERT INTO MenuInfo(ID,SystemId,ParentId,Code,Name,Category,PurviewId,NavigateUrl,FormName,isSplit,IsUnfold,REMARK,ALLOWEDIT,ALLOWDELETE,ISENABLED,SORTINDEX,DELETEMARK,CREATEDATE,CREATEUSERID,CREATEUSERNAME,MODIFYDATE,MODIFYUSERID,MODIFYUSERNAME)
--VALUES(@currId,1,1,'','','',0,'#','#',0,0,'',0,0,1,1,1,GETDATE(),1,'admin',GETDATE(),1,'admin')

