import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // passing the initial data to the StateNotifier using the super keyword
  FavoriteMealsNotifier() : super([]);

//!note: we are not allowed to edit an exiting value in memory when using the StateNotifier class
//! so we have to create a new one
  bool toggleMealFavoriteStatus(Meal meal) {
    // the state property is globally available in the StateNotifier

    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      //  .where returns a new list
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
