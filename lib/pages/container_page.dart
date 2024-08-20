import 'package:custom_container/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomContainerPage extends StatelessWidget {
  const CustomContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Container Page'),
      ),
      body: CustomContainerComponent(
        width: 200,
        height: 200,
        containerColor: Colors.blue,
        border: Border.all(width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        // image: const AssetImage('assets/images/abc.png'),
      ),
    );
  }
}
