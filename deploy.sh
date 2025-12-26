#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "---------------------------------------------------------"
echo "🚀 Starting Deployment Process"
echo "---------------------------------------------------------"

# 1. Clean and Build (Optional but recommended for consistency)
# echo "🧹 Cleaning..."
# flutter clean
# flutter pub get

echo "🔨 Building Flutter Web App (Release Mode)..."
flutter build web --release

# 2. Prepare Build Folder
echo "📂 Navigating to build outputs..."
cd build/web

# 3. Initialize Git to push just this folder
echo "🌿 Initializing temporary git repository for deployment..."
git init
git branch -M gh-pages

# 4. Commit Build Artifacts
echo "📦 Committing build files..."
git add .
git commit -m "Deploy update: $(date)"

# 5. Push to GitHub
echo "🚀 Pushing to 'gh-pages' branch..."
git remote add origin git@github.com:srbh-tech/portfolio.git
git push -u origin gh-pages --force

echo "---------------------------------------------------------"
echo "✅ Deployment Complete! Your changes will be live shortly."
echo "---------------------------------------------------------"
# Run this single command in your terminal : ./deploy.sh