USE [DMS]
GO
/****** Object:  StoredProcedure [dbo].[DMS_sp_adduser]    Script Date: 1/25/2020 4:27:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DMS_sp_adduser] 
(
@usrname varchar(50),
@email varchar(25),
@pwd varchar(10),
@error_code int OUTPUT,
@error_message varchar(500) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @this_tran bit

	set @error_code=0
	set @error_message='SUCCESS'
	set @this_tran=0

	IF EXISTS(select 1 from dbo.DMST_User(nolock)
				where Usr_Email=@email OR Usr_Name=@usrname)
	BEGIN
		SET @error_code=500001
		SET @error_message='already exists'
		RETURN;
	END

	IF(@@TRANCOUNT=0)
	BEGIN
		SET @this_tran=1
		BEGIN TRAN
	END

	BEGIN TRY
		INSERT INTO [dbo].[DMST_User]
           ([Usr_Name]
           ,[Usr_Email]
           ,[Usr_Password]
           ,[Usr_RoleID]
           ,[Is_Active]
           )
     VALUES
			(@usrname,@email,@pwd,1,1)
			
			
			--select 1/0

	END TRY

	BEGIN CATCH
		SET @error_code=ERROR_NUMBER()
		set @error_message=ERROR_MESSAGE()
		ROLLBACK TRAN
		RETURN

	END CATCH


	IF(@this_tran=1)
	BEGIN
		COMMIT TRAN
	END





END

GO
