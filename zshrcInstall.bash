#!/bin/bash

set -o errexit
set -o nounset
IFS=$(printf '\n\t')

# Instalação do zsh
echo "Instalando zsh..."
sudo apt update
sudo apt install zsh -y

# Configura zsh como o shell padrão
echo "Configurando o zsh como o shell padrão..."
chsh -s $(which zsh)

# Baixa e instala o zinit
echo "Instalando o zinit..."
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Verifica se o arquivo de configuração do zsh já existe e faz backup
if [ -f ~/.zshrc ]; then
    echo "Arquivo ~/.zshrc encontrado. Fazendo backup..."
    cp ~/.zshrc ~/.zshrc.bak
fi

# Adiciona plugins ao arquivo ~/.zshrc
echo "Adicionando plugins ao ~/.zshrc..."
cat <<EOL >> ~/.zshrc

# Plugins do zinit
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

EOL

# Solicita ao usuário para reiniciar o terminal
echo "Por favor, feche e reabra o terminal para aplicar as alterações. Depois, execute o comando abaixo para definir o tema do zsh:"
echo 'nano ~/.zshrc'
echo 'Atribua o valor para a variável ZSH_THEME="philips" e salve o arquivo.'

# Mensagem final
echo "Script concluído. Não se esqueça de reiniciar o terminal e configurar o tema no arquivo ~/.zshrc conforme indicado."

