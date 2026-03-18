// lib/models/sismo_model.dart
class Sismo {
  final String id;
  final double magnitud;
  final String lugar;
  final double latitud;
  final double longitud;
  final double profundidad;

  Sismo({
    required this.id,
    required this.magnitud,
    required this.lugar,
    required this.latitud,
    required this.longitud,
    required this.profundidad,
  });

  factory Sismo.fromJson(Map<String, dynamic> json) {
    final props = json['properties'];
    final geom = json['geometry'];
    return Sismo(
      id: json['id'] ?? '',
      magnitud: (props['mag'] as num).toDouble(),
      lugar: props['place'] ?? 'Sin ubicación',
      longitud: (geom['coordinates'][0] as num).toDouble(),
      latitud: (geom['coordinates'][1] as num).toDouble(),
      profundidad: (geom['coordinates'][2] as num).toDouble(),
    );
  }
}
