# DOOM Inside GMaps

Este projeto tem como objetivo rodar o jogo DOOM dentro de qualquer mapa do Google Maps,utilizando um servidor WebSocket para capturar a tela do jogo e um cliente WebSocket para exibir os frames no terminal.

![Sample Screenshot](screens/sample.gif)

## Requisitos

- `Dart 3.6` ou superior
- [doomgeneric](https://github.com/ozkl/doomgeneric)
- `wmctrl` instalado (para obter as coordenadas da janela do DOOM)

## Instalação de Dependências

1. Clone o repositório:

   ```sh
   git clone https://github.com/ayusuke7/doom_inside_gmaps
   cd doom_inside_gmaps
   ```

2. Instale as dependências Python:

   ```sh
   dart pub get
   ```

   dependencias dos projeto

   ```
    typed_data: ^1.4.0
    image: ^4.5.3
    shelf_web_socket: ^3.0.0
    shelf: ^1.4.2
    puppeteer: ^3.17.0

   ```

3. Instale o `wmctrl`:

   ```sh
   sudo apt-get install wmctrl
   ```

## Executando o DOOM Port

1. Instale qualquer PORT do jogo DOOM: ex (PrBoom, Chocolate DOOm, [doomgeneric](https://github.com/ozkl/doomgeneric)

```sh
    ./doomgeneric
```

## Executando o Server

1. Em outro terminal, inicie o cliente WebSocket:
   Obs: Antes de executar o servidor, garantir que o jogo DOOM esteja aberto ou executando em segundo plano.

   ```sh
   dart run bin/server
   ```

## Testando o Server

1. Voce pode executar o client html disponivel em `web/index.html` na intensao de verificar se o websocket esta rodando e entregando os frames capturados do jogo.

## Executando o WebDriver

1. Atualize o arquivo de Constants com a URL do local e a localizacao e as proporcoes que deseja visualizar o jogo.

```sh
dart run bin/driver
```

## Estrutura do Projeto

- [driver.dart](http://_vscodecontentref_/1): Cliente WebSocket que recebe e exibe os frames em ASCII.
- [server.dart](http://_vscodecontentref_/2): Servidor WebSocket que captura a tela do DOOM, converte para ASCII e envia os frames.
- [doomgeneric](https://github.com/ozkl/doomgeneric): Port do DOOM utilizado para obter os frames do jogo

## Observações

- Certifique-se de que o DOOM esteja instalado e configurado e executando corretamente no seu sistema.
- O script server.py utiliza o comando `wmctrl` para obter as coordenadas da janela do DOOM. Certifique-se de que o `wmctrl` esteja instalado e funcionando corretamente.

Divirta-se jogando DOOM em ASCII no terminal!
