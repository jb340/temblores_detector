// lib/services/usgs_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sismo_model.dart'; // Importa tu modelo

class ServicioUsgs {
  static const String _url =
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  Future<List<Sismo>> obtenerSismos() async {
    try {
      final respuesta = await http.get(Uri.parse(_url));
      if (respuesta.statusCode == 200) {
        final data = json.decode(respuesta.body);
        final List features = data['features'];
        return features.map((item) => Sismo.fromJson(item)).toList();
      } else {
        throw Exception('Error al conectar con USGS');
      }
    } catch (e) {
      throw Exception('Error de red: $e');
    }
  }
}
