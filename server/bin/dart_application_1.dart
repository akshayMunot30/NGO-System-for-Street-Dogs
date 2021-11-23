import 'dart:io';

import 'package:alfred/alfred.dart';

void main(List<String> arguments) async{
  final app = Alfred();

  app.get('/sahil', (req, res) => 'Sahil is working on db with akshay');

  app.get('/json', (req, res) => {'json_response': true});

  app.get('/jsonExpressStyle', (req, res) {
    res.json({'type': 'traditional_json_response'});
  });

  app.get('/file', (req, res) => File('test/files/image.jpg'));

  app.get('/html', (req, res) {
    res.headers.contentType = ContentType.html;
    return '<html><body><h1>Test HTML</h1></body></html>';
  });

  await app.listen(6565); //Listening on port 6565
}