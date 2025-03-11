import 'package:meal_app/app/entities/base_model.dart';

mixin SearchMixin<T extends SearchableModel> {
  List<T> search(List<T> source, String keyword) {
    final sanitizedKeyword = keyword.trim().toLowerCase();
    return source
        .where(
          (element) =>
              sanitizedKeyword.length <=
                      2 // use starts with to search when search text is less than or equal to 2 characters
                  ? element.searchProp().toLowerCase().startsWith(
                    sanitizedKeyword,
                  )
                  // use starts with to search when search text is 3 characters and up
                  : element.searchProp().toLowerCase().contains(
                    sanitizedKeyword,
                  ),
        )
        .toList();
  }
}
