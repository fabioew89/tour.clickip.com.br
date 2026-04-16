#!/bin/bash

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Limpar tela
clear

# Hello World estilizado com cores
echo -e "${CYAN}╔════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${RED}    🚀 HELLO WORLD! 🚀${CYAN}       ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════╝${NC}"

echo ""
echo -e "${GREEN}✓ Script executado com sucesso!${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Informações do sistema
echo -e "${BLUE}📊 Informações do Sistema:${NC}"
echo -e "${CYAN}Data: $(date '+%d/%m/%Y %H:%M:%S')${NC}"
echo -e "${CYAN}Usuário: $(whoami)${NC}"
echo -e "${CYAN}Host: $(hostname)${NC}"
echo -e "${CYAN}Diretório: $(pwd)${NC}"

echo ""
echo -e "${GREEN}✨ Tudo pronto para subir no GitHub! ✨${NC}"
