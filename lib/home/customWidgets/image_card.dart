import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final String? imgUrl;
  const CustomImageCard({Key? key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      child: FadeInImage(
        fit: BoxFit.cover,
        placeholder: const AssetImage('assets/placeHold.jpg'),
        image: NetworkImage(imgUrl ?? ""),
        imageErrorBuilder: (context, exception, stackTrack) =>
            const Icon(Icons.image_not_supported_sharp),
        placeholderErrorBuilder: (context, error, stackTrace) =>
            const CupertinoActivityIndicator(),
      ),
    );
  }
}
