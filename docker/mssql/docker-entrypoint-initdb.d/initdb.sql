DECLARE @DataBaseName sysname;

SET
    @DataBaseName = '$(MSSQL_DB)';

IF (@DataBaseName LIKE '%[^_0-9A-Z]%') RAISERROR(
    'Invalid Characters in Name, %s',
    16,
    1,
    @DataBaseName
)
ELSE BEGIN
SET
    @DataBaseName = QUOTENAME(@DataBaseName) EXEC('CREATE DATABASE ' + @DataBaseName)
END