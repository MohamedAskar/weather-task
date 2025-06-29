class TemperatureConverter {
  static double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  static String formatTemperature(double temperature, bool isCelsius) {
    final temp = isCelsius ? temperature : celsiusToFahrenheit(temperature);
    final unit = isCelsius ? '°C' : '°F';
    return '${temp.round()}$unit';
  }

  static String formatTemperatureWithoutUnit(
    double temperature,
    bool isCelsius,
  ) {
    final temp = isCelsius ? temperature : celsiusToFahrenheit(temperature);
    return '${temp.round()}°';
  }
}
