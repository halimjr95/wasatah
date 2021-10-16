class ArticleModel {
  int id;
  final String image;
  final String title;
  bool isFavorite;


  ArticleModel({
    required this.id,
    required this.isFavorite,
    required this.image,
    required this.title,
  });

}