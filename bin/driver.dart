import 'dart:io';

import 'package:doom_inside_gmaps/constants.dart';
import 'package:puppeteer/puppeteer.dart';

final targets = {
  'fiap': fiapSP,
  'times': timeSquare,
};

void main(List<String> args) async {
  print(args);

  if (args.isEmpty) {
    print('Target is required: ${targets.keys}');
    return;
  }

  final target = targets[args.first];
  if (target == null) {
    print('Target not found: ${targets.keys}');
    return;
  }

  final browser = await puppeteer.launch(
    headless: false,
    args: ['--no-sandbox', '--disable-web-security'],
  );
  final page = await browser.newPage();

  // Go to a page and wait to be fully loaded
  await page.goto(target.url, wait: Until.networkIdle);
  await page.waitForSelector('#scene');

  await page.evaluate(
    '''
      const scene = document.querySelector('#scene');     
      const img = document.createElement('img');

      img.id = 'doom';
      img.style.position = 'absolute';
      img.style.transform='${target.transform}';
      img.style.width = '${target.width}';
      img.style.height = '${target.height}';
      img.style.top = '${target.top}';
      img.style.left = '${target.left}';

      scene.appendChild(img);
  ''',
  );

  await page.addScriptTag(file: File('web/ws.js'));
}
