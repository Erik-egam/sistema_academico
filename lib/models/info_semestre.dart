class InfoSemestre {
  final int id;
  final String nombre;
  final String fechaInicio;
  final String fechaFin;

  InfoSemestre({required this.id, required this.nombre, required this.fechaInicio, required this.fechaFin});

  factory InfoSemestre.fromJson(Map<String, dynamic> json){
    return InfoSemestre(
      id: json["id_semestre"], 
      nombre: json["nombre"], 
      fechaInicio: json["fecha_inicio"], 
      fechaFin: json["fecha_fin"]);

  }
}