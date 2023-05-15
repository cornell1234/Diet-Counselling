String getMeal(String day, String mealType, String bmi) {
  // Parse the JSON data into a list of objects
  List<Map<String, dynamic>> jsonData = [
  {
    "BMI": "18",
    "data": [
      {
        "day": "1",
        "Breakfast": "2 Scrambled eggs, bread with avocado, and apple",
        "FirstSnack": "1 apple, 1/4 cup of groundnuts",
        "Lunch": "2 lamps of small size mgaiwa nsima, 2 pieces of chicken, 2 slices of tomato,1 slice of cheese, 2 carrots",
        "SecondSnack": "1 cup of plain yogurt, half cup of strawberries",
        "Dinner": "2 medium size sweet potato, vegetables(broccoli, carrots and peppers,), 1 banana",
        "Extra": "pineapple chunks"
      },
      {
        "day": "2",
        "Breakfast": "Oatmeal/pumpkin, banana, toasted bread",
        "FirstSnack": "1 apple, peanut butter 2 spoons",
        "Lunch": "2 lamps small size of mgaiwa nsima/spaghetti, fish/eggs, 2 slices of tomato, black beans",
        "SecondSnack": " 2 medium pineapple slices",
        "Dinner": "brown rice, vegetables(broccoli, carrots and peppers,), beef stir-fry",
        "Extra": "small bowl plums/mangoes"
      },
      {
        "day": "3",
        "Breakfast": "Oatmeal/ sweetpotatoes, yogurt with honey, berries /apples/ oranges",
        "FirstSnack": "Snack: boiled egg",
        "Lunch": "2 slices of bread, 2 slices of tomato, 1 avocado",
        "SecondSnack": "2 banana and 1 spoon peanut butter",
        "Dinner": "roasted chicken, sweet potato and green beans",
        "Extra": "small bowl sliced oranges/4 grapes"
      },
      {
        "day": "4",
        "Breakfast": "pumpkins/waffles, peanut butter and banana",
        "FirstSnack": "boiled egg/ carrots",
        "Lunch": "potato salad, medium size salad",
        "SecondSnack": "plain yogurt/ oranges/ mangoes/ carrots",
        "Dinner": "roasted chicken, brown rice and green beans",
        "Extra": "small bowl sliced peaches/ mangoes"
      },
      {
        "day": "5",
        "Breakfast": "scrambled eggs with salad and 1 slice of bread",
        "FirstSnack": "1 apple/oranges",
        "Lunch": "Grilled chicken add vinegar, 1 avocado, 1 roasted corn",
        "SecondSnack": "2 bananas",
        "Dinner": "beef meatballs/ dry fish, pasta/nsima and green beans",
        "Extra": "small bowl oranges/ 1 cucumber"
      },
      {
        "day": "6",
        "Breakfast": "avocado/banana smoothie, peanut butter, milk  sweetpotatoes",
        "FirstSnack": "boiled egg/handfull groundnuts",
        "Lunch": "1 corn, salad, roasted chicken",
        "SecondSnack": "plain yogurt, carrots",
        "Dinner": "roasted chicken, sweet potato and vegetables",
        "Extra": "small bowl of sliced mangoes"
      },
      {
        "day": "7",
        "Breakfast": "Avocado bread, sliced tomatoes, apples/ watermellon",
        "FirstSnack": "Carrots",
        "Lunch": "1 corn, medium pumpkin portion and salad",
        "SecondSnack": "2 spoon peanut butter",
        "Dinner": " potato salad/ baked scones/ sliced tomatoes",
        "Extra": "small bowl of slices peaches/oranges"
      }
    ]
  },
  {
    "BMI": "25",
    "data": [
      {
        "day": "1",
        "Breakfast": "Oatmeal with fresh berries and chopped nuts",
        "FirstSnack": "Apple slices with almond butter",
        "Lunch": "Grilled chicken salad with mixed greens, tomatoes, and cucumber",
        "SecondSnack": "carrots",
        "Dinner": "baked salmon with therere and 1 lamp of mgaiwa nsima",
        "Extra": "small bowl of slices peaches"
      },
      {
        "day": "2",
        "Breakfast": "Scrambled eggs with spinach and whole wheat toast",
        "FirstSnack": "Plain yogurt with honey",
        "Lunch": "Chicken sandwich on whole grain bread with avocado and tomato",
        "SecondSnack": "1 cup of plain yogurt, 4 strawberries",
        "Dinner": "2 medium size sweet potato, bowl of salad",
        "Extra": "small bowl of slices oranges"
      },
      {
        "day": "3",
        "Breakfast": "2 Scrambled eggs, bread with avocado, and apple",
        "FirstSnack": "cucumber slices",
        "Lunch": "2 lamps small size mgaiwa nsima, dry fish, vegetables, 2 carrots",
        "SecondSnack": "1 spoon of peanut butter",
        "Dinner": "Beef stir-fry with brown rice and mixed vegetables",
        "Extra": "small bowl of slices mangoes"
      },
      {
        "day": "4",
        "Breakfast": "banana smoothie",
        "FirstSnack": "boiled egg",
        "Lunch": "1 portion of pumpkins, salad bowl, apple slices",
        "SecondSnack": "small bowl berries",
        "Dinner": "spaghetti, beef stir-fry, vegetables(broccoli, carrots and peppers,)",
        "Extra": "1 banana"
      },
      {
        "day": "5",
        "Breakfast": "Whole grain waffles with fresh berries and Greek yogurt",
        "FirstSnack": "sliced apples",
        "Lunch": "Grilled chicken, corn, mixed greens",
        "SecondSnack": "Pear slices",
        "Dinner": "Baked salmon with roasted broccoli and sweet potato",
        "Extra": "small bowl of slices peaches"
      },
      {
        "day": "6",
        "Breakfast": "Avocado toast with egg and tomato",
        "FirstSnack": "pineapple chunks",
        "Lunch": "2 lamps small size nsima, grilled steak with therere",
        "SecondSnack": "Mixed nuts",
        "Dinner": "chicken sandwich with cheese, slices of tomato and salad bowl",
        "Extra": "small bowl of slices cucumber"
      },
      {
        "day": "7",
        "Breakfast": "Smoothie bowl with berries and peanut butter",
        "FirstSnack": "1/4 cup of groundnuts",
        "Lunch": "2 small sized baked scones with avocado",
        "SecondSnack": "apple slices",
        "Dinner": "2 small sized sweet potatoes and a bowl of sliced apples",
        "Extra": "small bowl of pineapples chunks"
      }
    ]
},
{
    "BMI": "30",
    "data": [
        {"day": "1",
        "Breakfast": "plain yogurt with berries and nuts",
        "FirstSnack": "2 carrot",
        "Lunch": "Grilled chicken salad with mixed greens, cucumber,tomato and 1 corn",
        "SecondSnack": "apple slices",
        "Dinner": "1 lamp of mgaiwa nsima with therere and dry fish",
        "Extra": "small bowl of 3 grapes"
    },
      {
      "day": "2",
        "Breakfast": "Oatmeal with fresh berries and chopped nuts",
        "FirstSnack": "Plain yogurt with honey",
        "Lunch": "chicken sandwich with salad bowl",
        "SecondSnack": "pineapple chunks",
        "Dinner": "2 small sized sweet potatoes and a bowl of sliced apples",
        "Extra": "small bowl cucumber"
      },
      {
      "day": "3",
        "Breakfast": "Smoothie bowl with berries and peanut butter",
        "FirstSnack": "boiled egg",
        "Lunch": "chicken and vegetable soup with whole grain crackers",
        "SecondSnack": "apple slices",
        "Dinner": "brown rice with fresh fish and vegetables",
        "Extra": "small bowl of pineapples mangoes"
      },
      {
      "day": "4",
        "Breakfast": "Avocado toast with egg and tomato",
        "FirstSnack": "small bowl of cucumber",
        "Lunch": "spaghetti, Grilled chicken Caesar salad with mixed greens",
        "SecondSnack": "mangoe slices",
        "Dinner": "2 small sized sweet potatoes and a bowl of sliced apples",
        "Extra": "small bowl of berries"
      },
      {
      "day": "5",
        "Breakfast": "waffles with berries and plain yogurt/ tea with avocado bread",
        "FirstSnack": "2 small carrots",
        "Lunch": "beef stir-fry with brown rice and mixed vegetables",
        "SecondSnack": "pineapple chunks",
        "Dinner": "2 small sized pumpkin portions and a bowl of sliced oranges",
        "Extra": "small bowl of cucumbers"
      },
      {
      "day": "6",
        "Breakfast": "Smoothie bowl with mixed berries and almond butter",
        "FirstSnack": "1/4 cup of groundnuts",
        "Lunch": "2 small sized mgaiwa nsima with vegetables and dry fish",
        "SecondSnack": "mixed nuts",
        "Dinner": "2 small sized sweet potatoes and a bowl of sliced apples",
        "Extra": "1 banana"
      },
      {
      "day": "7",
        "Breakfast": "scrambled eggs with bread and tea",
        "FirstSnack": "plain yogurt",
        "Lunch": "grilled chicken 1 corn and avocado",
        "SecondSnack": "roasted pumpkin seeds",
        "Dinner": "2 small sweet potatoes and bowl of salad",
        "Extra": "sliced apples"
      } 
    ]
},
{
    "BMI": "40",
    "data": [
        {"day": "1",
        "Breakfast": "Oatmeal eith berries and nuts",
        "FirstSnack": "1 spoon of peanut butter",
        "Lunch": "Grilled chicken salad with mixed greens, tomato, and 1 corn",
        "SecondSnack": "small popcorn bowl",
        "Dinner": "1 lamp of mgaiwa nsima with therere and dry fish",
        "Extra": "small bowl of 3 grapes"
        },
        {
        "day": "2",
        "Breakfast": "toasted bread and tea",
        "FirstSnack": "boiled egg",
        "Lunch": "mgaiwa nsima with there and beef stir-fry with mixed vegetables",
        "SecondSnack": "roasted pumpkin seeds",
        "Dinner": "Grilled steak with sweet potatoes",
        "Extra": "sliced apples"
        },
        {
        "day": "3",
        "Breakfast": "Smoothie bowl with berries and peanut butter",
        "FirstSnack": "2 small carrots",
        "Lunch": "1 portion of medium size pumpkin and slad bowl",
        "SecondSnack": "pineapple chunks",
        "Dinner": "grilled fresh fish with brown rice and mixed vegetables",
        "Extra": "small bowl of cucumbers"
        },
        {
        "day": "4",
        "reakfast": "Avocado toast with egg and tomato",
        "FirstSnack": "2 small carrots",
        "Lunch": "small sized lamp of mgaiwa nsima with there and dry fish",
        "SecondSnack": "pear slices",
        "Dinner": "baked chicken with corn and broccoli",
        "Extra": "pineapple chunks"
        },
        {
        "day": "5",
          "Breakfast": "sweet potatoes and avocado",
          "FirstSnack": "plain yogurt with nuts",
          "Lunch": "Grilled chicken stir-fry with vegetables and brown rice",
          "SecondSnack": "small poporn bowl",
          "Dinner": "Beef chili with mixed vegetables and brown rice",
          "Extra": "small bowl of oranges"
        },
        {
        "day": "6",
          "Breakfast": "scrumbled eggs with wheat toast",
          "FirstSnack": "apple slices",
          "Lunch": "2 small lamps of mgaiwa nsima with vegetables and fresh baked ",
          "SecondSnack": "mixed nuts",
          "Dinner": "fishsalad with 1 medium size corn",
          "Extra": "small bowl of oranges"
        },
        {
        "day": "7",
          "Breakfast": "Plain yogurt with berries and nuts",
          "FirstSnack": "boiled egg",
          "Lunch": "mixed greens with avocado and sweet potatoes",
          "SecondSnack": "roasted pumpkin seeds",
          "Dinner": "baked chicken with vegetables and brown rice",
          "Extra": "small bowl of cucumbers"
        }
    ]
  }
]
;

  // Find the corresponding day object in the JSON data
  var dayData = jsonData
      .map((item) => item['data'])
      .expand((i) => i)
      .firstWhere((data) => data['day'] == day, orElse: () => null);

  if (dayData != null) {
    // Get the meal for the specified mealType
    var meal = dayData[mealType];

    if (meal != null) {
      return meal.toString();
    }
  }

  // Return an empty string if the meal is not found
  return 'Diet Plan will start tomorrow';
}
