extension ListExtension<T extends num> on Iterable<T?> {
  double getAverage() {
    if (isEmpty) return 0;
    final validItems = where((item) => item != null).cast<T>();
    if (validItems.isEmpty) return 0;

    final sum = validItems.reduce((a, b) => (a + b) as T);
    return sum.toDouble() / validItems.length;
  }

  T? getMin() {
    if (isEmpty) return null;
    final validItems = where((item) => item != null).cast<T>();
    if (validItems.isEmpty) return null;

    return validItems.reduce((a, b) => a < b ? a : b);
  }

  T? getMax() {
    if (isEmpty) return null;
    final validItems = where((item) => item != null).cast<T>();
    if (validItems.isEmpty) return null;

    return validItems.reduce((a, b) => a > b ? a : b);
  }
}
