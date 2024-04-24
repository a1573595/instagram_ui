import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_ui/model/video.dart';
import 'package:video_player/video_player.dart';

const videoList = [
  Video(
    description:
        "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For \$35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast.",
    sources: [
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    ],
    subtitle: "By Google",
    thumb: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
    title: "For Bigger Blazes",
  ),
  Video(
    description:
        "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For \$35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.",
    sources: [
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    ],
    subtitle: "By Google",
    thumb: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg",
    title: "For Bigger Escape",
  ),
  Video(
    description:
        "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for the times that call for bigger joyrides. For \$35. Learn how to use Chromecast with YouTube and more at google.com/chromecast.",
    sources: [
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    ],
    subtitle: "By Google",
    thumb: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg",
    title: "For Bigger Joyrides",
  ),
  Video(
    description:
        "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when you want to make Buster's big meltdowns even bigger. For \$35. Learn how to use Chromecast with Netflix and more at google.com/chromecast.",
    sources: [
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
    ],
    subtitle: "By Google",
    thumb: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerMeltdowns.jpg",
    title: "For Bigger Meltdowns",
  ),
];

class VideoPage extends ConsumerWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemCount: videoList.length,
        itemBuilder: (context, index) => VideoItem(videoList[index]),
      ),
    );
  }
}

/// todo 可伸縮內容？
class VideoItem extends StatefulHookWidget {
  const VideoItem(this.video, {super.key});

  final Video video;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    final videoController = useMemoized(() => VideoPlayerController.networkUrl(Uri.parse(widget.video.sources.first)));
    final animController = useAnimationController();

    useEffect(() {
      videoController.initialize().then((value) {
        if (mounted) {
          setState(() {
            isReady = true;

            animController.duration = videoController.value.duration;
            animController.forward(from: 0.0);

            videoController.play();
          });
        }
      });

      return videoController.dispose;
    }, [videoController]);

    return Stack(
      children: [
        if (!isReady)
          CachedNetworkImage(
            imageUrl: widget.video.thumb,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        if (isReady) VideoPlayer(videoController),
        Positioned(
          top: kToolbarHeight,
          left: 4,
          right: 4,
          child: AnimatedBuilder(
            animation: animController,
            builder: (_, __) => LinearProgressIndicator(
              backgroundColor: Colors.black26,
              color: Colors.white70,
              value: animController.value,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 16,
            ),
            child: Text(
              widget.video.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
