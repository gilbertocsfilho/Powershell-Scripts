#Script que faz download de imagens do dia do Bing e salva a foto com o dia de hoje na pasta de Imagens

$dia = get-date -format "dd-M-yyyy"
$mercado = "pt-BR"
$Resolucao = "1366x768"
$nomeArquivo = "BingWallpaper $dia.jpg" 
$nomePasta = "$env:USERPROFILE\Pictures\Wallpaper"
$localDownload = "$($nomePasta)\$($nomeArquivo)"

$encDiretorio = Test-Path $env:USERPROFILE\Pictures\Wallpaper\$nomeArquivo 

New-Item -ItemType Directory -Path $nomePasta -ErrorAction SilentlyContinue

[xml]$xmlBing = (New-Object System.Net.WebClient).DownloadString("http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=$($mercado)");

$linkImagem = "http://www.bing.com$($xmlBing.images.image.urlBase)_$($Resolucao).jpg";

if ($encDiretorio -eq $true)
    {

     Write-Host "Arquivo já encontrado, não será feito novamente o download."
      
    }
else
    {

    Invoke-WebRequest -UseBasicParsing -Uri $linkImagem -OutFile "$localDownload"
    Write-Host "Download da imagem foi realizado com sucesso."
    
    }