extension StringExtensions on String {
  String get intelliTrimOfTitle {
    return length > 40 ? '${substring(0, 40)}...' : this;
  }

  String get intelliTrimOfSubTitle {
    return length > 60 ? '${substring(0, 60)}...' : this;
  }

  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get capitalizeFirstofEach => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}
