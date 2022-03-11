import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Column(
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                cursorColor: Colors.blueGrey[800],
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter City Name',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black87,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  icon: Icon(
                    Icons.location_on,
                    size: 50,
                    color: Colors.black87,
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            )),
            ElevatedButton(
                onPressed: () {
                  if (cityName.isEmpty) {
                    cityName = 'Moscow';
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context, cityName);
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) =>
                        Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5))),
                child:
                    const Text('Get Weather', style: TextStyle(fontSize: 22))),
          ],
        )),
      ),
    );
  }
}
