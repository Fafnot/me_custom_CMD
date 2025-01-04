@echo off




::: alias 
doskey ls=dir $*
doskey clear=cls $*


chcp 65001 > nul 

setlocal enabledelayedexpansion 
title Nonnsweety ^|Custom ^CMD

rem это не я писал код снизу 
::: -----------------------------------------------------------------------------------------
set "folder=G:\Git\cmd\me_custom_CMD\basic"

rem === Считываем все .txt файлы в папке и выбираем случайный ===
set count=0
for %%f in ("%folder%\*.txt") do (
    set /a count+=1
    set "file[!count!]=%%f"
)

rem Генерируем случайное число от 1 до количества файлов
set /a randNum=%random% %% %count% + 1

rem Выбираем случайный файл
set "randomFile=!file[%randNum%]!"

::: ---------------------------------------------------------------------------------------------------

for /f "delims=" %%A in (!randomFile!) do (
	echo [92m %%A[0m
)

for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
:cmd 

echo          [97m╔═══[0m[91m{%username%}[0m ~ [96m{%computername%}[0m ~ [35m[%cd%][0m


set /p input="╚═══> "


echo.
%input%


goto cmd 
pause > nul 





