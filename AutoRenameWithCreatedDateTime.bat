@ECHO OFF 
REM Change the *.jpeg to what ever file you need.
REM this will not rename files in sub folder
REM to rename the files in sub folder Add "/r"  after "FOR" in next line , without double quotes

FOR %%i IN (*.jpg) DO (
	SETLOCAL ENABLEDELAYEDEXPANSION
	REM ECHO Renaming... File Name-%%i  DateTime-%%~ti Size-%%~zi FullPath%%~fi OnlyName-%%~ni Extension-%%~xi   
	
	SET FileName=%%i
	SET OrgiFileName="!FileName!"
	REM ECHO OrgiFileName: !OrgiFileName!
	SET FileDt=%%~ti
	SET FileDt=!FileDt:^:=-!
	SET FileDt=!FileDt: =_!
	SET FileDt=!FileDt:/=-!
	REM ECHO FileDt : !FileDt!
	SET NewFileName="%%~ni_!FileDt!%%~xi"
	REM ECHO NewFileName : !NewFileName!
	SET CompareFileName=!FileName!!FileDt!
	REM ECHO CompareFileName : !CompareFileName!
	IF NOT !CompareFileName!==!FileName! (
		ECHO Renaming... File Name-%%i to New File Name-!NewFileName!
		REN  !OrgiFileName!     !NewFileName!
	)
)