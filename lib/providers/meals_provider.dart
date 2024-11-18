import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/date/dummy_date.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
