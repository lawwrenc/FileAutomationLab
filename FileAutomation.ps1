$targetDays = 30
$cutoffDate = (Get-Date).AddDays(-$targetDays)

Write-Host "Finding files older than $cutoffDate..." -ForegroundColor Cyan

$oldFiles = Get-ChildItem -Path "." -File | Where-Object { $_.LastWriteTime -lt $cutoffDate }

if ($oldFiles) {
    foreach ($file in $oldFiles) {
        Write-Host "Processing old file: $($file.Name)" -ForegroundColor Yellow
        Move-Item -Path $file.FullName -Destination ".\Archive\" -WhatIf
    }
} else {
    Write-Host "No files found older than $targetDays days." -ForegroundColor Green
}