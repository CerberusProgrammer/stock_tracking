import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

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

  static List<DropdownMenuItem> items = [];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            decoration: const PageDecoration(bodyAlignment: Alignment.center),
            title: 'Add the data of the item',
            bodyWidget: Column(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: DropdownButton(
                        value: selected,
                        hint: const Text('Select a category'),
                        items: items,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selected = value;
                            });
                          }
                        },
                      ),
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Set the name of the category'),
                          content: TextField(
                            autofocus: true,
                            controller: category,
                            decoration: const InputDecoration(
                                label: Text('Category'),
                                hintText: 'Vegetables, Fruits, etc...'),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  items.add(DropdownMenuItem(
                                      child: Text(category.text)));
                                });
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('Add'),
                            ),
                          ],
                        ),
                      ),
                      child: const Text('Add a category'),
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
                      suffix: Text('\$'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: quantity,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text('Quantity')),
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
