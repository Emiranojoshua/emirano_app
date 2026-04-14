import 'package:emirano_app/emirano.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MySecondApp extends StatelessWidget {
//   const MySecondApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Deadfafafmo Home Page'),
//       ),
//       body: Center(child: Text('Hello, World!')),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   final String? title;
//   const MyApp({super.key, this.title});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.light(),
//       // theme: ThemeData(primarySwatch: Colors.blue),
//       home: CurrentyCenverter(),
//     );
//   }
// }

void main() {
  // runApp(MyTestApp());

  // runApp(WeatherApp());
  runApp(Emirano());
}

class MyTestApp extends StatelessWidget {
  const MyTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Demo Project',
      theme: ThemeData.dark(),
      // theme: ThemeData(primarySwatch: Colors.blue)bbbbbbb,
      home: CurrencyCurrencyApp(),
    );
  }
}

// class MyTestApp extends StatelessWidget {
//   const MyTestApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Demo Project',
//       theme: ThemeData.dark(),
//       // theme: ThemeData(primarySwatch: Colors.blue)bbbbbbb,
//       home: MyCurrencyConverter(),
//     );
//   }
// }

class MyCurrencyConverter extends StatelessWidget {
  const MyCurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    int result = 0;
    debugPrint((result++).toString());
    // double result = 0;
    final TextEditingController controller =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        // backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 55,
                ),
              ),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Please enter the amount",
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // result = double.parse(controller.text) * 20;
                  // debugPrint(result.toString());
                  build(context);
                },
                // style: const ButtonStyle(
                //   elevation: WidgetStatePropertyAll(25),
                //   shape: WidgetStatePropertyAll(
                //     RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(10.0),
                //       ),
                //     ),
                //   ),
                //   backgroundColor: WidgetStatePropertyAll(
                //     Colors.blue,
                //   ),
                //   foregroundColor: WidgetStatePropertyAll(
                //     Colors.blue,
                //   ),
                //   minimumSize: WidgetStatePropertyAll(
                //     Size(double.infinity, 50),
                //   ),
                // ),
                style: TextButton.styleFrom(
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: const Text(
                  "click me",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyCurrencyApp extends StatefulWidget {
  const CurrencyCurrencyApp({super.key});

  @override
  State<CurrencyCurrencyApp> createState() =>
      _CurrencyCurrencyAppState();
}

class _CurrencyCurrencyAppState
    extends State<CurrencyCurrencyApp> {
  double result = 0;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 20;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 55,
                color: Colors.white,
              ),
            ),
            TextField(
              controller: textEditingController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Please enter the amount",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(2 0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: convert,
              child: Text("click me"),
            ),
          ],
        ),
      ),
    );
  }
}
