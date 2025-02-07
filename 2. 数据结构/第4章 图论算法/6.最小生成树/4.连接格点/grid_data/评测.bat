@echo off
if "%1"=="" goto loop
copy grid%1.in grid.in >nul
echo Problem Test
echo Data %1
time<enter
grid
time<enter
fc grid.out grid%1.out
pause
del grid.in
del grid.out
goto end
:loop
for %%i in (0 1 2 3 4 5 6 7 8 9) do call %0 %%i
:end
