

class InfoNota {
  final String nombre;
  final double nota1;
  final double nota2;
  final double nota3;
  final double notaFinal;
  final int asistencia1;
  final int asistencia2;
  final int asistencia3;

  InfoNota({
    required this.nombre, 
    required this.nota1, 
    required this.nota2, 
    required this.nota3, 
    required this.notaFinal, 
    required this.asistencia1, 
    required this.asistencia2, 
    required this.asistencia3});

  factory InfoNota.fromJson(Map<String, dynamic> json){
    return InfoNota(
      nombre: json["asignatura"], 
      nota1: json["nota1"], 
      nota2: json["nota2"], 
      nota3: json["nota3"], 
      notaFinal: json["nota_final"], 
      asistencia1: json["asistencia1"], 
      asistencia2: json["asistencia2"], 
      asistencia3: json["asistencia3"]);
  }

  
}