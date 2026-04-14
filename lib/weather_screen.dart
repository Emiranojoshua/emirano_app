import 'package:emirano_app/additional_information_card.dart';
import 'package:emirano_app/hourly_forcast_item.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Placeholder(fallbackHeight: 250),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "300F",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Icon(Icons.cloud, size: 64),
                      const Text(
                        "Rain",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Weather Forcast",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: const Row(
            //     spacing: 2,
            //     children: [
            //       HourlyForecastItem(
            //         time: '03:00',
            //         temperature: '301.2',
            //         icon: Icons.cloud,
            //       ),
            //       HourlyForecastItem(
            //         time: '09:00',
            //         temperature: '202.2',
            //         icon: Icons.sunny,
            //       ),
            //       HourlyForecastItem(
            //         time: '05:00',
            //         temperature: '303.2',
            //         icon: Icons.cloud,
            //       ),
            //       HourlyForecastItem(
            //         time: '03:00',
            //         temperature: '301.2',
            //         icon: Icons.cloud,
            //       ),
            //       HourlyForecastItem(
            //         time: '03:00',
            //         temperature: '202.2',
            //         icon: Icons.sunny,
            //       ),
            //       HourlyForecastItem(
            //         time: '03:00',
            //         temperature: '303.2',
            //         icon: Icons.cloud,
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20),
            const Text(
              "Additional Information",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdditionalInformationCard(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "12",
                ),
                AdditionalInformationCard(
                  icon: Icons.air,
                  label: "Wind Speed",
                  value: "54",
                ),
                AdditionalInformationCard(
                  icon: Icons.beach_access,
                  label: "Pressure",
                  value: "94",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
