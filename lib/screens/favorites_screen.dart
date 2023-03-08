import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  const FavoritesScreen(this.favouriteMeals);
  void _removeMeal(String mealId) {
    favouriteMeals.removeWhere((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty)
      return Center(
        child: Text('You currently have no favourites'),
      );
    else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            Duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            imageUrl: favouriteMeals[index].imageUrl,
            title: favouriteMeals[index].title,
            affordability: favouriteMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
