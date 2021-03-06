USE [DMS]
GO
/****** Object:  StoredProcedure [dbo].[DMMS_sp_LoggedUsr]    Script Date: 1/25/2020 4:27:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[DMMS_sp_LoggedUsr]
(
@Log_Email varchar(25),
@Log_Pwd varchar(25),
@error_code int OUTPUT,
@error_message varchar(500) OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET @error_code=0
	SET @error_message='SUCCESS'
	

	BEGIN TRY
		 
		IF EXISTS(select 1 from dbo.DMST_User(nolock)
					where Usr_Email=@Log_Email AND Usr_Password=@Log_Pwd)
		BEGIN
			select Usr_Name as[UserName],Usr_Email as [UserEmail],Usr_RoleID as [UserRoleId] from dbo.DMST_User(nolock)
					where Usr_Email=@Log_Email AND Usr_Password=@Log_Pwd AND Is_Active=1
					
				
				 
		END
		ELSE
		BEGIN
		SET @error_code=500001
			SET @error_message='User Does not exists'
			RETURN;
			
		END


		IF(@@ROWCOUNT=0)
				BEGIN
					SET @error_code=500001
			SET @error_message='User Does not exists'
				END	


	END TRY

	BEGIN CATCH
		SET @error_code=ERROR_NUMBER()
		set @error_message=ERROR_MESSAGE()
	--	ROLLBACK TRAN
		--RETURN;

	END CATCH


	 
	
END


GO
