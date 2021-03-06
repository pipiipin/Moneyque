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
  final coll4 = db.collection('auths');
  final coll5 = db.collection('creditcard');
  final coll6 = db.collection('credits');

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

  serv.get('/users/name', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final users = await coll2.find(req.query).toList();
      return res.status(200).json({'users': users});
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

  serv.get('/creditcard', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final creditcard = await coll5.find(req.query).toList();
      return res.status(200).json({'creditcard': creditcard});
    }
  ]);

  serv.get('/auths', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final auths = await coll4.find().toList();
      return res.status(200).json({'auths': auths});
    }
  ]);

  serv.get('/auths/username', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final auths = await coll4.find(req.query).toList();
      return res.status(200).json({'auths': auths});
    }
  ]);

  serv.get('/credits', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final credits = await coll6.find(req.query).toList();
      return res.status(200).json({'credits': credits});
    }
  ]);

  serv.get('/auths/email', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final auths = await coll4.find(req.query).toList();
      return res.status(200).json({'auths': auths});
    }
  ]);

  serv.post('/auths', [
    setCors,
    (ServRequest req, ServResponse res) async {
      await coll4.save(req.body);
      return res.json(
        await coll4.findOne(where.eq('username', req.body['username'])),
      );
    }
  ]);

  serv.post('/users', [
    setCors,
    (ServRequest req, ServResponse res) async {
      await coll2.save(req.body);
      return res.json(
        await coll2.findOne(where.eq('name', req.body['name'])),
      );
    }
  ]);

  serv.post('/transactions', [
    setCors,
    (ServRequest req, ServResponse res) async {
      print(req.body);
      String o = req.body['owner'];
      String p = req.body['project'];
      ObjectId user = ObjectId.fromHexString(o);
      ObjectId project = ObjectId.fromHexString(p);
      print("user = " + user.toString());
      var data = <String, dynamic>{
        'owner': user,
        'project': project,
        'amount': req.body['amount'],
      };
      await coll3.save(data);
      return res.json(
        await coll3.findOne(where.eq('owner', data['owner'])),
      );
    }
  ]);

  serv.put('/users', [
    setCors,
    (ServRequest req, ServResponse res) async {
      print("request = " + req.body['_id']);
      print(await coll2.find(where.eq('name', req.body['name'])).toList());
      print(req.body['tags']);
      await coll2.update(where.eq('name', req.body['name']),
          ModifierBuilder().set('tags', req.body['tags']));
      print(await coll2.find(where.eq('name', req.body['name'])).toList());
      return res.json(req.body);
    }
  ]);

  serv.put('/projects', [
    setCors,
    (ServRequest req, ServResponse res) async {
      print("request = " + req.body['isBought'].toString());
      String p = req.body['_id'];
      ObjectId project = ObjectId.fromHexString(p);
      print(project);
      print(await coll.find(where.eq('_id', project)).toList());
      await coll.update(where.eq('_id', project),
          ModifierBuilder().set('isBought', req.body['isBought']));
      print(await coll.find(where.eq('_id', project)).toList());
      return res.json(req.body);
    }
  ]);

  // serv.post('/auths/signin', [
  //   setCors,
  //   (ServRequest req, ServResponse res) async {
  //     await coll4.save(req.body);
  //     return res.json(
  //       await coll4.findOne(where.eq('username' ==req.body['username'])),
  //     );
  //   }
  // ]);

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
  res.response.headers
      .add('Access-Control-Allow-Methods', 'GET, POST, DELETE, PUT');
  res.response.headers
      .add('Access-Control-Allow-Headers', 'Origin, Content-Type');
}
