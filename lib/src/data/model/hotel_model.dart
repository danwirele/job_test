class HotelModel {
  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final String description;
  final List<String> peculiarities;
  const HotelModel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.description,
    required this.peculiarities,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] as int,
      name: json['name'] as String,
      adress: json['adress'] as String,
      minimalPrice: json['minimal_price'] as int,
      priceForIt: json['price_for_it'] as String,
      rating: json['rating'] as int,
      ratingName: json['rating_name'] as String,
      imageUrls: List<String>.from((json['image_urls'] as List<dynamic>)),
      description: json['about_the_hotel']['description'] as String,
      peculiarities: List<String>.from(json['about_the_hotel']['peculiarities'] as List<dynamic>),
    );
  }
}
