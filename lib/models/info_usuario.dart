class InfoUsuario {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String rol;
  final bool activo;

  InfoUsuario({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email, 
    // required this.programa, 
    required this.rol,
    required this.activo
    });

  factory InfoUsuario.fromJson(Map<String,dynamic> json){
    return InfoUsuario(
      id: json['id_usuario'],
      name: json['nombre'],
      lastName: json['apellido'],
      email: json['email'],
      // programa: json['id_programa'],
      rol: json['id_rol'],
      activo: json['activo']
      );

  }
}