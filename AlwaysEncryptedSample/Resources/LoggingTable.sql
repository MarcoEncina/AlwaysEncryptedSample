CREATE TABLE [Logging].[Log] (
	[Id] [int] IDENTITY (1, 1) NOT NULL
		CONSTRAINT PK_Log PRIMARY KEY  CLUSTERED,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar] (255) NOT NULL,
	[Level] [varchar] (50) NOT NULL,
	[Logger] [varchar] (255) NOT NULL,
	[User] [nvarchar] (50) NULL,
	[ClientIP]
		[nvarchar](45) -- Why 45? Because IPv6 Why Nvarchar? Because Log4Net
		COLLATE  Latin1_General_BIN2
		ENCRYPTED WITH (
		    COLUMN_ENCRYPTION_KEY = LogColumnsKey,
            ENCRYPTION_TYPE = DETERMINISTIC,
            ALGORITHM = 'AEAD_AES_256_CBC_HMAC_SHA_256'
        ) NULL,
	[Message] [varchar] (4000) NOT NULL,
	[Exception] [varchar] (2000) NULL
);