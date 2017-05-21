-- TODO: Make the database name a sqlcmd paramater
USE master;
IF db_id('AlwaysEncryptedSample') IS NOT NULL
BEGIN
	ALTER DATABASE AlwaysEncryptedSample 
		SET OFFLINE WITH Rollback Immediate;
	ALTER DATABASE AlwaysEncryptedSample 
		SET ONLINE;
	DROP DATABASE AlwaysEncryptedSample;
END;
CREATE DATABASE AlwaysEncryptedSample;

