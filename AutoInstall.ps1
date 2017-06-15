# Habilitando a execu��o de scripts
# Set-ExecutionPolicy Unrestricted -Force

# Desabilitar o Firewall
# netsh advfirewall set allprofiles state off

# Remover o serviço existente do VNC
$service=Get-WmiObject -Class Win32_Service -Filter "Name LIKE '%vnc%'"
Stop-Service $service.Name
$service.delete()

# Desinstalar VNC existente
$app = Get-WmiObject -Class Win32_Product -Filter "Name LIKE '%vnc%'"
if($app -ne $null){
    $app.Uninstall()
}

# Remover diret�rios do VNC existentes
$directories = Get-ChildItem -Path 'C:\Program Files'
foreach ($directory in $directories) { 
    if ($directory.Name | Select-String -Pattern "vnc") {
        $vncdir = 'C:\Program Files' + '\' + $directory.Name
        RemoveItem $vncdir
    }
}

$directories = Get-ChildItem -Path 'C:\Program Files (x86)'
foreach ($directory in $directories) { 
    if ($directory.Name | Select-String -Pattern "vnc") {
        $vncdir = 'C:\Program Files (x86)' + '\' + $directory.Name
        RemoveItem $vncdir
    }
}

# Instala o VNC
.\UltraVNC_1_2_11_X64_Setup.exe /loadinf=".\InstallConfig"

# Configura o VNC
Copy-Item -force .\ultravnc.ini 'C:\Program Files\UltraVNC'
