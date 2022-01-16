import 'package:excelledia/core/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:excelledia/home/model/image_list.dart';

class CustomImageCard extends StatelessWidget {
  final ImageListModel? imgModel;
  const CustomImageCard({Key? key, this.imgModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: _viewDetailCard(context, imgModel ?? const ImageListModel()),
        ),
      ),
      child: SizedBox(
        height: 70,
        child: customFadeInImage(imgModel?.previewURL ?? "",
            imgFit: BoxFit.fitHeight),
      ),
    );
  }
}

Widget _viewDetailCard(BuildContext context, ImageListModel imageDetail) =>
    Container(
      width: MediaQuery.of(context).size.width * .90,
      padding: const EdgeInsets.all(6),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          customFadeInImage(imageDetail.largeImageURL ?? "",
              imgFit: BoxFit.contain),
        ],
      ),
    );

Widget customFadeInImage(String imgUrl, {BoxFit imgFit = BoxFit.cover}) =>
    FadeInImage(
      fit: imgFit,
      alignment: Alignment.center,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 200),
      placeholder: const AssetImage(Assets.placeholderImg),
      image: NetworkImage(imgUrl),
      imageErrorBuilder: (context, exception, stackTrack) =>
          const Icon(Icons.image_not_supported_sharp),
      placeholderErrorBuilder: (context, error, stackTrace) =>
          const CupertinoActivityIndicator(),
    );
