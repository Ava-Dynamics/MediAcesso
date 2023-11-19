import 'package:flutter/material.dart';

class AttachPageview extends StatefulWidget {
  const AttachPageview({Key? key}) : super(key: key);

  @override
  _AttachPageviewState createState() => _AttachPageviewState();
}

class _AttachPageviewState extends State<AttachPageview> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Upload dos docs'),
      ),
      body: Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
