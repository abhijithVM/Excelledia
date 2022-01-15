import 'package:excelledia/home/bloc/getimagelist_bloc.dart';
import 'package:excelledia/home/customWidgets/image_card.dart';
import 'package:excelledia/home/customWidgets/search_bar.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SearchSugestionBar(),
            BlocBuilder<GetimagelistBloc, GetimagelistState>(
              builder: (context, state) {
                if (state is GetimagelistSuccess) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 100,
                    child: ListView.builder(
                        itemCount: state.imageList.length,
                        itemBuilder: (context, i) => CustomImageCard(
                              imgUrl: state.imageList[i].largeImageURL,
                            )),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
