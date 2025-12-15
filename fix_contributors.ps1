# Fix Contributors - Create Fresh Repository
# This will create a completely fresh repo with only klymacks as contributor

Write-Host "🔄 Creating Fresh Repository (No Contributor History)" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

$repoPath = Get-Location
$backupPath = "$repoPath-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

Write-Host "This will:" -ForegroundColor Yellow
Write-Host "1. Backup current .git folder" -ForegroundColor White
Write-Host "2. Create a fresh git repository" -ForegroundColor White
Write-Host "3. Make a new commit with correct author" -ForegroundColor White
Write-Host "4. Force push to GitHub" -ForegroundColor White
Write-Host ""
Write-Host "⚠️  This will rewrite history on GitHub!" -ForegroundColor Red
Write-Host ""

$response = Read-Host "Continue? (y/n)"
if ($response -ne 'y' -and $response -ne 'Y') {
    Write-Host "Cancelled." -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "Backing up .git folder..." -ForegroundColor Cyan
Copy-Item -Path ".git" -Destination $backupPath -Recurse -Force
Write-Host "✅ Backup created: $backupPath" -ForegroundColor Green

Write-Host ""
Write-Host "Removing old .git folder..." -ForegroundColor Cyan
Remove-Item -Path ".git" -Recurse -Force

Write-Host ""
Write-Host "Initializing fresh git repository..." -ForegroundColor Cyan
git init
git config user.name "klymacks"
git config user.email "klymacks@pm.me"

Write-Host ""
Write-Host "Adding all files..." -ForegroundColor Cyan
git add .

Write-Host ""
Write-Host "Creating fresh commit..." -ForegroundColor Cyan
git commit -m "Initial showcase commit"

Write-Host ""
Write-Host "Setting branch to main..." -ForegroundColor Cyan
git branch -M main

Write-Host ""
Write-Host "✅ Fresh repository created!" -ForegroundColor Green
Write-Host ""
Write-Host "Current commit:" -ForegroundColor Yellow
git log --format="%h %an <%ae> %s" -1

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Verify the commit looks correct above" -ForegroundColor White
Write-Host "2. Force push to GitHub:" -ForegroundColor White
Write-Host "   git remote remove origin" -ForegroundColor Green
Write-Host "   git remote add origin https://github.com/klymacks/JOBS-Showcase.git" -ForegroundColor Green
Write-Host "   git push -f origin main" -ForegroundColor Green
Write-Host ""

$push = Read-Host "Push to GitHub now? (y/n)"
if ($push -eq 'y' -or $push -eq 'Y') {
    Write-Host ""
    Write-Host "Removing old remote..." -ForegroundColor Cyan
    git remote remove origin 2>$null
    
    Write-Host "Adding remote..." -ForegroundColor Cyan
    git remote add origin https://github.com/klymacks/JOBS-Showcase.git
    
    Write-Host "Force pushing..." -ForegroundColor Cyan
    git push -f origin main
    
    Write-Host ""
    Write-Host "✅ Done! Check GitHub - only klymacks should show as contributor." -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "You can push manually when ready!" -ForegroundColor Yellow
}

