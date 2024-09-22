import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:inventarko/data/models/product_model.dart';
import 'package:inventarko/utils/constants.dart';
import 'package:inventarko/widgets/button.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    //FE part
    return Column(
      children: [
        Flexible(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(defaultSpace),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(defaultSpace / 1.5)),
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          margin: const EdgeInsets.only(
              top: defaultSpace * 2.2,
              left: defaultSpace,
              right: defaultSpace * 2.2,
              bottom: defaultSpace * 3),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultSpace),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //first container that contains everything in column
                      Container(
                        width: 400,
                        height: 40,
                        decoration: BoxDecoration(
                            color: backgroundColor.withOpacity(.55),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: Colors.grey.withOpacity(.45),
                                width: .69),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(defaultSpace / 2),
                              child: Icon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: Colors.grey.withOpacity(.8),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {},
                                style: TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              ),
                            )),
                            //lib/widgets/button.dart
                            ButtonWithIcon(
                                icon: FontAwesomeIcons
                                    .arrowDown19, //can use Icons.keyboard_arrow_down too
                                //required params are label and onTap
                                label: 'Filter',
                                onTap: () {
                                  print("korisnik kliknuo filter");
                                  //TODO: ovde će još da petljam
                                })
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: defaultSpace / 2,
                      ),
                      Row(
                        children: [
                          ButtonWithIcon(
                              labelAndIconColor: primaryColor,
                              icon: Icons.keyboard_arrow_down_outlined,
                              label: 'Export',
                              onTap: () {
                                print("odabrao opciju export");
                              }),
                          SizedBox(
                            width: defaultSpace / 2,
                          ),
                          Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Novi proizvod",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}

TableRow _buildProdHeader() {
  return TableRow(
    children: [
      //one row with multiple
      _buildProdItem(
          child: Padding(
        padding: const EdgeInsets.all(defaultSpace / 2),
        child: Checkbox(value: false, onChanged: (value) {}),
      )),
      _buildProdItem(child: Container()),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("Naziv proizvoda"),

        ///product name
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("Kategorija"), //product category
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("SKU"),
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("Varianta"), //variant
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("Cena"), //product price
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("Status"), //status -check enums
      )),
      _buildProdItem(child: Container()),
    ],
  );
}

TableCell _buildProdItem({required Widget child}) {
  return TableCell(
    verticalAlignment: TableCellVerticalAlignment.middle,
    child: //ctrl+space and it'll create child since it's required
        SizedBox(
      height: 69,
      child: Center(
        child: child,
      ),
    ),
  );
}

// Function to convert ProductStatus enum to a user-friendly string
String StockStatus(ProdStatus status) {
  // Check the status of the product
  switch (status) {
    // If the product is out of stock, return the appropriate message
    case ProdStatus.outOfStock:
      return "Out of Stock";

    // If the product is active, return the appropriate message
    case ProdStatus.active:
      return "Active";

    // Default case to handle any other statuses in the future
    default:
      return "Unknown Status";
  }
}
