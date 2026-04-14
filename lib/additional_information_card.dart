import 'package:flutter/material.dart';

class AdditionalInformationCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInformationCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 20),
            Text(label),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
