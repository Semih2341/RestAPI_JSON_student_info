import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> fetchSwaggerData() async {
    final response = await http
        .get(Uri.parse('https://localhost:7106/api/HotelBooking/GetAll'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load Swagger data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swagger Request Example'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchSwaggerData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  snapshot.data!); // Burada veriyi görüntüleyebilirsiniz
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
