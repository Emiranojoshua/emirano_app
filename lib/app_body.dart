import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:emirano_app/http';
import 'package:http/http.dart' as http;

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  late Future<Map<String, dynamic>> _weatherDataFuture;

  double temp = 0;

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      // await Future.delayed(Duration(seconds: 5));
      final result = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=Lagos&APPID=$includeAPIKEY',
        ),
      );

      final data = jsonDecode(result.body);

      if (data['cod'] != '200') {
        throw "An unexpected error occurred";
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    _weatherDataFuture = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New App Name"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("refreshing");
              setState(() {
                _weatherDataFuture = getCurrentWeather();
              });
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              debugPrint("send output");
            },
            icon: Icon(Icons.ios_share),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _weatherDataFuture,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState ==
              ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (asyncSnapshot.hasError) {
            return Center(child: Text("An error occurred"));
          }

          if (!asyncSnapshot.hasData) {
            return Center(child: Text("No data found"));
          }

          final data = asyncSnapshot.data!;
          final weatherData = data['list'][0];
          temp = weatherData['main']['temp'];
          temp = (temp - 273.15) * 9 / 5 + 32;
          temp = double.parse(temp.toStringAsFixed(2));
          final sky = weatherData['weather'][0]['main'];
          final pressure = weatherData['main']['pressure'];
          final windSpeed = weatherData['wind']['speed'];
          final humidity = weatherData['main']['humidity'];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Placeholder(fallbackHeight: 300),
                SizedBox(
                  width: double.infinity,
                  // height: 200,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(16),
                      child: Column(
                        // mainAxisAlignment:
                        // MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$temp F",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Icon(
                            sky == "Clouds" || sky == "Rain"
                                ? Icons.cloud
                                : Icons.sunny,
                            size: 64,
                          ),
                          Text(
                            "$sky",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                const Text(
                  "Hourly Forecast",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),

                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder:
                        (BuildContext context, int index) {
                          final hourlyForecast =
                              data['list'][index + 1];
                          final String hourlysky =
                              hourlyForecast['weather'][0]['main'];
                          return WeatherCards(
                            time: hourlyForecast['dt_txt']
                                .toString()
                                .substring(11, 16),
                            temperature:
                                hourlyForecast['main']['temp']
                                    .toString(),
                            icon:
                                hourlysky == "Clouds" ||
                                    hourlysky == "Rain"
                                ? Icons.cloud
                                : Icons.sunny,
                          );
                        },
                  ),
                ),
                // SizedBox(
                //   width: double.infinity,
                //   child: SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //       spacing: 2,
                //       children: [
                //         for (int i = 1; i < 39; i++)
                //           WeatherCards(
                //             time: data['list'][i + 1]['dt_txt']
                //                 .toString()
                //                 .substring(11, 16),
                //             temperature:
                //                 data['list'][i +
                //                         1]['main']['temp']
                //                     .toString(),
                //             icon:
                //                 data['list'][i +
                //                             1]['weather'][0]['main'] ==
                //                         "Clouds" ||
                //                     data['list'][i +
                //                             1]['weather'][0]['main'] ==
                //                         "Rain"
                //                 ? Icons.cloud
                //                 : Icons.sunny,
                //           ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 20),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    AdditionalWidgetCards(
                      label: "Humidity",
                      value: humidity.toString(),
                      icon: Icons.water_drop,
                    ),
                    AdditionalWidgetCards(
                      label: "Wind Speed",
                      value: "$windSpeed m/s",
                      icon: Icons.air,
                    ),
                    AdditionalWidgetCards(
                      label: "Pressure",
                      value: pressure.toString(),
                      icon: Icons.speed,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AdditionalWidgetCards extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const AdditionalWidgetCards({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
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
    );
  }
}

class WeatherCards extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const WeatherCards({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            children: [
              Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(
                temperature,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
