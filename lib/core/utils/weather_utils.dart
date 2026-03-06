class WeatherUtils {

  /// 🌤 Weather Icon
  static String getWeatherIcon(int code) {
    switch (code) {

      case 0:
        return "☀️"; // Clear sky

      case 1:
        return "🌤"; // Mainly clear

      case 2:
        return "⛅"; // Partly cloudy

      case 3:
        return "☁️"; // Overcast

      case 45:
      case 48:
        return "🌫"; // Fog

      case 51:
      case 53:
      case 55:
        return "🌦"; // Drizzle

      case 61:
      case 63:
      case 65:
        return "🌧"; // Rain

      case 71:
      case 73:
      case 75:
        return "❄️"; // Snow

      case 95:
      case 96:
      case 99:
        return "⛈"; // Thunderstorm

      default:
        return "🌍"; // Unknown
    }
  }

  /// 📄 Weather Description
  static String getWeatherDescription(int code) {
    switch (code) {

      case 0:
        return "Clear Sky";

      case 1:
        return "Mainly Clear";

      case 2:
        return "Partly Cloudy";

      case 3:
        return "Overcast";

      case 45:
        return "Fog";

      case 48:
        return "Depositing Rime Fog";

      case 51:
        return "Light Drizzle";

      case 53:
        return "Moderate Drizzle";

      case 55:
        return "Dense Drizzle";

      case 61:
        return "Slight Rain";

      case 63:
        return "Moderate Rain";

      case 65:
        return "Heavy Rain";

      case 71:
        return "Slight Snow";

      case 73:
        return "Moderate Snow";

      case 75:
        return "Heavy Snow";

      case 95:
        return "Thunderstorm";

      case 96:
        return "Thunderstorm with Hail";

      case 99:
        return "Severe Thunderstorm";

      default:
        return "Unknown Weather";
    }
  }
}