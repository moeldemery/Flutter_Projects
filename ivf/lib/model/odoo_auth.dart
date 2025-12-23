import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_api/odoo_user_response.dart';
import 'package:odoo_api/odoo_version.dart';

class OdooAuth {
  //final client = OdooClient('https://demo.odoo.com');

  static String baseUrl = 'http://192.168.1.8:8070';

  static String userName = "administrator@repro.com";
  static String password = "Repro@5060&IVF";
  static String databaseName = "IVF_REPRO";

  static Future<void> odooConnectDB(OdooClient myClient) async {
    try {
      //client = OdooClient('https://demo.odoo.com');
      OdooVersion ver = await myClient.connect();
      print("Connected $ver");
      AuthenticateCallback authInfo =
          await myClient.authenticate(OdooAuth.userName, OdooAuth.password, OdooAuth.databaseName);
      print(authInfo.isSuccess.toString());

    } catch (e) {
      print(e);
    }
  }

  // Future<OdooSession> auth1()  async {
  //   // Subscribe to session changes to store most recent one
  //   var subscription = client.sessionStream.listen(_sessionChanged);
  //   // var loginSubscription = client.loginStream.listen(loginStateChanged);
  //   // var inRequestSubscription = client.inRequestStream.listen(inRequestChanged);.
  //   OdooSession session ;
  //   try {
  //     session = await client.authenticate('odoo', 'admin', 'admin');
  //     print(session);
  //     print('Authenticated');
  //
  //
  //   } on OdooException catch (e) {
  //     // Cleanup on odoo exception
  //     print(e);
  //     subscription.cancel();
  //     client.close();
  //     // exit(-1);
  //   }
  //
  //   return session;
  // }

  // Future<void> read( OdooSession session) async {
  //   final uid = session.userId;
  //   OdooClient res = await client.callKw({
  //     'model': 'res.users',
  //     'method': 'search_read',
  //     'args': [],
  //     'kwargs': {
  //       'context': {'bin_size': true},
  //       'domain': [
  //         ['id', '=', uid]
  //       ],
  //       'fields': [],
  //     },
  //   });
  //   print('\nUser info: \n' + res.toString()) as List<dynamic>;
  // }

  // _sessionChanged(OdooSession sessionId) async {
  //   print('We got new session ID: ' + sessionId.id);
  //   // write to persistent storage
  // }
}
