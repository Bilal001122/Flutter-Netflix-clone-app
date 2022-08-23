import 'package:flutter/material.dart';
import 'package:netflix_clone_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[500],
        child: Icon(Icons.cast),
        onPressed: () {},
      ),
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size(screenSize.width, 50),
      ),
    );
  }
}
