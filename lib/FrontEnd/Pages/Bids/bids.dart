import 'package:flutter/material.dart';

class Bids extends StatefulWidget {
  const Bids({super.key});

  @override
  State<Bids> createState() => _BidsState();
}

class _BidsState extends State<Bids> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text("Bids"),
    );
  }
}
