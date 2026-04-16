#!/bin/bash

# Script para consultar WHOIS AS8087 e salvar em arquivo

# Diretório de output
OUTPUT_DIR="./whois_output"
OUTPUT_FILE="$OUTPUT_DIR/as8087_$(date +%Y%m%d_%H%M%S).txt"

# Criar diretório se não existir
mkdir -p "$OUTPUT_DIR"

# Executar whois e salvar em arquivo
echo "🔍 Consultando WHOIS para AS8087..."
whois as8087 > "$OUTPUT_FILE" 2>&1

# Verificar se o comando foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "✓ Consulta concluída com sucesso!"
    echo "✓ Resultado salvo em: $OUTPUT_FILE"
    echo ""
    echo "📊 Informações:"
    wc -l "$OUTPUT_FILE" | awk '{print "   Linhas: " $1}'
    du -h "$OUTPUT_FILE" | awk '{print "   Tamanho: " $1}'
    echo ""
    echo "📄 Primeiras 20 linhas:"
    head -20 "$OUTPUT_FILE"
else
    echo "✗ Erro ao executar whois"
    exit 1
fi
