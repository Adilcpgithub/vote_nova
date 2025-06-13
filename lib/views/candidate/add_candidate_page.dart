import 'package:flutter/material.dart';

class AddCandidatePage extends StatelessWidget {
  const AddCandidatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Add Name'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Text('Upload image'),
            Container(height: 160, width: 160, color: Colors.amberAccent),
            Text('Save', style: TextStyle(fontSize: 25, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
