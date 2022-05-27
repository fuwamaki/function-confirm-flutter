import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);
  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> with RestorationMixin {
  late RestorableRouteFuture<String> _alertDialogRoute;
  late RestorableRouteFuture<String> _alertDialogWithTitleRoute;
  late RestorableRouteFuture<String> _simpleDialogRoute;

// Displays the popped String value in a SnackBar.
  void _showInSnackBar(String value) {
    // The value passed to Navigator.pop() or null.
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value),
      ),
    );
  }

  static Route<String> _alertDialogDemoRoute(
    BuildContext context,
    Object? arguments,
  ) {
    final theme = Theme.of(context);
    final dialogTextStyle = theme.textTheme.subtitle1!
        .copyWith(color: theme.textTheme.caption!.color);

    return DialogRoute<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "下書きを破棄しますか？",
            style: dialogTextStyle,
          ),
          actions: [
            _DialogButton(text: "キャンセル"),
            _DialogButton(text: "破棄"),
          ],
        );
      },
    );
  }

  static Route<String> _alertDialogWithTitleDemoRoute(
    BuildContext context,
    Object? arguments,
  ) {
    final theme = Theme.of(context);
    final dialogTextStyle = theme.textTheme.subtitle1!
        .copyWith(color: theme.textTheme.caption!.color);

    return DialogRoute<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Googleの位置情報サービスを利用しますか？"),
          content: Text(
            "Googleに位置情報が特定されます",
            style: dialogTextStyle,
          ),
          actions: [
            _DialogButton(text: "同意しない"),
            _DialogButton(text: "同意する"),
          ],
        );
      },
    );
  }

  static Route<String> _simpleDialogDemoRoute(
    BuildContext context,
    Object? arguments,
  ) {
    final theme = Theme.of(context);

    return DialogRoute<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text("バックアップアカウントの設定"),
        children: [
          _DialogDemoItem(
            icon: Icons.account_circle,
            color: theme.colorScheme.primary,
            text: 'username@gmail.com',
          ),
          _DialogDemoItem(
            icon: Icons.account_circle,
            color: theme.colorScheme.secondary,
            text: 'user02@gmail.com',
          ),
          _DialogDemoItem(
            icon: Icons.add_circle,
            text: "アカウントを追加",
            color: theme.disabledColor,
          ),
        ],
      ),
    );
  }

  static Route<void> _fullscreenDialogRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return MaterialPageRoute<void>(
      builder: (context) => _FullScreenDialogDemo(),
      fullscreenDialog: true,
    );
  }

  @override
  String get restorationId => 'dialog_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(
      _alertDialogRoute,
      'alert_demo_dialog_route',
    );
    registerForRestoration(
      _alertDialogWithTitleRoute,
      'alert_demo_with_title_dialog_route',
    );
    registerForRestoration(
      _simpleDialogRoute,
      'simple_dialog_route',
    );
  }

  @override
  void initState() {
    super.initState();
    _alertDialogRoute = RestorableRouteFuture<String>(
      onPresent: (navigator, arguments) {
        return navigator.restorablePush(_alertDialogDemoRoute);
      },
      onComplete: _showInSnackBar,
    );
    _alertDialogWithTitleRoute = RestorableRouteFuture<String>(
      onPresent: (navigator, arguments) {
        return navigator.restorablePush(_alertDialogWithTitleDemoRoute);
      },
      onComplete: _showInSnackBar,
    );
    _simpleDialogRoute = RestorableRouteFuture<String>(
      onPresent: (navigator, arguments) {
        return navigator.restorablePush(_simpleDialogDemoRoute);
      },
      onComplete: _showInSnackBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      restorationScopeId: 'navigator',
      onGenerateRoute: (settings) {
        return _NoAnimationMaterialPageRoute<void>(
          settings: settings,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("ダイアログ"),
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      _alertDialogRoute.present();
                    },
                    child: Text("ダイアログを表示"),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      _alertDialogWithTitleRoute.present();
                    },
                    child: Text("タイトル付きダイアログを表示"),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      _simpleDialogRoute.present();
                    },
                    child: Text("シンプルダイアログを表示"),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.restorablePush<void>(
                          context, _fullscreenDialogRoute);
                    },
                    child: Text("全画面ダイアログを表示"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// A MaterialPageRoute without any transition animations.
class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  _NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          maintainState: maintainState,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(text);
      },
      child: Text(text),
    );
  }
}

class _DialogDemoItem extends StatelessWidget {
  const _DialogDemoItem({
    Key? key,
    this.icon,
    this.color,
    required this.text,
  }) : super(key: key);

  final IconData? icon;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: () {
        Navigator.of(context).pop(text);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: color),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}

class _FullScreenDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sample Page")),
        body: Center(
          child: TextButton(
            child: Text("最初のページに戻る"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
  }
}
