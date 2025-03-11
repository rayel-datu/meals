class EnvVars {
  static const String _baseUrl = "BASE_URL";

  static getBaseUrl() => String.fromEnvironment(
    _baseUrl,
    defaultValue: 'www.themealdb.com/api/json/v1',
  );
}
