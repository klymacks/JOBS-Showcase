# Setup GitHub Repository for JOBS Showcase

Write-Host "🚀 Setting up GitHub repository for JOBS Showcase" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

$repoName = "JOBS-Showcase"
$githubUrl = "https://github.com/klymacks/$repoName"

Write-Host "Steps to publish your showcase:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Initialize Git (if not already):" -ForegroundColor White
Write-Host "   cd JOBS-Showcase" -ForegroundColor Green
Write-Host "   git init" -ForegroundColor Green
Write-Host "   git add ." -ForegroundColor Green
Write-Host "   git commit -m 'Initial showcase commit'" -ForegroundColor Green
Write-Host ""
Write-Host "2. Create repository on GitHub:" -ForegroundColor White
Write-Host "   Visit: https://github.com/new" -ForegroundColor Green
Write-Host "   Repository name: $repoName" -ForegroundColor Green
Write-Host "   Description: 'Showcase of the JOBS (Justified Outcome Business System) - A KPI dashboard and time tracking system'" -ForegroundColor Green
Write-Host "   Visibility: Public (to get stars!)" -ForegroundColor Green
Write-Host "   DO NOT initialize with README (we already have one)" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Push to GitHub:" -ForegroundColor White
Write-Host "   git remote add origin $githubUrl.git" -ForegroundColor Green
Write-Host "   git branch -M main" -ForegroundColor Green
Write-Host "   git push -u origin main" -ForegroundColor Green
Write-Host ""
Write-Host "4. Add screenshots (optional but recommended):" -ForegroundColor White
Write-Host "   - Take screenshots of your JOBS dashboard" -ForegroundColor Green
Write-Host "   - Save them in: screenshots/" -ForegroundColor Green
Write-Host "   - Update README.md to reference them" -ForegroundColor Green
Write-Host ""
Write-Host "5. Share it!" -ForegroundColor White
Write-Host "   - Reddit: r/webdev, r/programming" -ForegroundColor Green
Write-Host "   - Twitter/X with hashtags: #React #DotNet #WebDev" -ForegroundColor Green
Write-Host "   - Dev.to article about building it" -ForegroundColor Green
Write-Host ""

$response = Read-Host "Would you like to initialize git now? (y/n)"
if ($response -eq 'y' -or $response -eq 'Y') {
    Write-Host ""
    Write-Host "Initializing git..." -ForegroundColor Cyan
    Set-Location "JOBS-Showcase"
    git init
    git add .
    git commit -m "Initial showcase commit"
    Write-Host ""
    Write-Host "✅ Git initialized!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next: Create the repo on GitHub and push!" -ForegroundColor Yellow
    Write-Host "Visit: https://github.com/new" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "You can run this script again when ready, or do it manually!" -ForegroundColor Yellow
}

