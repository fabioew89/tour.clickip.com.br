# tour.clickip.com.br

> Um repositório com scripts utilitários e automação de deployment via GitHub Actions

## 📋 Descrição

Este projeto contém scripts bash utilitários para consultas WHOIS, testes e automação de deploy para servidor remoto usando GitHub Actions.

## 📁 Estrutura do Projeto

```
tour.clickip.com.br/
├── hello.sh                          # Script Hello World estilizado
├── whois_as8087.sh                   # Consulta WHOIS para AS8087
├── .github/
│   └── workflows/
│       └── deploy.yml                # GitHub Actions CI/CD
├── .git/hooks/
│   └── post-commit                   # Git Hook para deploy local
└── README.md                          # Este arquivo
```

## 🚀 Scripts Disponíveis

### 1. `hello.sh` - Hello World Estilizado

Exibe uma mensagem "Hello World" formatada com cores e informações do sistema.

```bash
./hello.sh
```

**Saída:**

- Mensagem estilizada com cores e caixas ASCII
- Data e hora do sistema
- Usuário e hostname
- Diretório atual

### 2. `whois_as8087.sh` - Consulta WHOIS AS8087

Executa consulta WHOIS para o AS8087 e salva o resultado em arquivo com timestamp.

```bash
./whois_as8087.sh
```

**Funcionalidades:**

- Consulta informações do AS8087 via `whois`
- Salva em `whois_output/as8087_YYYYMMDD_HHMMSS.txt`
- Exibe estatísticas (linhas, tamanho)
- Mostra primeiras 20 linhas do resultado

## ⚙️ Automação com GitHub Actions

### Deploy Automático via SCP

O workflow `.github/workflows/deploy.yml` executa automaticamente quando você faz push para `main` ou `master`.

**Fluxo:**

1. ✅ GitHub Actions verifica out seu código
2. 🔐 Configura SSH com chave privada
3. 📤 Copia arquivos para `/prod/` via SCP
4. ⚙️ Torna scripts executáveis no servidor remoto

### Git Hook Local (post-commit)

O arquivo `.git/hooks/post-commit` copia scripts para `/prod/` após cada commit local.

```bash
chmod +x .git/hooks/post-commit
```

## 🔐 Configuração de Secrets

Para usar o GitHub Actions com SCP, configure os seguintes secrets em **Settings → Secrets and variables → Actions**:

| Secret            | Descrição                  | Exemplo                     |
| ----------------- | -------------------------- | --------------------------- |
| `SSH_HOST`        | IP ou hostname do servidor | `192.168.1.100`             |
| `SSH_USER`        | Usuário SSH                | `deploy`                    |
| `SSH_PORT`        | Porta SSH                  | `22`                        |
| `SSH_PRIVATE_KEY` | Chave privada SSH          | Conteúdo de `~/.ssh/id_rsa` |

### Gerar Chave SSH:

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/github_deploy -N ""
cat ~/.ssh/github_deploy          # Copie como SSH_PRIVATE_KEY
cat ~/.ssh/github_deploy.pub      # Adicione em ~/.ssh/authorized_keys no servidor
```

## 📝 Como Usar

### Clone o repositório

```bash
git clone https://github.com/seu-usuario/tour.clickip.com.br.git
cd tour.clickip.com.br
```

### Execute os scripts

```bash
chmod +x *.sh
./hello.sh
./whois_as8087.sh
```

### Faça commits e push

```bash
git add .
git commit -m "Sua mensagem aqui"
git push origin main
```

O GitHub Actions vai executar automaticamente e fazer deploy no seu servidor remoto.

## 📊 GitHub Actions - Fluxo

```
┌─────────────────────────────────────────┐
│  You push to main/master                │
└────────────────┬────────────────────────┘
                 ↓
┌─────────────────────────────────────────┐
│  GitHub Actions VM inicia               │
└────────────────┬────────────────────────┘
                 ↓
┌─────────────────────────────────────────┐
│  Checkout do código                     │
└────────────────┬────────────────────────┘
                 ↓
┌─────────────────────────────────────────┐
│  Setup SSH (chave privada + hosts)      │
└────────────────┬────────────────────────┘
                 ↓
┌─────────────────────────────────────────┐
│  SCP: copia arquivo para /prod/         │
└────────────────┬────────────────────────┘
                 ↓
┌─────────────────────────────────────────┐
│  SSH: chmod +x no servidor remoto       │
└────────────────┬────────────────────────┘
                 ↓
┌─────────────────────────────────────────┐
│  ✅ Deploy concluído!                   │
└─────────────────────────────────────────┘
```

## 🛠️ Permissões

Todos os scripts devem ter permissão de execução:

```bash
chmod +x hello.sh whois_as8087.sh
```

## 📄 Licença

Projeto livre para uso e modificação.

---

**Última atualização:** April 2026
