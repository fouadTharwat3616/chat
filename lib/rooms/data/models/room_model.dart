class RoomModel {
  String id;
  final String name;
  final String description;
  final String categoryId;

   RoomModel(
      { this.id='',
      required this.name,
      required this.description,
      required this.categoryId});

  RoomModel.fromJson(Map<String,dynamic> json):this(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    categoryId: json['categoryId'],
  );

  Map<String,dynamic> toJSon()=>{
    'id':id,
    'name':name,
    'description':description,
    'categoryId':categoryId,
  };
}
