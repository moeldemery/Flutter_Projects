import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const  appId = 'af5336865abac926eebaed006546d79f';
const openWeatherURL ='http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper=NetworkHelper(
        '$openWeatherURL?q=$cityName&appid=$appId&units=metric'
    );
    var weatherData = await networkHelper.getNetworkData();
    return weatherData;
  }

  Future<dynamic> getWeatherForLocation ()async
  {
    Location loca = Location();
    await loca.getLocation();

    double longitudeValue = loca.long;
    double latitudeValue = loca.lat;

    NetworkHelper networkHelper=NetworkHelper(
        '$openWeatherURL?lat=$latitudeValue&lon=$longitudeValue&appid=$appId&units=metric'
    );

    var weatherData = await networkHelper.getNetworkData();
    //print(weatherData);

    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
