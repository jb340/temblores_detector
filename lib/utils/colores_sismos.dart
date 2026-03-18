import 'package:google_maps_flutter/google_maps_flutter.dart';

double obtenerColor(double magnitud) {
  if (magnitud >= 5) {
    return BitmapDescriptor.hueRed;
  }

  if (magnitud >= 3.5) {
    return BitmapDescriptor.hueOrange;
  }

  if (magnitud > 2) {
    return BitmapDescriptor.hueYellow;
  }

  return BitmapDescriptor.hueAzure;
}
