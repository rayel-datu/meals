class EnvVars {
  static const String _baseUrl = "BASE_URL";

  static String getBaseUrl() => const String.fromEnvironment(
    _baseUrl,
    defaultValue: 'https://www.themealdb.com/api/json/v1',
  );
}
