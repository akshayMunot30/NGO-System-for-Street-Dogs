import 'package:alfred/alfred.dart';
import 'package:mongo_dart/mongo_dart.dart';



void main(List<String> arguments) async {
  final app = Alfred();
  final db = await Db.create(
      'mongodb+srv://akshaymunot30:akshay@cluster0.ozpyp.mongodb.net/ngo?retryWrites=true&w=majority');

  await db.open();
  final coll = db.collection('test');

  

  app.get('/testDb', (req, res) async {
    var data = await coll.find().toList();
    return data;
  });

  await app.listen(3000); //Listening on port 3001
}
