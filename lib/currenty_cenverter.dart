import 'package:flutter/material.dart';

class CurrentyCenverter extends StatelessWidget {
  const CurrentyCenverter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '0',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 55,
                color: Colors.white,
              ),
            ),
            TextField(
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
              onPressed: () {
                debugPrint("Button clicked");
              },
              child: Text("click me"),
            ),
          ],
        ),
      ),
    );
  }
}
