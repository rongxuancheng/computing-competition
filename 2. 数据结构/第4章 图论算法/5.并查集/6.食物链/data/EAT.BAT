@echo off
if "%1"=="" goto loop
copy eat%1.in eat.in >nul
echo Problem Test
echo Data %1
time<enter
eat
time<enter
FC eat.out eat%1.ans
del eat.in
del eat.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
