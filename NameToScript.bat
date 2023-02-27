@echo off

REM Ask the user for the folder path
set /p folderPath="Enter folder path: "

REM Check that the folder exists
if not exist "%folderPath%" (
  echo "Error: Folder does not exist."
  pause
  exit /b
)

REM Write the contents to a new document
(for %%f in ("%folderPath%\*.webp") do (
  echo ^<image src="%%f"^>
)) > %folderPath%\output.txt

REM Check that the output file was created
if not exist "%folderPath%\output.txt" (
  echo "Error: Output file was not created."
  pause
  exit /b
)

echo Check for document named output.txt in your chosen folder!
pause
