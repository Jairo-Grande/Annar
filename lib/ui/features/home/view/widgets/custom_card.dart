import 'package:annar_app/domain/entities/health_entity.dart';
import 'package:annar_app/utils/colors.dart';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Datum data;
  const CustomCard({super.key, required this.data});

  Color _getBackgroundColor() {
    if (data.sistolica != null &&
        (data.sistolica! < 90 || data.sistolica! > 120)) {
      return ColorLight.tertiary;
    }
    if (data.diastolica != null &&
        (data.diastolica! < 60 || data.diastolica! > 80)) {
      return ColorLight.tertiary;
    }
    return ColorLight.secondary;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: _getBackgroundColor(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Fecha: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(data.fecha ?? 'N/A'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Tensión: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        '${data.sistolica ?? 'N/A'} / ${data.diastolica ?? 'N/A'} mm HG'),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
