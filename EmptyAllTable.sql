		declare @str varchar(250)
		declare tmp cursor for
		SELECT 'delete from '+table_schema+'.'+TABLE_NAME FROM INFORMATION_SCHEMA.TABLES

		open tmp
		fetch next from tmp into @str
		while @@fetch_status = 0 
		begin
			EXECUTE (@str)
			fetch next from tmp into @str
		end
		close tmp
		deallocate tmp