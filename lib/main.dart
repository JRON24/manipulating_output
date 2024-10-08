import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment: Create a Pyramid, Inverted Pyramid, and Diamond', style: TextStyle(fontSize: 13)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Center(child: Text('Pyramid:', style: TextStyle(fontSize: 20))),
              SizedBox(height: 10),
              ShapeDisplayWidget(shape: generatePyramid(5)),
              SizedBox(height: 30),
              Center(child: Text('Inverted Pyramid:', style: TextStyle(fontSize: 20))),
              SizedBox(height: 10),
              ShapeDisplayWidget(shape: generateInvertedPyramid(5)),
              SizedBox(height: 30),
              Center(child: Text('Diamond:', style: TextStyle(fontSize: 20))),
              SizedBox(height: 10),
              ShapeDisplayWidget(shape: generateDiamond(5)),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget to display the shape in the app
class ShapeDisplayWidget extends StatelessWidget {
  final List<String> shape;
  ShapeDisplayWidget({required this.shape});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: shape.map((line) => Text(line, style: TextStyle(fontSize: 16, fontFamily: 'monospace'))).toList(),
    );
  }
}

// Generate Pyramid pattern
List<String> generatePyramid(int rows) {
  List<String> lines = [];
  for (int i = 0; i < rows; i++) {
    String line = ' ' * (rows - i - 1) + '* ' * (i + 1);
    lines.add(line.trimRight());
  }
  return lines;
}

// Generate Inverted Pyramid pattern
List<String> generateInvertedPyramid(int rows) {
  List<String> lines = [];
  for (int i = rows; i > 0; i--) {
    String line = ' ' * (rows - i) + '* ' * i;
    lines.add(line.trimRight());
  }
  return lines;
}

// Generate Diamond pattern
List<String> generateDiamond(int rows) {
  List<String> lines = [];
  lines.addAll(generatePyramid(rows));
  for (int i = rows - 1; i > 0; i--) {
    String line = ' ' * (rows - i) + '* ' * i;
    lines.add(line.trimRight());
  }
  return lines;
}
