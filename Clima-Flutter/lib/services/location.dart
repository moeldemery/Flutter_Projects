import 'package:geolocator/geolocator.dart';

class Location{

  double long;
  double lat;

  Future<void> getLocation() async
  {
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
  }
}


