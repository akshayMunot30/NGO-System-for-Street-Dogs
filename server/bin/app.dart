import 'package:alfred/alfred.dart';

void main(List<String> arguments) async{
  final app = Alfred();

  app.get('/testDb', (req, res) async{
    var data = 'dummy'; // come from mongo databasse
    return data;
  });

  
  await app.listen(6565); //Listening on port 6565
}