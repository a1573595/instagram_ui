import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_ui/gen/assets.gen.dart';
import 'package:instagram_ui/model/artist.dart';
import 'package:instagram_ui/model/story.dart';
import 'package:instagram_ui/util/extension_util.dart';

const storyList = [
  Story(
    userImage:
        "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    userName: "Jazmin",
  ),
  Story(
    userImage:
        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    userName: "Sylvester",
  ),
  Story(
    userImage:
        "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    userName: "Lavina",
  ),
  Story(
    userImage:
        "https://images.pexels.com/photos/1124724/pexels-photo-1124724.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    userName: "Mckenzie",
  ),
  Story(
    userImage:
        "https://images.pexels.com/photos/1845534/pexels-photo-1845534.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    userName: "Buster",
  ),
  Story(
    userImage:
        "https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    userName: "Carlie",
  ),
  Story(
    userImage:
        "https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    userName: "Edison",
  ),
];

const artList = [
  Artist(
    authorImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
    authorName: "Brianne",
    artistImage:
        "https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    artistCaption: "Nothing is the consequence of everything.",
  ),
  Artist(
    authorImage: "https://s3.amazonaws.com/uifaces/faces/twitter/kevka/128.jpg",
    authorName: "Henri",
    artistImage:
        "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    artistCaption: "Nothing is the consequence of everything.",
  ),
  Artist(
    authorImage: "https://s3.amazonaws.com/uifaces/faces/twitter/ionuss/128.jpg",
    authorName: "Mariano",
    artistImage:
        "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    artistCaption: "Nothing is the consequence of everything.",
  ),
  Artist(
    authorImage: "https://s3.amazonaws.com/uifaces/faces/twitter/vinciarts/128.jpg",
    authorName: "Johan",
    artistImage:
        "https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    artistCaption: "Nothing is the consequence of everything.",
  ),
  Artist(
    authorImage: "https://s3.amazonaws.com/uifaces/faces/twitter/ssiskind/128.jpg",
    authorName: "London",
    artistImage:
        "https://images.pexels.com/photos/247298/pexels-photo-247298.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    artistCaption: "Nothing is the consequence of everything.",
  ),
  Artist(
    authorImage: "https://s3.amazonaws.com/uifaces/faces/twitter/areus/128.jpg",
    authorName: "Jada",
    artistImage:
        "https://images.pexels.com/photos/169191/pexels-photo-169191.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    artistCaption: "Nothing is the consequence of everything.",
  ),
  Artist(
    authorImage: "https://s3.amazonaws.com/uifaces/faces/twitter/oskarlevinson/128.jpg",
    authorName: "Crawford",
    artistImage:
        "https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    artistCaption: "Nothing is the consequence of everything.",
  ),
];

/// todo 點擊Arist後的Commend BottomSheet
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt),
        ),
        title: Image.asset(
          Assets.images.instaLogo.path,
          height: kTextTabBarHeight,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: _HomeHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: artList.length,
              (context, index) => ArtistItem(
                artList[index],
                key: ValueKey(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Stories",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.arrow_right),
              Text(
                "Watch All",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).radius * 0.25,
          width: double.infinity,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            itemCount: storyList.length,
            itemBuilder: (context, index) => _StoryItem(
              storyList[index],
              key: ValueKey(index),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
          ),
        ),
      ],
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem(this.story, {super.key});

  final Story story;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  _CircleBorderContainer(
                    child: CachedNetworkImage(
                      imageUrl: story.userImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Icon(
                        Icons.add_circle_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: constraints.maxHeight - 16,
              child: Text(
                story.userName,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ArtistItem extends HookWidget {
  const ArtistItem(this.artist, {super.key});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    final isFavorite = useState(false);

    final radius = useMemoized(() => MediaQuery.sizeOf(context).radius);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 0,
            left: 16,
            right: 8,
            bottom: 16,
          ),
          child: Row(
            children: [
              SizedBox(
                height: radius * .1,
                width: radius * .1,
                child: _CircleBorderContainer(
                  child: CachedNetworkImage(
                    imageUrl: artist.authorImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  artist.authorName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
        ),
        CachedNetworkImage(
          imageUrl: artist.artistImage,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => isFavorite.value = !isFavorite.value,
              icon: Icon(
                isFavorite.value ? Icons.favorite : Icons.favorite_border,
                color: isFavorite.value ? Colors.red : null,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.insert_comment_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Liked by ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: "Someone, Someone",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: " and ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: "528,331 others",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                "Someone",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  artist.artistCaption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Text(
            "February 2020",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class _CircleBorderContainer extends StatelessWidget {
  const _CircleBorderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.greenAccent,
            ],
          ),
          borderRadius: BorderRadius.circular(64),
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(64),
          ),
          child: ClipOval(
            child: child,
          ),
        ),
      ),
    );
  }
}
