#!/bin/bash
# Установка NVM, сам Node и пакетные менеджеры

# Установка NVM (Node Version Manager)
install_nvm() {
    echo "Устанавливаем NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    
    # Загружаем NVM в текущую сессию
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    
    echo "NVM установлен!"
}

# Установка Node.js (последней LTS версии) через NVM
install_node() {
    echo "Устанавливаем Node.js LTS..."
    nvm install --lts
    nvm use --lts
    echo "Node.js установлен!"
    
    # Проверяем версии
    echo "Версия Node.js: $(node --version)"
    echo "Версия npm: $(npm --version)"
}

# Установка менеджеров пакетов
install_package_managers() {
    echo "Устанавливаем менеджеры пакетов..."
    
    # Установка Yarn
    npm install -g yarn
    echo "Yarn установлен: $(yarn --version)"
    
    # Установка pnpm
    npm install -g pnpm
    echo "pnpm установлен: $(pnpm --version)"
    
    # Обновление npm до последней версии
    npm install -g npm@latest
    echo "npm обновлён: $(npm --version)"
}

# Основной процесс установки
main() {
    # Установка зависимостей (если нужно)
    sudo apt-get update
    sudo apt-get install -y curl
    
    install_nvm
    install_node
    install_package_managers
    
    echo "Установка завершена успешно!"
    echo "Чтобы применить изменения, может потребоваться перезапустить терминал или выполнить:"
    echo "source ~/.bashrc"
}

main
