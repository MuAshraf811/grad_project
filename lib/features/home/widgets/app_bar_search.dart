
import 'package:flutter/material.dart';

class CutomAppBarSearch extends StatelessWidget {
  const CutomAppBarSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      decoration: const InputDecoration(
        labelText: 'Search ',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Colors.grey,
        ),
        constraints: BoxConstraints(
          maxHeight: 44,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
}
