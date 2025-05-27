#!/bin/bash

echo "🧼 Iniciando a FAXINA suprema do macOS..."

# 1. Libera cache do DNS
echo "🔄 Limpando cache DNS..."
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder

# 2. Limpa arquivos temporários do sistema
echo "🧽 Limpando caches do sistema e usuário..."
sudo rm -rf /Library/Caches/*
sudo rm -rf /System/Library/Caches/*
rm -rf ~/Library/Caches/*

# 3. Mata processos zumbis ou intensivos de rede
echo "☠️ Finalizando processos pesados de rede..."
sudo pkill -f 'Dropbox|OneDrive|Google Drive|zoom.us|torrent|backupd'

# 4. Limpa arquivos de log
echo "📄 Limpando logs antigos..."
sudo rm -rf /private/var/log/*
sudo rm -rf /Library/Logs/*
rm -rf ~/Library/Logs/*

# 5. Apaga arquivos de lixo da lixeira
echo "🗑️ Esvaziando a lixeira..."
rm -rf ~/.Trash/*

# 6. Reinicia serviços de rede
echo "🌐 Reiniciando rede..."
networksetup -setv6off Wi-Fi
networksetup -setv6automatic Wi-Fi
sudo ifconfig en0 down
sudo ifconfig en0 up

# 7. Libera memória inativa (visual)
echo "💾 Liberando RAM (visual)..."
sudo purge

echo "✅ FAXINA concluída! Seu macOS está limpo e leve como o espírito do Anúbis."
