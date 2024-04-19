import 'package:animations/animations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_ui/model/artist.dart';
import 'package:instagram_ui/page/home_page.dart';
import 'package:instagram_ui/page/post_page.dart';

/// todo 上滑搜尋會動嗎？
/// todo 不平均的分割畫面，不是傳統GridView
/// https://api.flutter.dev/flutter/widgets/CustomMultiChildLayout-class.html
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchBar(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                leading: const Icon(
                  Icons.search,
                ),
                hintText: "Search",
                hintStyle: MaterialStateProperty.all(Theme.of(context).textTheme.bodyMedium),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: StaggeredGrid.count(
                  crossAxisCount: 9,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: [
                    ...List.generate(100, (index) => 0).mapIndexed((index, e) {
                      final remainder = index % 10;
                      final isRectangle = remainder == 2 || remainder == 5;

                      final artist = artList[index % artList.length];

                      return StaggeredGridTile.count(
                        crossAxisCellCount: 3,
                        mainAxisCellCount: isRectangle ? 6 : 3,
                        child: PostItem(artist),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// todo 放大效果在方形時不好看需要調整
class PostItem extends StatelessWidget {
  const PostItem(this.artist, {super.key});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      // closedColor: Theme.of(context).scaffoldBackgroundColor,
      closedShape: const RoundedRectangleBorder(),
      transitionType: ContainerTransitionType.fade,
      transitionDuration: const Duration(milliseconds: 600),
      closedBuilder: (context, _) => Image.network(
        height: double.infinity,
        width: double.infinity,
        artist.artistImage,
        fit: BoxFit.cover,
      ),
      openBuilder: (context, _) => PostPage(artist),
    );
  }
}
