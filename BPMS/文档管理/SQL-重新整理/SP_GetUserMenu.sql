SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE SP_GetUserMenu
	@systemId int,
	@userId int
AS
BEGIN
	SET NOCOUNT ON;
	SET transaction isolation level read uncommitted;
	select tmp2.systemcode,tmp2.rolecode,MenuInfo.*
from MenuInfo 
inner join (
	select tmp.systemcode,tmp.rolecode,mi.id
	from MenuInfo mi 
	inner join (
		select r.code as rolecode,tp.id as purviewid,s.code as systemcode,tp.name,tp.code,tp.parentid,tp.PurviewType,tp.Remark
		from UserRole tor
		inner join RolePurview trp on tor.roleid=trp.roleid
		inner join PurviewInfo tp on trp.PurviewID=tp.id
		inner join RoleInfo r on trp.roleid=r.id
		inner join SystemInfo s on tp.systemid=s.id
		where tp.IsEnabled=1 and r.IsEnabled=1
		and tor.UserId=@userId and s.ID=@systemId
		and tp.id not in
		(
			select purviewid from UserPurview
			where UserId = @userId and HasRight=0
		)
		union
		select r.code as rolecode,tp.id as purviewid,s.code as systemcode,tp.name,tp.code,tp.parentid,tp.PurviewType,tp.Remark
		from UserPurview op
		inner join PurviewInfo tp on op.purviewid=tp.id
		inner join RoleInfo r on op.roleid=r.id
		inner join SystemInfo s on tp.systemid=s.id
		where op.UserId=@userId and r.IsEnabled=1 and tp.IsEnabled=1 and op.HasRight=1
	) tmp on mi.purviewid=tmp.purviewid
	where mi.IsEnabled=1
	union
	select s.code as systemcode,'' as rolecode,mi.id
	from MenuInfo mi
	inner join SystemInfo s on mi.systemid=s.id
	where mi.purviewid is null and mi.IsEnabled=1 and s.ID=@systemId
) tmp2 on MenuInfo.id=tmp2.id
	
	
	
END
GO
