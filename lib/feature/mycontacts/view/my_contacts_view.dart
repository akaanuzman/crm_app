import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MyContactsView extends StatelessWidget {
  const MyContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(context.lowValue, context.normalValue,
            context.lowValue, context.lowValue),
        child: Column(
          children: [
            Expanded(child: _buildTextField(context)),
            context.emptySizedHeightBoxLow,
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Kişi Ekle",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 9,
              child: ListView.builder(
                // ignore: prefer_const_constructors
                itemBuilder: (context, index) => Card(
                  child: const ListTile(
                    title: Text("data"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextField _buildTextField(BuildContext context) => TextField(
        decoration: InputDecoration(
          labelText: 'Arama',
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: context.colorScheme.onBackground),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: context.colorScheme.surface),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
}
