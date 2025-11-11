import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_academico/services/api_service.dart';

class CrearSemestreScreen extends StatefulWidget {
  const CrearSemestreScreen({super.key});
  static String name = 'crear_semestre_screen';

  @override
  State<CrearSemestreScreen> createState() => _CrearSemestreScreenState();
}

class _CrearSemestreScreenState extends State<CrearSemestreScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? fechaInicio;
  DateTime? fechaFin;
  bool isLoading = false;

  Future<void> _seleccionarFechaInicio() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: fechaInicio ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() => fechaInicio = picked);
    }
  }

  Future<void> _seleccionarFechaFin() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: fechaFin ?? (fechaInicio ?? now),
      firstDate: fechaInicio ?? DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() => fechaFin = picked);
    }
  }

  /// Convierte la fecha al formato "YYYY-MM-DD"
  String _formatearFecha(DateTime fecha) {
    final year = fecha.year.toString();
    final month = fecha.month.toString().padLeft(2, '0');
    final day = fecha.day.toString().padLeft(2, '0');
    return "$year-$month-$day";
  }

  /// Calcula el semestre basado en la fecha de inicio
  String _calcularNombreSemestre(DateTime fechaInicio) {
    final year = fechaInicio.year;
    final semestre = (fechaInicio.month <= 6) ? 1 : 2;
    return "$year-$semestre";
  }

  Future<void> _crearSemestre() async {
    if (fechaInicio == null || fechaFin == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor selecciona ambas fechas')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final fechaInicioStr = _formatearFecha(fechaInicio!);
      final fechaFinStr = _formatearFecha(fechaFin!);
      final nombreSemestre = _calcularNombreSemestre(fechaInicio!);
      print(nombreSemestre);
      await ApiService().crearSemestre(
        fechaInicioStr,
        fechaFinStr,
        nombreSemestre, // <<--- Aquí se envía el nombre del semestre
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Semestre $nombreSemestre creado exitosamente')),
        );
        context.pop();
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al crear semestre: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Crear Semestre")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                title: const Text('Fecha de inicio'),
                subtitle: Text(
                  fechaInicio != null
                      ? _formatearFecha(fechaInicio!)
                      : 'Seleccionar fecha',
                ),
                trailing: const Icon(Icons.calendar_today_rounded),
                onTap: _seleccionarFechaInicio,
              ),
              const SizedBox(height: 12),
              ListTile(
                title: const Text('Fecha de fin'),
                subtitle: Text(
                  fechaFin != null
                      ? _formatearFecha(fechaFin!)
                      : 'Seleccionar fecha',
                ),
                trailing: const Icon(Icons.calendar_today_rounded),
                onTap: _seleccionarFechaFin,
              ),
              const SizedBox(height: 24),
              if (fechaInicio != null)
                Text(
                  "Semestre detectado: ${_calcularNombreSemestre(fechaInicio!)}",
                  style: TextStyle(
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: isLoading ? null : _crearSemestre,
                icon: const Icon(Icons.save, color: Colors.white),
                label: isLoading
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text(
                        "Guardar",
                        style: TextStyle(color: Colors.white),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
