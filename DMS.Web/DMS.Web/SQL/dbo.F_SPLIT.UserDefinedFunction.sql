USE [DMS]
GO
/****** Object:  UserDefinedFunction [dbo].[F_SPLIT]    Script Date: 1/25/2020 4:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[F_SPLIT] 
(	
	@String varchar(max),
	@delimiter char(1)
)
RETURNS @temp_table TABLE (lists varchar(max))
AS
BEGIN
	DECLARE @INDEX INT,
	@SUBSTRING VARCHAR(MAX)

	SET @INDEX=1

	IF len(@String)<1 or @String IS NULL
		return

	while @INDEX<>0
	BEGIN
		set @INDEX=CHARINDEX(@delimiter,@String)

		IF @INDEX<>0
			set @SUBSTRING=LEFT(@String,@index-1)
		ELSE
			set @SUBSTRING=@String

		IF(len(@SUBSTRING)>0)
			insert into @temp_table(lists) values(@SUBSTRING)

			set @String=RIGHT(@String,len(@String)-@INDEX)

			if len(@String)=0
				break
		END


RETURN 
END


GO
