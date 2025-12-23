
class TopPlaceAD_DTO{

  int id;
  String title;
  String subtitle;
  String description;
  String logoUrl;
  String imageUrl;


  TopPlaceAD_DTO({this.id, this.title , this.subtitle , this.description , this.logoUrl ,this.imageUrl});

  factory TopPlaceAD_DTO.fromJson(Map<String, dynamic> json) {
    return TopPlaceAD_DTO(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      logoUrl: json['logoUrl'],
      imageUrl: json['imageUrl'],
    );
  }
}