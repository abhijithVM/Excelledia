// ignore_for_file: file_names

import 'package:excelledia/core/assets.dart';
import 'package:excelledia/home/bloc/getimagelist_bloc.dart';
import 'package:excelledia/home/customWidgets/custom_delegate.dart';
import 'package:excelledia/home/customWidgets/image_card.dart';
import 'package:excelledia/home/customWidgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCopy extends StatefulWidget {
  const HomeScreenCopy({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreenCopy> createState() => _HomeScreenCopyState();
}

class _HomeScreenCopyState extends State<HomeScreenCopy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverPersistentHeader(
              pinned: true,
              delegate: CustomAutoHideAppBarDelegate(
                child: CustomSearchBar(),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<GetimagelistBloc, GetimagelistState>(
                builder: (context, state) {
                  debugPrint(state.toString());
                  if (state is GetimagelistSuccess) {
                    return Column(
                        children: List.generate(
                            state.imageList.length,
                            (i) => CustomImageCard(
                                  imgUrl: state.imageList[i].largeImageURL,
                                )));
                  }
                  if (state is GetimagelistLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CupertinoActivityIndicator(radius: 50),
                    );
                  }
                  if (state is GetimagelistFailed) {
                    return _buildPlaceHold();
                  }
                  return _buildPlaceHold();
                },
              ),
            )
          ],
        ));
  }

  Widget _buildPlaceHold() => const Image(
        image: AssetImage(Assets.noSearchResult),
      );
}




// SizedBox(
//                       height: MediaQuery.of(context).size.height * 90,
//                       child: ListView.builder(
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: state.imageList.length,
//                           itemBuilder: (context, i) => CustomImageCard(
//                                 imgUrl: state.imageList[i].largeImageURL,
//                               )),
//                     );