import 'package:meal_app/app/entities/base_model.dart';

mixin SearchMixin<T extends SearchableModel> {
  List<T> search(List<T> source, String keyword) {
    final sanitizedKeyword = keyword.trim().toLowerCase();
    return source
        .where(
          (element) =>
              element.searchProp().toLowerCase().startsWith(sanitizedKeyword) ||
              element.searchProp().toLowerCase().contains(sanitizedKeyword),
        )
        .toList();
  }
}
