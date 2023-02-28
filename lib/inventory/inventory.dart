import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:stock_tracking/objects/categories.dart';
import 'package:stock_tracking/objects/category_item.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<StatefulWidget> createState() => _Inventory();
}

class _Inventory extends State<StatefulWidget> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  Color colorPicker = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        primary: false,
        padding: const EdgeInsets.all(5),
        // ignore: prefer_const_literals_to_create_immutables
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: Categories.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Flexible(
            child: InkWell(
              child: Card(
                color: Categories.categoryList[index].color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              Categories.categoryList[index].name,
                              style: const TextStyle(fontSize: 19),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Categories.categoryList[index].icon,
                            iconSize: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        Categories.categoryList[index].description,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(Categories.categoryList[index].name),
                  content: Categories.categoryList[index].description.isEmpty
                      ? null
                      : Text(Categories.categoryList[index].description),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a new category',
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Add a new category'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  autofocus: true,
                  controller: name,
                  decoration: const InputDecoration(
                      label: Text('Category'),
                      hintText: 'Vegetables, Fruits, etc...'),
                ),
                TextField(
                  controller: description,
                  decoration: const InputDecoration(
                      label: Text('Description'),
                      hintText: 'This category have...'),
                  keyboardType: TextInputType.multiline,
                  minLines: 2,
                  maxLines: null,
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          FilledButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Done'))
                        ],
                        content: SingleChildScrollView(
                            child: ColorPicker(
                          pickerColor: colorPicker,
                          onColorChanged: (color) {
                            setState(() {
                              colorPicker = color;
                            });
                          },
                        )),
                      );
                    }),
                icon: const Icon(Icons.color_lens),
              ),
              FilledButton(
                  onPressed: () {
                    if (name.text.isNotEmpty) {
                      setState(() {
                        Categories.categoryList.add(CategoryItem(
                          name: name.text,
                          description:
                              description.text.isEmpty ? '' : description.text,
                          color: colorPicker,
                        ));
                      });
                    }

                    name.clear();
                    description.clear();
                    Navigator.pop(context);
                  },
                  child: const Text('Add')),
            ],
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
