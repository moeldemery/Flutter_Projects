
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

  NetworkHelper(this.url);

  final String url;

  Future getNetworkData()async{


      http.Response request = await http.get(url);
      if (request.statusCode == 200)
      {
        String data = request.body;
        //print(request.statusCode);
        //print(request.body);
        return jsonDecode(data);
        //return data;
      }
      else{
        print(request.statusCode);
      }


  }

}


