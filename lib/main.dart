import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_ui/page/account_page.dart';
import 'package:instagram_ui/page/favorite_page.dart';
import 'package:instagram_ui/page/home_page.dart';
import 'package:instagram_ui/page/search_page.dart';
import 'package:instagram_ui/page/video_page.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      home: const ViewPagerPage(),
    ),
  ));
}

final currentPosition = StateProvider.autoDispose((ref) => 0);

class ViewPagerPage extends HookConsumerWidget {
  const ViewPagerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();

    ref.listen(currentPosition, (previous, next) {
      controller.jumpToPage(next);
    });

    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SearchPage(),
          VideoPage(),
          FavoritePage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: const _BottomNavigationBarItem(),
    );
  }
}

class _BottomNavigationBarItem extends ConsumerWidget {
  const _BottomNavigationBarItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: ref.watch(currentPosition),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.video_collection_rounded), label: "Video"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
      ],
      onTap: (value) => ref.read(currentPosition.notifier).update((state) => value),
    );
  }
}
