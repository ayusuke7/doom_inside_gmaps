import 'dart:io';
import 'dart:typed_data';

Future<dynamic> getWindowId(String windowName) async {
  final idProcess = await Process.run(
    'sh',
    ['-c', "wmctrl -lx | grep -i '$windowName' | awk '{print \$1}'"],
  );

  if (idProcess.exitCode != 0 || idProcess.stdout.isEmpty) {
    print("Janela do DOOM não encontrada!");
    return null;
  }
  return idProcess.stdout.trim();
}

Future<Uint8List?> captureDoomWindow(windowId) async {
  final screenshotProcess = await Process.run(
    'import',
    ['-window', windowId, '/tmp/doom.png'],
  );
  if (screenshotProcess.exitCode != 0) return null;

  final file = File('/tmp/doom.png');
  if (!await file.exists()) return null;

  return file.readAsBytes();
}
