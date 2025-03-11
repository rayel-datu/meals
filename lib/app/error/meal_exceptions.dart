abstract class MealException implements Exception {}

class MealNotFoundException extends MealException {}

class EmptyResponseException extends MealException {}

class UnknownMealException extends MealException {}
