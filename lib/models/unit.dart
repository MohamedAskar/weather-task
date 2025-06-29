enum Unit {
  metric(symbol: '°C'),
  imperial(symbol: '°F');

  const Unit({required this.symbol});

  final String symbol;
}
