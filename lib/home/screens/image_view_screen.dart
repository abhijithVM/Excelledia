import 'package:excelledia/home/customWidgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:excelledia/home/model/image_list.dart';

class SingleImageViewScreen extends StatelessWidget {
  final ImageListModel? imageDetail;
  const SingleImageViewScreen({Key? key, this.imageDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("image details"),
        leading: CloseButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customFadeInImage(imageDetail?.largeImageURL ?? ""),
              _userDetail(imageDetail, context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _userDetail(ImageListModel? imageDetail, BuildContext context) =>
    ColoredBox(
      color: Colors.brown.shade400,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, top: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: customFadeInImage(imageDetail?.userImageURL ?? "",
                    imgFit: BoxFit.contain),
              ),
            ),
            Text.rich(
              TextSpan(
                  text: "captured by ",
                  style: const TextStyle(fontSize: 12),
                  children: [
                    TextSpan(
                      text: "${imageDetail?.user} ",
                      style: Theme.of(context).textTheme.button,
                    )
                  ]),
              overflow: TextOverflow.fade,
            )
          ],
        ),
      ),
    );
