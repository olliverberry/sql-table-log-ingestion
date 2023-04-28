CREATE DATABASE $(DB_NAME);
GO

CREATE LOGIN $(LOGIN_NAME)
    WITH PASSWORD = '$(USER_PASSWORD)';
GO

USE $(DB_NAME);
CREATE USER $(USER_NAME) FOR LOGIN $(LOGIN_NAME);
GO

USE $(DB_NAME);
EXEC sp_addrolemember 'db_datareader', '$(USER_NAME)';
GO

CREATE TABLE $(TABLE_NAME) (
    Timestamp datetime2,
    Message nvarchar(max),
    Level varchar(255)
);
GO