import 'package:flutter/material.dart';

class SearchSugestionBar extends StatefulWidget {
  const SearchSugestionBar({Key? key}) : super(key: key);

  @override
  _SearchSugestionBarState createState() => _SearchSugestionBarState();
}

class _SearchSugestionBarState extends State<SearchSugestionBar> {
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
          onTap: () {
            setState(() {});
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
                onPressed: () {},
                icon: const Icon(Icons.search_rounded,
                    color: Colors.white, size: 34),
              ),
            ),
          ),
        ));
  }
}
