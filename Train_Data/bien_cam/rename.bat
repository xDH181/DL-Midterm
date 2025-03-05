@echo off
setlocal EnableDelayedExpansion

set /A count=0
for %%F in (*) do (
    if /I not "%%F"=="rename.bat" (
        set /A count+=1
        ren "%%F" "cam_!count!.jpg"
    )
)

echo Done!
pause
