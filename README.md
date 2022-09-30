
# Flutter stuff here. 
This repository will store important notes and projects developed with Flutter technology for frnndog-suav interest.

## Important observations
- Instalation tutorial -> https://www.youtube.com/watch?v=CD1Y2DmL5JM&t=3708s&ab_channel=FlutterMapp
- The main file is located in *D:\your_project_name\lib\main.dart*.
>*Basic main.dart file*:
>```dart
>import 'package:flutter/material.dart';
>
>void main() {
>  runApp(const MyApp());
>}
>
>class MyApp extends StatelessWidget {
>  const MyApp({super.key});
>
>  @override
>  Widget build(BuildContext context) {
>    return MaterialApp(
>      title: 'Flutter Demo',
>     theme: ThemeData(
>       primarySwatch: Colors.blue,
>      ),
>      home: Container(
>        color: Colors.deepPurple,
>      ),
>    );
>  }
>}
>```
