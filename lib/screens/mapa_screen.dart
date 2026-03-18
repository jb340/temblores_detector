// lib/screens/mapa_screen.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/usgs_service.dart';

class MapaScreen extends StatefulWidget {
  @override
  _MapaScreenState createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Set<Marker> _marcadores = {};
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  double _definirColor(double mag) {
    if (mag >= 5.0) return BitmapDescriptor.hueRed;
    if (mag >= 4.0) return BitmapDescriptor.hueOrange;
    if (mag >= 2.0) return BitmapDescriptor.hueYellow;
    return BitmapDescriptor.hueGreen;
  }

  void _cargarDatos() async {
    try {
      final listaSismos = await ServicioUsgs().obtenerSismos();
      setState(() {
        _marcadores = listaSismos.map((s) {
          return Marker(
            markerId: MarkerId(s.id),
            position: LatLng(s.latitud, s.longitud),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              _definirColor(s.magnitud),
            ),
            infoWindow: InfoWindow(
              title: "Mag: ${s.magnitud}",
              snippet:
                  "Lat: ${s.latitud}, Lon: ${s.longitud}, Alt: ${s.profundidad}km",
            ),
          );
        }).toSet();
        _cargando = false;
      });
    } catch (e) {
      setState(() => _cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sismos Recientes")),
      body: _cargando
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(17.0654, -96.7236), // Centro de Oaxaca
                zoom: 5,
              ),
              markers: _marcadores,
            ),
    );
  }
}
