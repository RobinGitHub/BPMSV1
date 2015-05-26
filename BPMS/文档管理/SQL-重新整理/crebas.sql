/*==============================================================*/
/* Database name:  BPMS                                         */
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2015/5/25 21:30:37                           */
/*==============================================================*/


drop database BPMS
go

/*==============================================================*/
/* Database: BPMS                                               */
/*==============================================================*/
create database BPMS
go

use BPMS
go

/*==============================================================*/
/* User: dbo                                                    */
/*==============================================================*/
execute sp_grantdbaccess dbo
go

/*==============================================================*/
/* Table: DataDictionary                                        */
/*==============================================================*/
create table DataDictionary (
   ID                   int                  not null,
   SystemId             int                  not null,
   ParentId             int                  null,
   Category             int                  null,
   Code                 nvarchar(50)         null,
   Name                 nvarchar(50)         null,
   IsTree               bit                  null,
   Remark               nvarchar(500)        null,
   AllowEdit            bit                  not null,
   AllowDelete          bit                  not null,
   IsEnabled            bit                  not null default 1,
   SortIndex            int                  not null,
   DeleteMark           int                  not null default 1,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   ModifyDate           datetime             not null,
   ModifyUserId         int                  not null,
   ModifyUserName       varchar(50)          not null,
   constraint PK_DATADICTIONARY primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-有效，0-无效',
   'user', @CurrentUser, 'table', 'DataDictionary', 'column', 'IsEnabled'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-正常，0-删除',
   'user', @CurrentUser, 'table', 'DataDictionary', 'column', 'DeleteMark'
go

/*==============================================================*/
/* Table: Employee                                              */
/*==============================================================*/
create table Employee (
   ID                   int                  not null,
   Code                 nvarchar(50)         not null,
   Name                 nvarchar(50)         not null,
   UserId               int                  not null,
   Spell                nvarchar(200)        null,
   Alias                nvarchar(50)         null,
   Gender               nchar(2)             not null,
   SubCompanyId         int                  not null,
   CompanyId            int                  not null,
   DepartmentId         int                  not null,
   WorkgroupId          int                  not null,
   DutyId               int                  not null,
   IDCard               varchar(50)          null,
   BankCode             varchar(50)          null,
   Email                varchar(50)          null,
   Mobile               varchar(50)          null,
   ShortNumber          varchar(50)          null,
   Telephone            varchar(50)          null,
   OQ                   varchar(50)          null,
   OfficePhone          varchar(50)          null,
   OfficeZipCode        varchar(50)          null,
   OfficeAddress        nvarchar(200)        null,
   OfficeFax            varchar(50)          null,
   Age                  smallint             not null,
   Birthday             datetime             not null,
   Education            int                  null,
   School               nvarchar(200)        null,
   GraduationDate       datetime             null,
   Major                varchar(50)          null,
   Degree               int                  null,
   TitleId              int                  null,
   TitleDate            datetime             null,
   TitleLevel           int                  null,
   WorkingDate          varchar(50)          null,
   JoinInDate           datetime             null,
   HomeZipCode          varchar(50)          null,
   HomeAddress          nvarchar(200)        null,
   HomePhone            varchar(50)          null,
   HomeFax              varchar(50)          null,
   Province             varchar(50)          null,
   City                 varchar(50)          null,
   Area                 varchar(50)          null,
   NativePlace          varchar(50)          null,
   Party                int                  null,
   Nation               int                  null,
   Nationality          int                  null,
   WorkingProperty      int                  null,
   Competency           varchar(200)         null,
   EmergencyContact     varchar(50)          null,
   IsDimission          bit                  null,
   DimissionDate        datetime             null,
   DimissionCause       nvarchar(200)        null,
   DimissionWhither     nvarchar(200)        null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  not null default 1,
   SortIndex            int                  not null,
   DeleteMark           bit                  not null default 1,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   ModifyDate           datetime             not null,
   ModifyUserId         int                  not null,
   ModifyUserName       varchar(50)          not null,
   constraint PK_EMPLOYEE primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '男、女',
   'user', @CurrentUser, 'table', 'Employee', 'column', 'Gender'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-有效，0-无效',
   'user', @CurrentUser, 'table', 'Employee', 'column', 'IsEnabled'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-正常，0-删除',
   'user', @CurrentUser, 'table', 'Employee', 'column', 'DeleteMark'
go

/*==============================================================*/
/* Table: MenuInfo                                              */
/*==============================================================*/
create table MenuInfo (
   ID                   int                  not null,
   SystemId             int                  not null,
   ParentId             int                  not null,
   Code                 nvarchar(50)         null,
   Name                 nvarchar(50)         not null,
   Category             int                  not null,
   PurviewId            int                  null,
   Icon                 varbinary(max)       null,
   IconUrl              nvarchar(200)        null,
   NavigateUrl          nvarchar(200)        null,
   FormName             varchar(200)         null,
   isSplit              bit                  not null default 0,
   IsUnfold             bit                  not null default 0,
   Remark               nvarchar(500)        null,
   AllowEdit            bit                  not null,
   AllowDelete          bit                  not null,
   IsEnabled            bit                  not null default 1,
   SortIndex            int                  not null,
   DeleteMark           int                  not null default 1,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   ModifyDate           datetime             not null,
   ModifyUserId         int                  not null,
   ModifyUserName       varchar(50)          not null,
   constraint PK_MENUINFO primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '转化为二进制',
   'user', @CurrentUser, 'table', 'MenuInfo', 'column', 'Icon'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单下面是否有分割线',
   'user', @CurrentUser, 'table', 'MenuInfo', 'column', 'isSplit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-有效，0-无效',
   'user', @CurrentUser, 'table', 'MenuInfo', 'column', 'IsEnabled'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-正常，0-删除',
   'user', @CurrentUser, 'table', 'MenuInfo', 'column', 'DeleteMark'
go

/*==============================================================*/
/* Table: Organization                                          */
/*==============================================================*/
create table Organization (
   ID                   int                  not null,
   ParentId             int                  not null,
   Name                 nvarchar(50)         not null,
   Code                 nvarchar(50)         not null,
   ShortName            nvarchar(50)         not null,
   Category             int                  not null,
   IsInnerOrganize      bit                  not null,
   Manager              int                  null,
   AssistantManager     int                  null,
   OuterPhone           varchar(50)          null,
   InnerPhone           varchar(50)          null,
   Fax                  varchar(50)          null,
   Postalcode           varchar(50)          null,
   Address              nvarchar(200)        null,
   Web                  varchar(200)         null,
   Remark               nvarchar(500)        null,
   AllowEdit            bit                  not null,
   AllowDelete          bit                  not null,
   IsEnabled            bit                  not null default 1,
   SortIndex            int                  not null,
   DeleteMark           int                  not null default 1,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   ModifyDate           datetime             not null,
   ModifyUserId         int                  not null,
   ModifyUserName       varchar(50)          not null,
   constraint PK_ORGANIZATION primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-有效，0-无效',
   'user', @CurrentUser, 'table', 'Organization', 'column', 'IsEnabled'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-正常，0-删除',
   'user', @CurrentUser, 'table', 'Organization', 'column', 'DeleteMark'
go

/*==============================================================*/
/* Table: PurviewInfo                                           */
/*==============================================================*/
create table dbo.PurviewInfo (
   ID                   int                  not null,
   SystemId             int                  not null,
   Name                 nvarchar(50)         not null,
   Code                 nvarchar(50)         not null,
   ParentId             int                  not null,
   PurviewType          int                  not null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  not null,
   SortIndex            int                  not null,
   CreateDate           datetime             not null,
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   ModifyDate           datetime             not null,
   ModifyUserId         int                  not null,
   ModifyUserName       varchar(50)          not null,
   constraint PK_PurviewInfo primary key (ID)
)
go

execute sp_addextendedproperty 'MS_Description', 
   '权限类别：
   1.模块
   2.功能
   3.操作',
   'user', 'dbo', 'table', 'PurviewInfo', 'column', 'PurviewType'
go

/*==============================================================*/
/* Table: RoleInfo                                              */
/*==============================================================*/
create table RoleInfo (
   ID                   int                  not null,
   SystemId             int                  not null,
   OrganizationId       int                  not null,
   ParentId             int                  not null,
   Code                 nvarchar(50)         not null,
   Name                 nvarchar(50)         not null,
   Category             int                  not null,
   Remark               nvarchar(500)        null,
   AllowEdit            bit                  not null,
   AllowDelete          bit                  not null,
   IsEnabled            bit                  not null default 1,
   SortIndex            int                  not null,
   DeleteMark           int                  not null default 1,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   ModifyDate           datetime             not null,
   ModifyUserId         int                  not null,
   ModifyUserName       varchar(50)          not null,
   constraint PK_ROLEINFO primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-有效，0-无效',
   'user', @CurrentUser, 'table', 'RoleInfo', 'column', 'IsEnabled'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-正常，0-删除',
   'user', @CurrentUser, 'table', 'RoleInfo', 'column', 'DeleteMark'
go

/*==============================================================*/
/* Table: RolePurview                                           */
/*==============================================================*/
create table dbo.RolePurview (
   ID                   int                  not null,
   RoleId               int                  not null,
   PurviewId            int                  not null,
   constraint PK_RolePurview primary key (ID)
)
go

/*==============================================================*/
/* Table: SysLog                                                */
/*==============================================================*/
create table SysLog (
   ID                   int                  not null,
   SystemId             int                  not null,
   OperationType        int                  not null,
   TableName            varchar(50)          not null,
   BusinessName         varchar(50)          not null,
   ObjectId             int                  not null,
   IPAddress            varchar(50)          not null,
   IPAddressName        varchar(200)         not null,
   Remark               nvarchar(500)        null,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   constraint PK_SYSLOG primary key (ID)
)
go

/*==============================================================*/
/* Table: SysLogDetail                                          */
/*==============================================================*/
create table SysLogDetail (
   ID                   int                  not null,
   SyslogsId            varchar(50)          not null,
   FieldName            varchar(50)          not null,
   FieldText            varchar(50)          not null,
   NewValue             varchar(Max)         not null,
   OldValue             varchar(Max)         not null,
   Remark               varchar(200)         null,
   constraint PK_SYSLOGDETAIL primary key (ID)
)
go

/*==============================================================*/
/* Table: SysLoginLog                                           */
/*==============================================================*/
create table SysLoginLog (
   SysLoginLogId        varchar(50)          null,
   SystemId             int                  not null,
   CreateUserId         int                  not null,
   CreateDate           datetime             not null default getdate(),
   CreateUserName       varchar(50)          not null,
   Account              varchar(50)          not null,
   Status               varchar(50)          not null,
   IPAddress            varchar(50)          not null,
   IPAddressName        varchar(200)         not null
)
go

/*==============================================================*/
/* Table: SystemExceptionLog                                    */
/*==============================================================*/
create table SystemExceptionLog (
   ID                   int                  not null,
   SystemId             int                  not null,
   Source               varchar(max)         null,
   Exception            varchar(max)         null,
   Description          varchar(Max)         null,
   CreateDate           datetime             null default getdate(),
   IPAddress            varchar(50)          null,
   IPAddressName        varchar(200)         null,
   constraint PK_SYSTEMEXCEPTIONLOG primary key (ID)
)
go

/*==============================================================*/
/* Table: SystemInfo                                            */
/*==============================================================*/
create table SystemInfo (
   ID                   int                  not null,
   Name                 nvarchar(50)         not null,
   Code                 nvarchar(50)         not null,
   Remark               nvarchar(500)        null,
   AllowEdit            bit                  not null,
   AllowDelete          bit                  not null,
   IsEnabled            bit                  not null default 1,
   SortIndex            int                  not null,
   DeleteMark           int                  not null default 1,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   ModifyDate           datetime             not null,
   ModifyUserId         int                  not null,
   ModifyUserName       varchar(50)          not null,
   constraint PK_SYSTEMINFO primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-有效，0-无效',
   'user', @CurrentUser, 'table', 'SystemInfo', 'column', 'IsEnabled'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-正常，0-删除',
   'user', @CurrentUser, 'table', 'SystemInfo', 'column', 'DeleteMark'
go

/*==============================================================*/
/* Table: TableColumns                                          */
/*==============================================================*/
create table TableColumns (
   ID                   int                  not null,
   MenuId               int                  not null,
   HeadText             nvarchar(200)        not null,
   Name                 varchar(200)         null,
   DataPropertyName     varchar(200)         not null,
   Width                int                  not null,
   Visible              bit                  not null,
   ReadOnly             bit                  not null,
   ColumnType           int                  not null,
   Resizable            bit                  not null,
   Align                int                  not null,
   MaxValue             decimal(18,5)        null,
   MinValue             decimal(18,5)        null,
   MaxInputLength       int                  null,
   SortMode             int                  not null,
   PurviewId            int                  null,
   Custom               varchar(200)         null,
   Remark               nvarchar(500)        null,
   AllowEdit            bit                  not null,
   AllowDelete          bit                  not null,
   IsEnabled            bit                  not null default 1,
   SortIndex            int                  not null,
   DeleteMark           int                  not null default 1,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   ModifyDate           datetime             not null,
   ModifyUserId         int                  not null,
   ModifyUserName       varchar(50)          not null,
   constraint PK_TABLECOLUMNS primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '列英文名称',
   'user', @CurrentUser, 'table', 'TableColumns', 'column', 'Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '枚举',
   'user', @CurrentUser, 'table', 'TableColumns', 'column', 'ColumnType'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '枚举',
   'user', @CurrentUser, 'table', 'TableColumns', 'column', 'Align'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '枚举',
   'user', @CurrentUser, 'table', 'TableColumns', 'column', 'SortMode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '预留字段',
   'user', @CurrentUser, 'table', 'TableColumns', 'column', 'Custom'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-有效，0-无效',
   'user', @CurrentUser, 'table', 'TableColumns', 'column', 'IsEnabled'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-正常，0-删除',
   'user', @CurrentUser, 'table', 'TableColumns', 'column', 'DeleteMark'
go

/*==============================================================*/
/* Table: TableId                                               */
/*==============================================================*/
create table dbo.TableId (
   ID                   int                  identity,
   UpdateTime           datetime             not null,
   TableName            varchar(50)          not null,
   CurrentId            int                  not null,
   constraint PK_TableId primary key (ID)
)
go

/*==============================================================*/
/* Table: UserInfo                                              */
/*==============================================================*/
create table UserInfo (
   ID                   int                  not null,
   Code                 nvarchar(50)         not null,
   Account              nvarchar(50)         not null,
   Password             varchar(50)          not null,
   Name                 nvarchar(50)         not null,
   Spell                varchar(200)         not null,
   Alias                nvarchar(50)         null,
   RoleId               int                  not null,
   Gender               nchar(2)             not null,
   Mobile               varchar(50)          null,
   Telephone            varchar(50)          null,
   Birthday             datetime             not null,
   Email                varchar(50)          null,
   OQ                   varchar(50)          null,
   DutyId               int                  not null,
   TitleId              int                  not null,
   CompanyId            int                  not null,
   DepartmentId         int                  not null,
   WorkgroupId          int                  null,
   ChangePasswordDate   datetime             null,
   IPAddress            varchar(50)          null,
   MACAddress           varchar(50)          null,
   LogOnCount           int                  null,
   FirstVisit           datetime             null,
   PreviousVisit        datetime             null,
   LastVisit            datetime             null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  not null default 1,
   SortIndex            int                  not null,
   DeleteMark           bit                  not null default 1,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   CreateUserName       varchar(50)          not null,
   ModifyDate           datetime             not null,
   ModifyUserId         int                  not null,
   ModifyUserName       varchar(50)          not null,
   constraint PK_USERINFO primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '可以解决根据中文名称排序的问题',
   'user', @CurrentUser, 'table', 'UserInfo', 'column', 'Spell'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-有效，0-无效',
   'user', @CurrentUser, 'table', 'UserInfo', 'column', 'IsEnabled'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1-正常，0-删除',
   'user', @CurrentUser, 'table', 'UserInfo', 'column', 'DeleteMark'
go

/*==============================================================*/
/* Table: UserOrganize                                          */
/*==============================================================*/
create table UserOrganize (
   ID                   int                  not null,
   OrganizationId       int                  not null,
   UserId               int                  not null,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         varchar(50)          not null,
   CreateUserName       int                  not null,
   constraint PK_USERORGANIZE primary key (ID)
)
go

/*==============================================================*/
/* Table: UserPurview                                           */
/*==============================================================*/
create table dbo.UserPurview (
   ID                   int                  not null,
   UserId               int                  not null,
   PurviewId            int                  not null,
   RoleId               int                  not null,
   HasRight             bit                  not null,
   constraint PK_UserPurview primary key (ID)
)
go

/*==============================================================*/
/* Table: UserRole                                              */
/*==============================================================*/
create table UserRole (
   ID                   int                  not null,
   UserId               int                  not null,
   RoleId               int                  not null,
   CreateUserName       varchar(50)          not null,
   CreateDate           datetime             not null default getdate(),
   CreateUserId         int                  not null,
   constraint PK_USERROLE primary key (ID)
)
go

