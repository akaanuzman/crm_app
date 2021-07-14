import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Arama',
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: context.colorScheme.onBackground),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: context.colorScheme.surface),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
