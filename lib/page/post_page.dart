import 'package:flutter/material.dart';
import 'package:instagram_ui/model/artist.dart';

class PostPage extends StatelessWidget {
  const PostPage(this.artist, {super.key});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            height: double.infinity,
            width: double.infinity,
            artist.artistImage,
            fit: BoxFit.cover,
          ),
          const Positioned(
            top: kTextTabBarHeight,
            child: BackButton(
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: Text(
                "Reels",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: kTextTabBarHeight,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_up_outlined,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
