class InfoAsignatura {
  final int id;
  final String nombre;
  final String codigo;
  final int creditos;
  final int idPrograma;

  InfoAsignatura({
    required this.id,
    required this.nombre,
    required this.codigo,
    required this.creditos,
    required this.idPrograma,
  });

  factory InfoAsignatura.fromJson(Map<String, dynamic> json){
    return InfoAsignatura(
    id: json["id_asignatura"], 
    nombre: json["nombre"], 
    codigo: json["codigo"], 
    creditos: json["creditos"], 
    idPrograma: json["id_programa"]);
  }
}
