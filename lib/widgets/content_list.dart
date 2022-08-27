import 'package:flutter/material.dart';

import '../models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  ContentList(
      {required this.title,
      required this.contentList,
      this.isOriginals = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: isOriginals ? 500 : 220,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemCount: contentList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    height: isOriginals ? 400 : 200,
                    width: isOriginals ? 200 : 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          content.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
