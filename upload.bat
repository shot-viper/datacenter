@echo off
title GitHub Folder Upload

echo =========================
echo Uploading all files...
echo =========================

:: Initialize git if not already initialized
if not exist ".git" (
    git init
)

:: Install Git LFS
git lfs install

:: Track large Android/game files
git lfs track "*.apk"
git lfs track "*.obb"
git lfs track "*.zip"
git lfs track "*.rar"
git lfs track "*.7z"

:: Add GitHub repo if missing
git remote get-url origin >nul 2>nul
if errorlevel 1 (
    git remote add origin https://github.com/shot-viper/datacenter.git
)

:: Add ALL files and folders
git add .

:: Commit changes
git commit -m "Upload all files"

:: Set branch
git branch -M main

:: Push to GitHub
git push -u origin main

echo.
echo =========================
echo Upload complete!
echo =========================

pause