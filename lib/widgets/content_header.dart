import 'package:flutter/material.dart';
import 'package:netflix_clone_app/models/models.dart';
import 'package:netflix_clone_app/widgets/vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  final Content featureContent;

  ContentHeader({required this.featureContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                featureContent.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featureContent.titleImageUrl!),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () {},
              ),
              _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outlined,
                title: 'Info',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.fromLTRB(15, 5, 20, 5),
        backgroundColor: Colors.white,
      ),
      onPressed: () {},
      icon: Icon(
        Icons.play_arrow,
        size: 30,
        color: Colors.black,
      ),
      label: Text(
        'Play',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
