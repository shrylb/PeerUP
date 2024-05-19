// ruote 1
import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: Page1(),
  ));
}

class Page1 extends StatelessWidget {
  const Page1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        child: const Text('Go to Page 2'),
      )

          // RaisedButton is deprecated
          // We should use ElevatedButton instead

          // child: RaisedButton(
          // child: const Text('Go to Page 2'),
          // onPressed: () {
          //	 Navigator.of(context).push(_createRoute());
          // },
          // ),
          ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

class Page2 extends StatelessWidget {
  const Page2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
