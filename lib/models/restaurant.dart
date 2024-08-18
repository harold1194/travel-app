import 'dart:convert';

import 'package:http/http.dart' as http;

class Restaurant {
  String? restaurantId;
  String? name;
  double? averageRating;
  int? userReviewCount;
  String? currentOpenStatusCategory;
  String? currentOpenStatusText;
  String? priceTag;
  String? heroImage;

  Restaurant({
    this.restaurantId,
    this.name,
    this.averageRating,
    this.userReviewCount,
    this.currentOpenStatusCategory,
    this.currentOpenStatusText,
    this.priceTag,
    this.heroImage,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantsId'] ?? '';
    name = json['name'] ?? 'Unknown';
    averageRating = (json['averageRating'] as num?)?.toDouble() ?? 0.0;
    userReviewCount = json['userReviewCount'] as int? ?? 0;
    currentOpenStatusCategory = json['currentOpenStatusCategory'] ?? 'Unknown';
    currentOpenStatusText = json['currentOpenStatusText'] ?? 'Unknown';
    priceTag = json['priceTag'] ?? 'N/A';
    heroImage = json['heroImgUrl'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurantId'] = restaurantId;
    data['name'] = name;
    data['averageRating'] = averageRating;
    data['userReviewCount'] = userReviewCount;
    data['currentOpenStatusCategory'] = currentOpenStatusCategory;
    data['currentOpenStatusText'] = currentOpenStatusText;
    data['priceTag'] = priceTag;
    data['heroImage'] = heroImage;
    return data;
  }
}


Future<Restaurant> fetchRestaurant() async {
  final res = await http.get(
    Uri.parse(
      'https://tripadvisor16.p.rapidapi.com/api/v1/restaurant/searchRestaurants?locationId=304554',
    ),
    headers: {
      'X-RapidAPI-Key': 'ffa8697a48msh87023e88cef66cep125c3ajsn3957e62a6f24',
      'X-RapidAPI-Host': 'tripadvisor16.p.rapidapi.com',
    },
  );

  if (res.statusCode == 200) {
    print('Response body: ${res.body}'); // Debugging

    Map<String, dynamic> data = json.decode(res.body);

    // Debug: Print the structure of the data
    print('Parsed JSON: $data');

    // Check if 'data' contains the expected fields
    if (data['data'] != null &&
        data['data']['data'] != null &&
        data['data']['data'].isNotEmpty) {
      var restaurantData =
          data['data']['data'][0]; // Get the first restaurant item
      print('Restaurant data: $restaurantData'); // Debugging
      return Restaurant.fromJson(restaurantData);
    } else {
      throw Exception('No restaurant data available');
    }
  } else {
    throw Exception(
        'Failed to load restaurant. Status code: ${res.statusCode}');
  }
}

