# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
$videoPath = "\\FLOSTORE\home\download\LeBonSon.After2000\"
Foreach ($file in Get-ChildItem -Path $videoPath -File)
{
    $outputFolder = Join-Path $videoPath "output"
    $inputVideoFile = Join-Path $videoPath $file
    $outputAudioFile = Join-Path $outputFolder ([io.path]::GetFileNameWithoutExtension($file) + ".mp3")
    if ( ![System.IO.File]::Exists($outputAudioFile) ) {
        Write-Host -NoNewline "Converting '$file' to audio..."
		ffmpeg.exe -i "$inputVideoFile" "$outputAudioFile" >$null 2>&1
        if ( $LASTEXITCODE -eq 0 ) { Write-Host " done!" }
        else { Write-Host " error!" }
    } else {
		Write-Host "'$file' already converted"
	}
}
Write-Host "Done!"
Read-Host -Prompt "Press Enter to exit"
