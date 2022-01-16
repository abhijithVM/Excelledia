// ignore_for_file: file_names

import 'package:excelledia/core/assets.dart';
import 'package:excelledia/home/bloc/getimagelist_bloc.dart';
import 'package:excelledia/home/customWidgets/custom_delegate.dart';
import 'package:excelledia/home/customWidgets/image_card.dart';
import 'package:excelledia/home/customWidgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    return GridView.count(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(12),
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        state.imageList.length,
                        (index) =>
                            CustomImageCard(imgModel: state.imageList[index]),
                      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label),
            const Image(
              image: AssetImage(Assets.noSearchResult),
            ),
          ],
        ),
      );
}
