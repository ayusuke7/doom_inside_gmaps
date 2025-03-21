import 'dart:io';

import 'package:doom_inside_gmaps/capture.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_web_socket/shelf_web_socket.dart';

void main() async {
  final windowId = await getWindowId('DOOM Shareware');
  if (windowId == null) {
    print("Janela do DOOM não encontrada!");
    return;
  }

  final handler = webSocketHandler((socket, _) async {
    while (true) {
      final bytes = await captureDoomWindow(windowId);
      if (bytes != null) {
        socket.sink.add(bytes);
      } else {
        print("Erro ao capturar a tela");
      }
    }
  });

  // Inicia o servidor
  final server = await io.serve(handler, InternetAddress.anyIPv4, 8765);
  print('Servidor rodando em ws://${server.address.host}:${server.port}');
}
