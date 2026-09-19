@echo off
chcp 65001 >nul
title 长耳听见的那一年 - 微型视觉小说
cd /d "%~dp0"
echo.
echo   ============================================
echo    长耳听见的那一年  The Year Longer Heard
echo    微型视觉小说 · 全年龄 · 单线
echo   ============================================
echo.
where node >nul 2>nul
if %errorlevel%==0 (
  echo   正在启动本地服务器 ...
  start "" http://127.0.0.1:8809/
  node tools\serve.js
) else (
  echo   未检测到 Node.js，直接打开本地文件。
  echo   若存档异常，请安装 Node.js 后重试，或用 Chrome/Edge 打开 dist\index.html
  start "" "dist\index.html"
)
