import 'package:custom_widget3/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomContainer(
          width: 200,
          height: 200,
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12),
          // onTap: () {},
          widget: Column(
            children: [
              const Text('abc'),
              Container(
                width: 20,
                height: 20,
                color: Colors.black,
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: Text('abc'))
            ],
          ),
        ),
      ),
    );
  }
}
