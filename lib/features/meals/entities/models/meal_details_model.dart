import 'package:meal_app/features/meals/entities/dto/meal_details_dto.dart';

class MealDetailsModel {
  final String? name;
  final String? category;
  final String? originCountry;
  final List<String> instructions;
  final List<MealIngredient> ingredients;
  final String? thumbnail;
  final String? youtubeLink;

  MealDetailsModel(
    this.name,
    this.category,
    this.originCountry,
    this.instructions,
    this.ingredients,
    this.thumbnail,
    this.youtubeLink,
  );

  // Create a model based on the json to a more useable
  factory MealDetailsModel.fromDto(MealDetailsItemDto dto) {
    // create list based on the json response (20 ingredients and 20 measurement)
    final ingredients = [
      MealIngredient(dto.strIngredient1 ?? '', dto.strMeasure1 ?? ''),
      MealIngredient(dto.strIngredient2 ?? '', dto.strMeasure2 ?? ''),
      MealIngredient(dto.strIngredient3 ?? '', dto.strMeasure3 ?? ''),
      MealIngredient(dto.strIngredient4 ?? '', dto.strMeasure4 ?? ''),
      MealIngredient(dto.strIngredient5 ?? '', dto.strMeasure5 ?? ''),
      MealIngredient(dto.strIngredient6 ?? '', dto.strMeasure6 ?? ''),
      MealIngredient(dto.strIngredient7 ?? '', dto.strMeasure7 ?? ''),
      MealIngredient(dto.strIngredient8 ?? '', dto.strMeasure8 ?? ''),
      MealIngredient(dto.strIngredient9 ?? '', dto.strMeasure9 ?? ''),
      MealIngredient(dto.strIngredient10 ?? '', dto.strMeasure10 ?? ''),
      MealIngredient(dto.strIngredient11 ?? '', dto.strMeasure11 ?? ''),
      MealIngredient(dto.strIngredient12 ?? '', dto.strMeasure12 ?? ''),
      MealIngredient(dto.strIngredient13 ?? '', dto.strMeasure13 ?? ''),
      MealIngredient(dto.strIngredient14 ?? '', dto.strMeasure14 ?? ''),
      MealIngredient(dto.strIngredient15 ?? '', dto.strMeasure15 ?? ''),
      MealIngredient(dto.strIngredient16 ?? '', dto.strMeasure16 ?? ''),
      MealIngredient(dto.strIngredient17 ?? '', dto.strMeasure17 ?? ''),
      MealIngredient(dto.strIngredient18 ?? '', dto.strMeasure18 ?? ''),
      MealIngredient(dto.strIngredient19 ?? '', dto.strMeasure19 ?? ''),
      MealIngredient(dto.strIngredient20 ?? '', dto.strMeasure20 ?? ''),
    ];

    // sanitize the ingredients list by removing empty ingredients
    ingredients.removeWhere(
      (element) => element.ingredient.isEmpty || element.measurement.isEmpty,
    );

    // convert the instruction string into a list by spliting the String with [\r\n]
    final instructions = dto.strInstructions?.split('\\r\\n') ?? [];

    return MealDetailsModel(
      dto.strMeal,
      dto.strCategory,
      dto.strArea,
      instructions,
      ingredients,
      dto.strMealThumb,
      dto.strYoutube,
    );
  }
}

class MealIngredient {
  final String ingredient;
  final String measurement;

  MealIngredient(this.ingredient, this.measurement);
}
