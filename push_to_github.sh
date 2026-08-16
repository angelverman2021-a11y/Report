#!/usr/bin/env bash
set -e

REPO_DIR="/Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System"
REPO_URL="https://github.com/angelverman2021-a11y/Report.git"

cd "$REPO_DIR"

echo "========================================================"
echo "🚀 SIH25071 Report: GitHub Repository Push Automation"
echo "========================================================"

# Check if git is available
if ! command -v git &> /dev/null || git --version 2>&1 | grep -q "xcode-select"; then
    echo "⚠️ Git / Xcode Command Line Tools need to be installed on macOS."
    echo "Please run: xcode-select --install in your terminal to complete installation."
    echo ""
fi

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing local Git repository..."
    git init
fi

echo "📄 Staging all documentation files..."
git add .

echo "💾 Committing files..."
git commit -m "feat: Add comprehensive SIH25071 rockfall prediction benchmark, 26-tech analysis & AI architecture reports" || echo "No new changes to commit."

echo "🌿 Setting branch to main..."
git branch -M main

# Set remote origin
if git remote | grep -q "origin"; then
    git remote set-url origin "$REPO_URL"
else
    git remote add origin "$REPO_URL"
fi

echo "🌐 Pushing to GitHub repository: $REPO_URL ..."
echo "(If prompted, please enter your GitHub username and Personal Access Token / password)"
git push -u origin main

echo ""
echo "✅ Successfully pushed to https://github.com/angelverman2021-a11y/Report"
