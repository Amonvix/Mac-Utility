#!/bin/bash

echo "🧼 Iniciando a FAXINA light (sem sudo)..."

# 1. Limpa caches do usuário
echo "🧽 Limpando caches do usuário..."
rm -rf ~/Library/Caches/*
rm -rf ~/Library/Logs/*

# 2. Esvazia a lixeira
echo "🗑️ Esvaziando a lixeira..."
rm -rf ~/.Trash/*

# 3. Fecha apps pesados se puder
echo "☠️ Tentando encerrar apps pesados (se possível)..."
pkill -f 'Dropbox|zoom.us|Google Chrome|Spotify|backupd' 2>/dev/null

# 4. Libera arquivos temporários do usuário
echo "🧼 Limpando arquivos temporários..."
rm -rf /private/tmp/* 2>/dev/null
rm -rf /var/folders/*/*/*-*/ 2>/dev/null

# 5. Mostra uso de rede e memória (somente visual)
echo "📊 Uso de rede e memória atual:"
netstat -iw en0
vm_stat

echo "✅ Faxina light concluída! Tudo que era possível foi limpo sem sudo."
