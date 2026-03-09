class WeatherUtils {

  /// 🌤 Weather Icon
  static String getWeatherIcon(int code) {
    switch (code) {

      /// Clear sky
      case 0:
        return "☀️";

      /// Mainly clear / Partly cloudy / Overcast
      case 1:
        return "🌤";
      case 2:
        return "⛅";
      case 3:
        return "☁️";

      /// Fog
      case 45:
      case 48:
        return "🌫";

      /// Drizzle
      case 51:
      case 53:
      case 55:
        return "🌦";

      /// Freezing drizzle
      case 56:
      case 57:
        return "🌧";

      /// Rain
      case 61:
      case 63:
      case 65:
        return "🌧";

      /// Freezing rain
      case 66:
      case 67:
        return "🌧";

      /// Snow fall
      case 71:
      case 73:
      case 75:
        return "❄️";

      /// Snow grains
      case 77:
        return "❄️";

      /// Rain showers
      case 80:
      case 81:
      case 82:
        return "🌧";

      /// Snow showers
      case 85:
      case 86:
        return "🌨";

      /// Thunderstorm
      case 95:
      case 96:
      case 99:
        return "⛈";

      default:
        return "🌍";
    }
  }

  /// 📄 Weather Description
  static String getWeatherDescription(int code) {
    switch (code) {

      /// Clear sky
      case 0:
        return "Clear Sky";

      /// Mainly clear / Partly cloudy / Overcast
      case 1:
        return "Mainly Clear";
      case 2:
        return "Partly Cloudy";
      case 3:
        return "Overcast";

      /// Fog
      case 45:
        return "Fog";
      case 48:
        return "Depositing Rime Fog";

      /// Drizzle
      case 51:
        return "Light Drizzle";
      case 53:
        return "Moderate Drizzle";
      case 55:
        return "Dense Drizzle";

      /// Freezing drizzle
      case 56:
        return "Light Freezing Drizzle";
      case 57:
        return "Dense Freezing Drizzle";

      /// Rain
      case 61:
        return "Slight Rain";
      case 63:
        return "Moderate Rain";
      case 65:
        return "Heavy Rain";

      /// Freezing rain
      case 66:
        return "Light Freezing Rain";
      case 67:
        return "Heavy Freezing Rain";

      /// Snow fall
      case 71:
        return "Slight Snow Fall";
      case 73:
        return "Moderate Snow Fall";
      case 75:
        return "Heavy Snow Fall";

      /// Snow grains
      case 77:
        return "Snow Grains";

      /// Rain showers
      case 80:
        return "Slight Rain Showers";
      case 81:
        return "Moderate Rain Showers";
      case 82:
        return "Violent Rain Showers";

      /// Snow showers
      case 85:
        return "Slight Snow Showers";
      case 86:
        return "Heavy Snow Showers";

      /// Thunderstorm
      case 95:
        return "Thunderstorm";

      /// Thunderstorm with hail
      case 96:
        return "Thunderstorm with Slight Hail";
      case 99:
        return "Thunderstorm with Heavy Hail";

      default:
        return "Unknown Weather";
    }
  }
}