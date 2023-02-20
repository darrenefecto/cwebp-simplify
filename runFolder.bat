@echo off
setlocal
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set /p "folder_path=Enter the folder path: "

set /p "use_name_or_number=Do you want to use the original file name (O) or convert from name to number (N)? "

if /i "%use_name_or_number%" == "N" (
  set /p "start_number=Enter the starting number: "
)

set /a "count=%start_number%"

for /f "delims=" %%f in ('dir /b "%folder_path%\*.*"') do (
  set "file_name=%%f"
  set "file_ext=!file_name:~-4!"

  if /i "!file_ext!" == ".jpg" (
    if /i "%use_name_or_number%" == "N" (
      set "output_file_path=!folder_path!\!count!.webp"
      set /a "count+=1"
    ) else (
      set "output_file_path=!folder_path!\!file_name:~0,-4!.webp"
    )
    cwebp -q 100 "!folder_path!\!file_name!" -o "!output_file_path!"
  ) else if /i "!file_ext!" == ".jpeg" (
    if /i "%use_name_or_number%" == "N" (
      set "output_file_path=!folder_path!\!count!.webp"
      set /a "count+=1"
    ) else (
      set "output_file_path=!folder_path!\!file_name:~0,-5!.webp"
    )
    cwebp -q 100 "!folder_path!\!file_name!" -o "!output_file_path!"
  ) else if /i "!file_ext!" == ".png" (
    if /i "%use_name_or_number%" == "N" (
      set "output_file_path=!folder_path!\!count!.webp"
      set /a "count+=1"
    ) else (
      set "output_file_path=!folder_path!\!file_name:~0,-4!.webp"
    )
    cwebp -q 100 "!folder_path!\!file_name!" -o "!output_file_path!"
  )
)

set /p "delete_original=Do you want to delete the original image files (Y/N)? "
if /i "%delete_original%" == "Y" (
  for /f "delims=" %%f in ('dir /b "%folder_path%\*.*"') do (
    set "file_name=%%f"
    set "file_ext=!file_name:~-4!"
    if /i "!file_ext!" == ".jpg" (
      del "!folder_path!\!file_name!"
    ) else if /i "!file_ext!" == ".jpeg" (
      del "!folder_path!\!file_name!"
    ) else if /i "!file_ext!" == ".png" (
      del "!folder_path!\!file_name!"
    )
  )
)

pause

endlocal
