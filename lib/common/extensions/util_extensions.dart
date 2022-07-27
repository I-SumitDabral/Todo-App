extension GeneralUtilsObjectExtension on Object {
  // ignore: unnecessary_null_comparison
  bool get isNull => null == this;
  // ignore: unnecessary_null_comparison
  bool get isNotNull => null != this;

  bool get isNullOrEmpty =>
      isNull || _isStringObjectEmpty || _isIterableObjectEmpty;

  bool get isNullEmptyOrFalse =>
      isNull ||
      _isStringObjectEmpty ||
      _isIterableObjectEmpty ||
      _isBoolObjectFalse;

  bool get isNullEmptyFalseOrZero =>
      isNull ||
      _isStringObjectEmpty ||
      _isIterableObjectEmpty ||
      _isBoolObjectFalse;
  bool get _isStringObjectEmpty =>
      (this is String) && (this as String).isEmpty || false;
  bool get _isIterableObjectEmpty => (this as Iterable).isEmpty || false;
  bool get _isBoolObjectFalse => (this as bool) || false;
}

