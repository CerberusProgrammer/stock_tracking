import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stock_tracking/objects/categories.dart';
import 'package:stock_tracking/objects/item.dart';
import 'package:stock_tracking/objects/items.dart';

class AdderItem extends StatefulWidget {
  const AdderItem({super.key});

  @override
  State<StatefulWidget> createState() => _AdderItemState();
}

class _AdderItemState extends State<StatefulWidget> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController value = TextEditingController();
  TextEditingController quantity = TextEditingController();

  String? selected;
  int item = -1;

  void onEnd(context) {
    Navigator.of(context).pop();
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
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: description,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButton<String>(
                      value: selected,
                      hint: const Text('Select a category'),
                      items: Categories.toWidget(),
                      onChanged: (value) {
                        setState(() {
                          selected = value as String;

                          for (int i = 0;
                              i < Categories.categoryList.length;
                              i++) {
                            if (Categories.categoryList[i].name == selected) {
                              item = i;
                            }
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(bodyAlignment: Alignment.center),
          title: 'Let\'s take a photo to the item',
          bodyWidget: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.camera),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.photoFilm),
              )
            ],
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(bodyAlignment: Alignment.center),
          title: 'And finally get the barcode',
          bodyWidget: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.barcode),
              ),
            ],
          ),
        )
      ],
      showBackButton: false,
      showNextButton: false,
      back: const Icon(Icons.arrow_back),
      done: const Text("Done"),
      onDone: () {
        if (name.text.isNotEmpty &&
            description.text.isNotEmpty &&
            selected!.isNotEmpty &&
            value.text.isNotEmpty &&
            quantity.text.isNotEmpty) {
          setState(() {
            items.add(Item(
                name: name.text,
                category: Categories.categoryList[item],
                value: double.parse(value.text),
                barCode: 'barCode',
                description: description.text));
          });

          Navigator.of(context).pop();
        } else {
          showDialog(
            context: context,
            builder: (builder) => const AlertDialog(
              title: Text('Datos pendientes'),
              content: Text(
                  'Ingrese la informacion solicitada para registrar el producto.'),
            ),
          );
        }
      },
      onSkip: () {},
    );
  }
}
