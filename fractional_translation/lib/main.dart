import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FractiolTranslation',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Fractional Translation"),
        ),
        body: FractionalTranslation(
          child: Image.network("https://s2.glbimg.com/5IEojOCGN6bgFV5L2K_RKB5dtvk=/e.glbimg.com/og/ed/f/original/2020/03/31/cat-4548812_960_720.jpg"),
          translation: Offset(0.9,0.9),
        ),
      )
    );
  }
}
