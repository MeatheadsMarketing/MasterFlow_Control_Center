#!/bin/bash

# Customize this path if MasterFlow lives elsewhere
cd ~/Desktop/Master_Flow_Control_Center

# Initialize Git if needed
if [ ! -d ".git" ]; then
  git init
fi

echo "[+] Staging and committing all files..."
git add .
git commit -m "🚀 MasterFlow v1.0 – Initial release with audit tagging, deployment summary, and Streamlit launcher"
git branch -M main

echo "[+] Linking remote origin (change username/repo if needed)..."
git remote add origin https://github.com/MeatheadsMarketing/MasterFlow_Control_Center.git 2>/dev/null

echo "[+] Pushing to GitHub..."
git push -u origin main

echo "[✓] MasterFlow v1.0 pushed to GitHub."
