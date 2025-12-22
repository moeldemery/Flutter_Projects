import 'package:geolocator/geolocator.dart';

class Location{


  Future<List> getLocation() async
  {
    double long;
    double lat;
    //LocationPermission permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      long = position.longitude;
      lat  = position.latitude;

    }
    catch(e)
    {
      print(e);
    }
    return [long ,lat];
  }
}


