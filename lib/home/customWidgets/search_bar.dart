import 'package:excelledia/home/bloc/getimagelist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "required";
            }
          },
          controller: _controller,
          maxLines: 1,
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
            BlocProvider.of<GetimagelistBloc>(context)
                .add(FetchImageListEvent(value));
          },
          decoration: InputDecoration(
            isDense: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            hintText: "what's you looking for ?",
            hintStyle: const TextStyle(fontSize: 12),
            suffixIcon: Container(
              decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6))),
              child: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  BlocProvider.of<GetimagelistBloc>(context)
                      .add(FetchImageListEvent(_controller.text));
                },
                icon: const Icon(Icons.search_rounded,
                    color: Colors.white, size: 34),
              ),
            ),
          ),
        ));
  }
}
