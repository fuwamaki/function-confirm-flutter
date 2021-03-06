import 'package:flutter/material.dart';

class _TextStyleItem extends StatelessWidget {
  const _TextStyleItem({
    Key? key,
    required this.name,
    required this.style,
    required this.text,
  }) : super(key: key);

  final String name;
  final TextStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 72,
            child: Text(name, style: Theme.of(context).textTheme.caption),
          ),
          Expanded(
            child: Text(text, style: style),
          ),
        ],
      ),
    );
  }
}

class TypographyPage extends StatelessWidget {
  const TypographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final styleItems = [
      _TextStyleItem(
        name: 'Headline 1',
        style: textTheme.headline1!,
        text: 'Light 96sp',
      ),
      _TextStyleItem(
        name: 'Headline 2',
        style: textTheme.headline2!,
        text: 'Light 60sp',
      ),
      _TextStyleItem(
        name: 'Headline 3',
        style: textTheme.headline3!,
        text: 'Regular 48sp',
      ),
      _TextStyleItem(
        name: 'Headline 4',
        style: textTheme.headline4!,
        text: 'Regular 34sp',
      ),
      _TextStyleItem(
        name: 'Headline 5',
        style: textTheme.headline5!,
        text: 'Regular 24sp',
      ),
      _TextStyleItem(
        name: 'Headline 6',
        style: textTheme.headline6!,
        text: 'Medium 20sp',
      ),
      _TextStyleItem(
        name: 'Subtitle 1',
        style: textTheme.subtitle1!,
        text: 'Regular 16sp',
      ),
      _TextStyleItem(
        name: 'Subtitle 2',
        style: textTheme.subtitle2!,
        text: 'Medium 14sp',
      ),
      _TextStyleItem(
        name: 'Body Text 1',
        style: textTheme.bodyText1!,
        text: 'Regular 16sp',
      ),
      _TextStyleItem(
        name: 'Body Text 2',
        style: textTheme.bodyText2!,
        text: 'Regular 14sp',
      ),
      _TextStyleItem(
        name: 'Button',
        style: textTheme.button!,
        text: 'MEDIUM (ALL CAPS) 14sp',
      ),
      _TextStyleItem(
        name: 'Caption',
        style: textTheme.caption!,
        text: 'Regular 12sp',
      ),
      _TextStyleItem(
        name: 'Overline',
        style: textTheme.overline!,
        text: 'REGULAR (ALL CAPS) 10sp',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Typography"),
      ),
      body: Scrollbar(child: ListView(children: styleItems)),
    );
  }
}
