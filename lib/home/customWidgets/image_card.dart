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
        //** instead of display the largesize_imageURL in a separate screen */
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
    Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        customFadeInImage(imageDetail.largeImageURL ?? ""),
        Positioned(
          bottom: 2,
          right: 2,
          child: ColoredBox(
            color: Colors.brown.shade400,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: customFadeInImage(imageDetail.userImageURL ?? "",
                          imgFit: BoxFit.contain),
                    ),
                  ),
                  Text("${imageDetail.user}",
                      style: Theme.of(context).textTheme.button,
                      overflow: TextOverflow.fade),
                ],
              ),
            ),
          ),
        ),
      ],
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
          const Icon(Icons.image_not_supported_sharp, color: Colors.grey),
      placeholderErrorBuilder: (context, error, stackTrace) =>
          const CupertinoActivityIndicator(),
    );
