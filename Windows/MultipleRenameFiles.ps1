$rename = Get-Content nomes.txt
$dir = dir -filter *.jpg -name

if($rename.count -eq $dir.count){
   for($i=0; $i -lt $rename.count; $i++){
     Rename-Item $dir[$i] $($rename[$i]+'.docx')
   }
}else{
   Write-Host "Erro" -ForegroundColor red -BackgroundColor white
}

$originalFiles = Get-ChildItem -Filter *.docx
$x = 1

ForEach ($originalFile in $originalFiles) {
    Rename-Item -Path $originalFile.FullName -NewName (($originalFile.Directory.FullName) + "\" + $x + " - " + $originalFile.Name)
    $x++
}