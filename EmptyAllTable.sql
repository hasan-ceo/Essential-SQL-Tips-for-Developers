/* 
Empty All Table
database: Microsoft SQL Server 
step 1: Read all table name from INFORMATION_SCHEMA.TABLES
step 2: Format column value as required in this case we add "delete from " string.
step 3: Use the cursor to retrieve data, one row at a time, from our result set
Step 4: Execute our formatted column values as a dynamic query for each iteration inside the cursor
other scope: This same process can follow in MySQL or any other relational database. 
You only need to convert it into the language-specific syntax
*/		
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
