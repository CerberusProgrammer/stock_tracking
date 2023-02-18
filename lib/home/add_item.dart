import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stock_tracking/objects/categories.dart';

import '../objects/category_item.dart';

class AdderItem extends StatefulWidget {
  const AdderItem({super.key});

  @override
  State<StatefulWidget> createState() => _AdderItemState();
}

class _AdderItemState extends State<StatefulWidget> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController value = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController quantity = TextEditingController();

  String? selected;

  void onEnd(context) {
    Navigator.of(context).pop();
  }

  List<DropdownMenuItem> toDropdownMenuItems() {
    List<DropdownMenuItem> items = [];

    for (CategoryItem category in categoryList) {
      items.add(DropdownMenuItem(child: Text(category.name)));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            decoration: const PageDecoration(bodyAlignment: Alignment.center),
            title: 'Add the data of the item',
            bodyWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(label: Text('Name')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: description,
                    decoration:
                        const InputDecoration(label: Text('Description')),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: DropdownButton(
                        value: null,
                        hint: const Text('Select a category'),
                        items: toDropdownMenuItems(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selected = value;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )),
        PageViewModel(
            title: 'Add the value of the item',
            decoration: const PageDecoration(bodyAlignment: Alignment.center),
            bodyWidget: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: value,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Value'),
                      suffixIcon: Icon(Icons.attach_money),
                      suffix: Text('per item'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: quantity,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Quantity'),
                    ),
                  ),
                ),
              ],
            )),
        PageViewModel(
            decoration: const PageDecoration(bodyAlignment: Alignment.center),
            title: 'Let\'s take a photo to the item',
            bodyWidget: Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.camera)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.photoFilm))
              ],
            )),
        PageViewModel(
            decoration: const PageDecoration(bodyAlignment: Alignment.center),
            title: 'And finally get the barcode',
            bodyWidget: Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.barcode)),
              ],
            ))
      ],
      showBackButton: true,
      showNextButton: false,
      back: const Icon(Icons.arrow_back),
      done: const Text("Done"),
      onDone: () {
        Navigator.of(context).pop();
      },
    );
  }
}
