import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainTabBarView extends HookConsumerWidget {
  const MainTabBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);

    /// Add main screens here
    /// For each screen a `BottomNavigationBarItem` should be added to the items
    /// array on the scaffold.
    final screens = [
      Container(
        color: Colors.yellow,
        child: const Center(child: Text('Screen 1')),
      ),
      Container(
        color: Colors.green,
        child: const Center(child: Text('Screen 2')),
      ),
      Container(
        color: Colors.blue,
        child: const Center(child: Text('Screen 3')),
      )
    ];

    return Scaffold(
      body: screens[index.value],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index.value,
        onTap: (val) => index.value = val,
        items: const [
          BottomNavigationBarItem(icon: Icon(Fontisto.neutral), label: 'Moods'),
          BottomNavigationBarItem(
              icon: Icon(Fontisto.history), label: 'Habits'),
          BottomNavigationBarItem(
              icon: Icon(Fontisto.nav_icon_list_a), label: 'Routines')
        ],
      ),
    );
  }
}
