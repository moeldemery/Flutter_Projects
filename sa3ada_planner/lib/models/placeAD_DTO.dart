class PlaceAD_DTO{

  int id;
  String title;
  String subtitle;
  String description;
  String logoUrl;
  String imageUrl;


  PlaceAD_DTO({this.id, this.title , this.subtitle , this.description , this.logoUrl ,this.imageUrl});

  factory PlaceAD_DTO.fromJson(Map<String, dynamic> json) {
    return PlaceAD_DTO(
        id: json['id'],
        title: json['title'],
        subtitle: json['title'],
        description: json['description'],
        logoUrl: json['logoUrl'],
        imageUrl: json['imageUrl'],
    );
  }
}