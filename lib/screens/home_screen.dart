import 'package:flutter/material.dart';
import 'package:netflix_clone_app/data/data.dart';
import 'package:netflix_clone_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required Key key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(() {
            _scrollOffset = _scrollController!.offset;
          });
        },
      );
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.cast),
        onPressed: () {},
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppBar(scrollOffset: _scrollOffset),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featureContent: sintelContent),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey('previews'),
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('myList'),
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('originals'),
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('trending'),
                title: 'Trending',
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
