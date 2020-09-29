import 'package:flutter/material.dart';

class Splash1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sze = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/logo.jpeg',
            fit: BoxFit.contain,
            width: sze.width,
          ),
        ),
      const  SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black,
        ),const SizedBox(
          height: 20,
        ),
       const Text('Loading...',style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ));
  }
}
