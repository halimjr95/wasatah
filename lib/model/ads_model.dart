class AdsModel {
  int id;
  final String image;
  final String title;
  final String price;
  bool isFavorite;

  AdsModel({
    required this.id,
    required this.isFavorite ,
    required this.image,
    required this.title,
    required this.price
  });

}