class InfoPrograma {
  final String name;
  final String description;
  final int id;
  
  InfoPrograma({
    required this.id,
    required this.name, 
    required this.description
    });
  factory InfoPrograma.fromJson(Map<String, dynamic> json){
    return InfoPrograma(
    id: json['id'], 
    name: json['nombre'], 
    description: json['descripcion']);
  }
}