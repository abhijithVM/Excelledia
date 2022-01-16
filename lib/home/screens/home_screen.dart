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
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.imageList.length,
                      itemBuilder: (context, i) => CustomImageCard(
                          imgUrl: state.imageList[i].largeImageURL),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    );
                  }
                  if (state is GetimagelistLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CupertinoActivityIndicator(radius: 50),
                    );
                  }
                  if (state is GetimagelistFailed) {
                    return _buildPlaceHold("sorry no results found");
                  }
                  return _buildPlaceHold(
                      "enter your keyword and press search button");
                },
              ),
            )
          ],
        ));
  }

  Widget _buildPlaceHold(String label) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Text(label),
            const Image(
              image: AssetImage(Assets.noSearchResult),
            ),
          ],
        ),
      );
}

// Column(
//                         children: List.generate(
//                             state.imageList.length,
//                             (i) => CustomImageCard(
//                                   imgUrl: state.imageList[i].largeImageURL,
//                                 )));









