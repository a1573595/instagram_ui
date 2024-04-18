import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_ui/page/account_page.dart';
import 'package:instagram_ui/page/add_page.dart';
import 'package:instagram_ui/page/favorite_page.dart';
import 'package:instagram_ui/page/home_page.dart';
import 'package:instagram_ui/page/search_page.dart';

void main() => runApp(const ProviderScope(
  child: MaterialApp(
    title: 'Instagram',
    home: FirstPage(),
  ),
));

final currentPosition = StateProvider((ref) => 0);

class FirstPage extends HookConsumerWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();

    final page = useMemoized(() => const [
      HomePage(),
      SearchPage(),
      AddPage(),
      FavoritePage(),
      AccountPage(),
    ]);

    ref.listen(currentPosition, (previous, next) {
      controller.jumpToPage(next);
    });

    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: page.length,
        itemBuilder: (context, index) => page[index],
      ),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends ConsumerWidget {
  const _BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: ref.watch(currentPosition),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          label: "Add",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: "Account",
        ),
      ],
      onTap: (index) => ref.read(currentPosition.notifier).update((state) => index),
    );
  }
}
