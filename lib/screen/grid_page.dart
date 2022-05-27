import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  List<_Photo> _photos(BuildContext context) {
    return [
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placeChennai",
        subtitle: "placeFlowerMarket",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placeTanjore",
        subtitle: "placeBronzeWorks",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placeTanjore",
        subtitle: "placeMarket",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placeTanjore",
        subtitle: "placeThanjavurTemple",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placeTanjore",
        subtitle: "placeThanjavurTemple",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placePondicherry",
        subtitle: "placeSaltFarm",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placeChennai",
        subtitle: "placeScooters",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placeChettinad",
        subtitle: "placeSilkMaker",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placeChettinad",
        subtitle: "placeLunchPrep",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placeTanjore",
        subtitle: "placeMarket",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placePondicherry",
        subtitle: "placeBeach",
      ),
      _Photo(
        assetName: 'assets/placeholder_image.png',
        title: "placePondicherry",
        subtitle: "placeFisherman",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid List")),
      body: GridView.count(
        restorationId: 'grid_view_demo_grid_offset',
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1,
        children: _photos(context).map<Widget>((photo) {
          return _GridDemoPhotoItem(photo: photo);
        }).toList(),
      ),
    );
  }
}

class _Photo {
  _Photo({
    required this.assetName,
    required this.title,
    required this.subtitle,
  });

  final String assetName;
  final String title;
  final String subtitle;
}

/// Allow the text size to shrink to fit in the space
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  const _GridDemoPhotoItem({Key? key, required this.photo}) : super(key: key);

  final _Photo photo;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        photo.assetName,
        fit: BoxFit.cover,
      ),
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(photo.title),
          subtitle: _GridTitleText(photo.subtitle),
        ),
      ),
      child: image,
    );
  }
}
