@echo off 
REM Change the *.jpeg to what ever file you need.
REM this will not rename files in sub folder
REM to rename the files in sub folder Add "/r"  after "FOR" in next line , without double quotes
FOR %%i IN (*.jpeg) DO (
	SETLOCAL ENABLEDELAYEDEXPANSION
	REM ECHO Renaming... File Name-%%i  DateTime-%%~ti Size-%%~zi FullPath%%~fi OnlyName-%%~ni Extension-%%~xi   
	
	SET FileName=%%i
	SET FileDt=%%~ti
	SET FileDt=!FileDt:^:=-!
	SET FileDt=!FileDt: =_!
	SET FileDt=!FileDt:/=-!
	REM echo FileDt : !FileDt!
	SET NewFileName=%%~ni_!FileDt!%%~xi
	REM ECHO NewFileName : !NewFileName!
	SET CompareFileName=!FileName:%FileDt%=!
	REM ECHO CompareFileName : !CompareFileName!
	if !CompareFileName!==!FileName! (
		echo Renaming... File Name-%%i to New File Name-!NewFileName!
		RENAME  !FileName! !NewFileName!
	)
)