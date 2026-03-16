import 'package:emirano_app/currenty_cenverter.dart';
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
  runApp(MyTestApp());
}

class MyTestApp extends StatelessWidget {
  const MyTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Demo Project',
      theme: ThemeData.light(),
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: MyCurrencyConverter(),
    );
  }
}

class MyCurrencyConverter extends StatelessWidget {
  const MyCurrencyConverter({super.key});

  int result = 0;

  @override
  Widget build(BuildContext context) {
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
                "0",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 55,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
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
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  debugPrint("Button clicked");
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
