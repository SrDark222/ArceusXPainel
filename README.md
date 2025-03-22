# Tutorial para Executar o Script ArcesXPainel.sh no Termux

Este repositório contém o script `ArcesXPainel.sh`, um painel de controle para o Arceus X com várias opções úteis. Este tutorial irá guiá-lo em como executar o script no **Termux**, sem a necessidade de usar `git`.

## Passos para Executar o Script

### 1. Criar um Repositório e Subir o Script no GitHub

Se você ainda não fez isso, crie um repositório no **GitHub** e faça o upload do arquivo `ArcesXPainel.sh`. Certifique-se de que o arquivo contenha o código do painel de controle que você deseja executar.

### 2. Baixar o Script no Termux

Siga os seguintes passos no **Termux** para baixar o script diretamente do **GitHub**:

#### 2.1. **Abrir o Termux**
Abra o **Termux** no seu dispositivo Android.

#### 2.2. **Instalar curl ou wget**

Caso você não tenha o **curl** ou o **wget** instalado, instale um deles com os seguintes comandos:

- Para **curl**:
  ```bash
  pkg install curl

Para wget:

pkg install wget


2.3. Baixar o Script

Agora, baixe o script diretamente do GitHub. Substitua o link abaixo pelo link do seu arquivo ArcesXPainel.sh no GitHub:

Com curl:

curl -O https://github.com/seuusuario/ArcesXPainel/raw/main/ArcesXPainel.sh

Com wget:

wget https://github.com/seuusuario/ArcesXPainel/raw/main/ArcesXPainel.sh


3. Tornar o Script Executável

Após o download, você precisa tornar o script executável. Para isso, execute o seguinte comando:

chmod +x ArcesXPainel.sh

4. Executar o Script

Agora, você pode executar o script com o comando abaixo:

./ArcesXPainel.sh

Isso iniciará o painel de controle, onde você verá um menu com várias opções úteis, como:

1. Adicionar AutoExec Script


2. Remover AutoExec Script


3. Limpar logs do Workspace


4. Remover Abas do Arceus X


5. Minimizar Arceus X



5. Como Usar o Menu do Script

O script exibirá um menu simples no Termux, onde você pode escolher uma das opções digitando o número correspondente. As opções são:

1. Adicionar AutoExec Script: Procura e adiciona scripts Lua à pasta AutoExec.


2. Remover AutoExec Script: Remove scripts da pasta AutoExec.


3. Limpar logs do Workspace: Apaga os logs do Arceus X.


4. Remover Abas do Arceus X: Remove abas configuradas.


5. Minimizar Arceus X: Limpa o cache do Arceus X.


6. Sair: Encerra o script.



6. Problemas Comuns

Erro ao executar o script: Certifique-se de que você tornou o script executável com o comando:

chmod +x ArcesXPainel.sh

Falha ao baixar o script: Verifique se o link do GitHub está correto e se o Termux tem acesso à internet.



---

Conclusão

Agora você tem um painel de controle funcional para o Arceus X no Termux! Se houver dúvidas ou problemas, não hesite em verificar os logs ou consultar a documentação do Termux.


---

Resumo de Como Usar no Termux:

1. Instalar o curl ou wget:



Para curl:

pkg install curl

Para wget:

pkg install wget


2. Baixar o script (substitua o link pelo seu repositório do GitHub):



Com curl:

curl -O https://github.com/seuusuario/ArcesXPainel/raw/main/ArcesXPainel.sh

Com wget:

wget https://github.com/seuusuario/ArcesXPainel/raw/main/ArcesXPainel.sh


3. Tornar o script executável:



chmod +x ArcesXPainel.sh

4. Executar o script:



./ArcesXPainel.sh


