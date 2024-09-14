class Wpmodel{
  String imgurl;
  String photographer;
  String avg_color;
  String description;

  Wpmodel({
    required this.imgurl,
    required this.photographer,
    required this.avg_color,
    required this.description
  });
  factory Wpmodel.fromMap(Map<String,dynamic>map){
    return Wpmodel(
        imgurl: map["src"]["portrait"],
        photographer:map["photographer"],
        avg_color: map["avg_color"],
        description: map["alt"]);



  }
}