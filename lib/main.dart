import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: Center(
          child: MyStatefulsWidget(false),
        ),
      ),
      ),
    debugShowCheckedModeBanner: false,
  ));
}
class MyStatelessWidget extends StatelessWidget {
  late final bool loading;
  
  MyStatelessWidget(this.loading);
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
class MyStatefulsWidget extends StatefulWidget {
  late final bool loading;
  MyStatefulsWidget(this.loading);
  @override
  State<MyStatefulsWidget> createState() {
    return _MyStatefulsWidgetState(); 
  }
}

class _MyStatefulsWidgetState extends State<MyStatefulsWidget> {
  late bool _localLoading;
  @override
  void initState() {
    // TODO: implement initState
    _localLoading = widget.loading;
  }


 
  @override
  Widget build(BuildContext context) {
   return _localLoading ? const CircularProgressIndicator() : FloatingActionButton(onPressed: onClick);
  }
  void onClick() {
    setState(() {
      _localLoading = true;
    });
  }
}
