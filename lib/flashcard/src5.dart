//ETC
//contains: expansion tile card

// ignore_for_file: library_private_types_in_public_api, overridden_fields

import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionTileCard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'GeeksForGeeks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  final Key? key;
  final String title;

  MyHomePage({super.key, String? title})
      : key = key ?? GlobalKey(),
        title = title ?? 'Default Title';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            key: cardB,
            leading: const CircleAvatar(child: Text('A')),
            title: const Text('Tap to Expand!'),
            subtitle: const Text('It has the GFG Logo.'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Image.asset('assets/gfg.png')),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
