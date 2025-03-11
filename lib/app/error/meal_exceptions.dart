abstract class MealException implements Exception {}

class MealNotFoundException extends MealException {}

class EmptyMealsException extends MealException {}

class UnknownMealException extends MealException {}
