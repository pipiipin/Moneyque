import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  // Log into database
  final db = await Db.create(
      'mongodb+srv://iceing11:mmkd1234@moneyque.elult.mongodb.net/app?retryWrites=true&w=majority');
  await db.open();
  final coll = db.collection('projects');
  final coll2 = db.collection('users');
  final coll3 = db.collection('transactions');

  // Create server
  const port = 8081;
  final serv = Sevr();

  final corsPaths = ['/', '/:id'];
  for (var route in corsPaths) {
    serv.options(route, [
      (req, res) {
        setCors(req, res);
        return res.status(200);
      }
    ]);
  }

  serv.get('/projects', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final projects = await coll.find().toList();
      return res.status(200).json({'projects': projects});
    }
  ]);

  serv.get('/projects/name', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final projects = await coll.find(req.query).toList();
      return res.status(200).json({'projects': projects});
    }
  ]);

  serv.get('/users', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final users = await coll2.find().toList();
      return res.status(200).json({'users': users});
    }
  ]);

  serv.get('/transactions', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final transactions = await coll3.find().toList();
      return res.status(200).json({'transactions': transactions});
    }
  ]);

  /*
  serv.post('/', [
    setCors,
    (ServRequest req, ServResponse res) async {
      await coll.save(req.body);
      return res.json(
        await coll.findOne(where.eq('name', req.body['name'])),
      );
    }
  ]);

  serv.delete('/:id', [
    setCors,
    (ServRequest req, ServResponse res) async {
      await coll
          .remove(where.eq('_id', ObjectId.fromHexString(req.params['id'])));
      return res.status(200);
    }
  ]);
  */

  // Listen for connections
  serv.listen(port, callback: () {
    print('Server listening on port: $port');
  });
}

void setCors(ServRequest req, ServResponse res) {
  res.response.headers.add('Access-Control-Allow-Origin', '*');
  res.response.headers.add('Access-Control-Allow-Methods', 'GET, POST, DELETE');
  res.response.headers
      .add('Access-Control-Allow-Headers', 'Origin, Content-Type');
}
