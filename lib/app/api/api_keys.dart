class ApiKeys {
  const ApiKeys._();

  static const postHog = String.fromEnvironment('POST_HOG_API_KEY');
}
