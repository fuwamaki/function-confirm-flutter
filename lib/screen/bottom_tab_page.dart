import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class BottomTabPage extends StatefulWidget {
  const BottomTabPage({Key? key}) : super(key: key);

  @override
  State<BottomTabPage> createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  @override
  String get restorationId => "123";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    var bottomItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.add_comment),
        label: "Comments",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.calendar_today),
        label: "Calendar",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle),
        label: "Account",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.alarm_on),
        label: "Alarm",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.camera_enhance),
        label: "Camera",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("title ${_currentIndex.value}"),
      ),
      body: Center(
        child: PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: _NavigationDestinationView(
            key: UniqueKey(),
            item: bottomItems[_currentIndex.value],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false, // trueならテキスト常時表示、falseなら選択時のみ
        items: bottomItems,
        currentIndex: _currentIndex.value,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: textTheme.caption!.fontSize!,
        unselectedFontSize: textTheme.caption!.fontSize!,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
        },
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
        backgroundColor: colorScheme.primary,
      ),
    );
  }
}

class _NavigationDestinationView extends StatelessWidget {
  const _NavigationDestinationView({Key? key, required this.item})
      : super(key: key);

  final BottomNavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ExcludeSemantics(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/placeholder_image.png',
                ),
              ),
            ),
          ),
        ),
        Center(
          child: IconTheme(
            data: const IconThemeData(
              color: Colors.white,
              size: 80,
            ),
            child: Semantics(child: item.icon),
          ),
        ),
      ],
    );
  }
}
