# Angular Ecommerce Web App

Projeto de ecommerce desenvolvido para o modulo de angular do Santander Coders 2023

<br/>

## Funcionalidade

O aplicativo permite que você navegue pela página inicial para produtos, verifique cada um dos detalhes do produto e adicione-os ao seu carrinho para um checkout posterior.

Adicionar produtos ao seu carrinho fará com que uma notificação apareça indicando que o produto foi adicionado com sucesso.

Você pode ver uma prévia do carrinho na barra superior ou até mesmo navegar para uma página de carrinho mais detalhada.

O processo de checkout é um formulário de várias páginas que, no final, permite que você faça um pedido que será mostrado posteriormente na página de histórico de pedidos.

<br/>

## Primeiros Passos

O aplicativo pode ser instalado clonando o repositório git

Em seguida, entre nos dois diretórios e execute npm install

```
cd folder-name
cd backend
npm run install
cd.. // return to folder-name
cd client
npm run install
```

<br/>

Após a instalação completa, você precisa executar o servidor e o cliente executando estes comandos em seus próprios diretórios

**backend**

```
npm run dev
```

**client**

```
npm run start
```

<br/>

## Prerequisites

Você precisará ter node e npm instalados. Além disso, você precisará de um servidor MySQL em execução para ter a funcionalidade completa do aplicativo. Pode usar um Wampserver ou Xampserver, após a instalção do seu servidor MySQL importe o banco de dados 'myapp.sql' localizado no diretorio da aplicação.

<br/>

## Environment Variables

Crie uma pasta chamada env na raiz do diretório backend e crie um arquivo development.env.

**Altere as variáveis de DB para corresponder à sua configuração MySQL**

```
PORT=5000
DB_HOST='localhost'
DB_USER='root'
DB_PASSWORD=''
DB_NAME='myapp'
```


## Observação
Caso a tela de checkout apareça com bugs(ou mal carregada) basta dar um refresh na página.
