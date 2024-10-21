import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[400],
          title: const Center(child: Text('HOME PAGE'))
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/intro_page');
            },
            child: const Text('Go back to intro page')
        ),
      ),
    );
  }
}
