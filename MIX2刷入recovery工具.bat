ECHO OFF
TITLE 小米MIX2 Recovery替换工具
color 8f
:STARTS
CLS
ECHO.   小米MIX2 Recovery替换工具  时间：%DATE% %TIME:~0,8%  ROmer:且行且珍惜
ECHO.
ECHO. =============================================================================
ECHO. 注意：
ECHO.      1.请确定已经安装好驱动并打开USB调试模式！
ECHO.      
ECHO.      2.运行本程序时请关闭91助手，豌豆荚等的手机管理软件！
ECHO.   
ECHO.      3.你将在官方原版、TWRP版二个不同recovery中自由切换，官方原版为官方
ECHO.        安卓8体验版刷机包提取，未做任何改动。TWRP版为最新3.2.1源码编译，支持
ECHO.        安卓8.0。
ECHO.      4.选择下面操作前，请确保手机已解锁，并手动进入fastboot模式(关机状态时
ECHO.        按住手机音量下键，再按开机键）。
ECHO. =============================================================================
ECHO.
ECHO.      请选择你的操作?
ECHO.
ECHO.           1.刷入官方recovery                2.刷入中文TWRP_recovery
ECHO.
ECHO.
ECHO.           0.退出   
ECHO.                              
ECHO.                                               
ECHO. =============================================================================
:CHO
set choice=
set /p choice= 输入对应数字，然后按回车键:
if /i "%choice%"=="1" goto Official
if /i "%choice%"=="2" goto TWRP
if /i "%choice%"=="0" goto EXT
echo 选择无效，请重新输入
echo.
pause
GOTO STARTS

:Official
CLS
ECHO ***************************************************************************
ECHO *        如果一直卡在【waiting for device】                               *
ECHO *        请在此时用豌豆荚或者手机助手连接                                 *
ECHO *        会提示下载并安装驱动                                             *
ECHO ***************************************************************************
ECHO. 刷写recovery...
fastboot flash recovery Official_recovery.img
ECHO.
ECHO.
ECHO. 刷写官方recovery完成，按任意键返回...
ECHO. 
ECHO.
ECHO.
pause
GOTO STARTS
:TWRP
CLS
ECHO ***************************************************************************
ECHO *        如果一直卡在【waiting for device】                               *
ECHO *        请在此时用豌豆荚或者手机助手连接                                 *
ECHO *        会提示下载并安装驱动                                             *
ECHO ***************************************************************************
ECHO. 刷写recovery...
fastboot flash recovery tw_recovery.img
ECHO.
ECHO.
ECHO. 刷写TWRP_recovery完成，按任意键重启手机到recovery...
ECHO.
ECHO.
pause
fastboot boot tw_recovery.img
GOTO STARTS

:EXIT
exit
