import 'package:flutter/material.dart';
import 'package:vote_nova/core/utility/media_query.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Page"),
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: deviceHeight(context),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Result Page ')],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
