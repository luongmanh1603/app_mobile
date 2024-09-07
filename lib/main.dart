import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: Center(
          child: MyApp(false),
        ),
      ),
      ),
    debugShowCheckedModeBanner: false,
  ));
}
class MyApp extends StatelessWidget {
  late final bool loading;
  
  MyApp(this.loading);
 @override
 Widget build(BuildContext context) {
  //  if (loading) {
  //    return const CircularProgressIndicator();
  //  } else {
  //    return const Text('Hello World');
  //  }
  return loading ? const CircularProgressIndicator() : const Text('Hello World');
 } 
}
