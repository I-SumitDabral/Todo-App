extension StringExtensions on String {
  String get intelliTrimOfTitle {
    return length > 10 ? '${substring(0, 10)}...' : this;
  }

  String get intelliTrimOfSubTitle {
    return length > 15 ? '${substring(0, 15)}...' : this;
  }
}
