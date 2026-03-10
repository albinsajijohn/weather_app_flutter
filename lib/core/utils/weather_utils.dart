import '../constants/weather_constants.dart';

class WeatherUtils {

  /// 🌤 Weather Icon
  static String getWeatherIcon(int code) {
    switch (code) {

      case 0:
        return WeatherConstants.clearSkyIcon;

      case 1:
        return WeatherConstants.mainlyClearIcon;
      case 2:
        return WeatherConstants.partlyCloudyIcon;
      case 3:
        return WeatherConstants.overcastIcon;

      case 45:
      case 48:
        return WeatherConstants.fogIcon;

      case 51:
      case 53:
      case 55:
        return WeatherConstants.drizzleIcon;

      case 56:
      case 57:
        return WeatherConstants.rainIcon;

      case 61:
      case 63:
      case 65:
        return WeatherConstants.rainIcon;

      case 66:
      case 67:
        return WeatherConstants.rainIcon;

      case 71:
      case 73:
      case 75:
        return WeatherConstants.snowIcon;

      case 77:
        return WeatherConstants.snowIcon;

      case 80:
      case 81:
      case 82:
        return WeatherConstants.rainIcon;

      case 85:
      case 86:
        return WeatherConstants.snowShowerIcon;

      case 95:
      case 96:
      case 99:
        return WeatherConstants.thunderstormIcon;

      default:
        return WeatherConstants.unknownIcon;
    }
  }

  /// 📄 Weather Description
  static String getWeatherDescription(int code) {
    switch (code) {

      case 0:
        return WeatherConstants.clearSky;

      case 1:
        return WeatherConstants.mainlyClear;
      case 2:
        return WeatherConstants.partlyCloudy;
      case 3:
        return WeatherConstants.overcast;

      case 45:
        return WeatherConstants.fog;
      case 48:
        return WeatherConstants.rimeFog;

      case 51:
        return WeatherConstants.lightDrizzle;
      case 53:
        return WeatherConstants.moderateDrizzle;
      case 55:
        return WeatherConstants.denseDrizzle;

      case 56:
        return WeatherConstants.lightFreezingDrizzle;
      case 57:
        return WeatherConstants.denseFreezingDrizzle;

      case 61:
        return WeatherConstants.slightRain;
      case 63:
        return WeatherConstants.moderateRain;
      case 65:
        return WeatherConstants.heavyRain;

      case 66:
        return WeatherConstants.lightFreezingRain;
      case 67:
        return WeatherConstants.heavyFreezingRain;

      case 71:
        return WeatherConstants.slightSnow;
      case 73:
        return WeatherConstants.moderateSnow;
      case 75:
        return WeatherConstants.heavySnow;

      case 77:
        return WeatherConstants.snowGrains;

      case 80:
        return WeatherConstants.slightRainShowers;
      case 81:
        return WeatherConstants.moderateRainShowers;
      case 82:
        return WeatherConstants.violentRainShowers;

      case 85:
        return WeatherConstants.slightSnowShowers;
      case 86:
        return WeatherConstants.heavySnowShowers;

      case 95:
        return WeatherConstants.thunderstorm;
      case 96:
        return WeatherConstants.thunderstormHail;
      case 99:
        return WeatherConstants.severeThunderstorm;

      default:
        return WeatherConstants.unknownWeather;
    }
  }
}