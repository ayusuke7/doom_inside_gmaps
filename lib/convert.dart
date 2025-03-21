import 'dart:math' as math;
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:image/image.dart';

final asciiChars = ['@', '#', 'S', '%', '?', '*', '+', ';', ':', ',', '.'];
final width = 80;

Image? toGrayscale(Uint8List image) {
  final decodedImage = img.decodeImage(image);
  if (decodedImage == null) return null;

  return img.grayscale(decodedImage);
}

String imageToAscii(Uint8List image) {
  final decodedImage = img.decodeImage(image);
  if (decodedImage == null) return '';

  // Converte para escala de cinza
  final grayscaleImage = img.grayscale(decodedImage);

  // Redimensiona a imagem mantendo a proporção
  final height = decodedImage.height;
  final originalWidth = decodedImage.width;
  final newHeight = (height * (width / originalWidth) * 0.5).toInt();
  final resizedImage = img.copyResize(
    grayscaleImage,
    width: width,
    height: newHeight,
  );

  // Converte pixels para caracteres ASCII
  String asciiStr = '';

  for (int y = 0; y < newHeight; y++) {
    for (int x = 0; x < width; x++) {
      final pixel = resizedImage.getPixel(x, y);
      final luminance = img.getLuminance(pixel);
      final charIndex = math.min(
        (luminance * asciiChars.length / 255).toInt(),
        asciiChars.length - 1,
      );
      asciiStr += asciiChars[charIndex];
    }
    asciiStr += '\n';
  }

  return asciiStr;
}
