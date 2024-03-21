import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There\'s no weather😔Start ',
            style: TextStyle(fontSize: 24),
          ),
          Text('searching now🔍', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
