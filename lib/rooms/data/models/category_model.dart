class CategoryModel {
  final String id;
  final String name;
  final String imageName;
  CategoryModel(
      {required this.id, required this.name, required this.imageName});

  static List<CategoryModel> categories = [
    CategoryModel(id: 'sports', name: 'Sport', imageName: 'sports'),
    CategoryModel(id: 'movies', name: 'Movies', imageName: 'movies'),
    CategoryModel(id: 'music', name: 'Music', imageName: 'music'),
  ];

}
