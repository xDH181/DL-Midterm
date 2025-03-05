@echo off
setlocal EnableDelayedExpansion

set /A count=0
for %%F in (*) do (
    if /I not "%%F"=="rename.bat" (
        set /A count+=1
        set "newname=nhieu_bien_!count!.jpg"

        REM Kiểm tra nếu file trùng tên thì tăng số thứ tự cho đến khi tìm được tên chưa bị trùng
        :check_exists
        if exist "!newname!" (
            set /A count+=1
            set "newname=hieu_lenh_!count!.jpg"
            goto check_exists
        )

        REM Loại bỏ thuộc tính Read-Only nếu có
        attrib -R "%%F"

        ren "%%F" "!newname!"
    )
)

echo Done!
pause