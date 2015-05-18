--创建表自动ID
if exists (select 1
            from  sysobjects
           where  id = object_id('TableId')
            and   type = 'U')
   drop table TableId
CREATE TABLE [dbo].[TableId](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tablename] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[currentid] [bigint] NULL,
	[updatetime] [datetime] NULL,
 CONSTRAINT [PK_TB_TABLEID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

declare @tablename varchar(100)
declare @indexCount int
declare @colname varchar(100)
declare @coltype varchar(100)
declare @sql nvarchar(1000)
declare @value varchar(100)
declare cur cursor for
select name from sysobjects where xtype='U' and name<>'TableId'
open cur
fetch next from cur  into @tablename
while(@@fetch_status=0)
begin
	select  c.name   as   colname,t.name   as   coltype 
	into #tmp
	from   sysindexes   i 
	join   sysindexkeys   k   on   i.id   =   k.id   and   i.indid   =   k.indid 
	join   sysobjects   o   on   i.id   =   o.id 
	join   syscolumns   c   on   i.id=c.id   and   k.colid   =   c.colid 
	join   systypes   t   on   c.xusertype=t.xusertype 
	where   o.xtype   =   'U ' 
	and   o.name= @tablename 
	and   exists(select   1   from   sysobjects   where   xtype   =   'PK '   and   parent_obj=i.id   and   name   =   i.name) 
	order   by   o.name,k.colid

	select @indexCount=count(1) from #tmp
	if(@indexCount = 1)
	begin
		select @colname=colname,@coltype=coltype from #tmp
		if(@coltype = 'bigint' or @coltype = 'int')
		begin
			set @sql = 'select @value=isnull(cast(max('+@colname+') as varchar),''0'') from ['+@tablename+']'
			exec sp_executesql @sql,N'@value varchar(100) output',@value output
			if exists(select null from TableId where tablename=@tablename)
			begin
				update TableId set currentid=cast(@value as bigint),updatetime=getdate() where tablename=@tablename
			end
			else begin
				insert TableId(tablename,currentid,updatetime) values(@tablename,cast(@value as bigint),getdate())
			end
		end
	end

	drop table #tmp	

	fetch next from cur  into @tablename
end
close cur
deallocate cur

GO

CREATE PROCEDURE [dbo].[GetNewID] @TableName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL serializable
	DECLARE @ReturnID BIGINT
	
	BEGIN TRAN

	IF(EXISTS(SELECT currentid FROM TableId WHERE tablename=@TableName))
	BEGIN
		-- 数据库中存在当天记录，流水号加1再获取流水号
		UPDATE dbo.TableId WITH(ROWLOCK) 
		SET currentid=currentid+1,updatetime=getdate()
		WHERE tablename=@TableName

		SELECT @ReturnID=currentid 
		FROM dbo.TableId WITH(ROWLOCK)
		WHERE tablename=@TableName
	END
	ELSE
	BEGIN
		-- 如果不存在当前表名记录，创建记录再获取流水号
		INSERT INTO TableId(tablename,currentid,updatetime) 
		VALUES(@TableName,1,getdate())

		SET @ReturnID=1
	END
	
	IF(@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN	
	END
	ELSE 
	BEGIN
		COMMIT TRAN	
	END
	
	Select @ReturnID
	Return @ReturnID
END