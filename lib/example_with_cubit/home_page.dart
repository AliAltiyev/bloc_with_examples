import 'package:flutter/material.dart';

import 'cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final IterableCubitDart _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = IterableCubitDart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _cubit.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final button = Center(
            child: TextButton(
                onPressed: () => _cubit.getRandomElement(),
                child: const Text('Get Random Element')),
          );
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [button, Text(snapshot.data.toString())],
              );
            case ConnectionState.done:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
