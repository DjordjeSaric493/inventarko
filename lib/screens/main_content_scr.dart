import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:inventarko/data/inventory_data.dart';
import 'package:inventarko/data/models/product_model.dart';
import 'package:inventarko/utils/constants.dart';
import 'package:inventarko/widgets/button.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  Iterable<TableRow>? productList;
  Iterable<TableRow>? filteredProductList;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      productList = productInventoryList.map((product) =>
          _buildProductRowTile(context, product, product.productSku));
    });
  }

  @override
  Widget build(BuildContext context) {
    // FE part
    return Column(
      children: [
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(defaultSpace),
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(defaultSpace / 1.5)),
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
                        // first container that contains everything in column
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
                                  style: const TextStyle(fontSize: 12),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              )),
                              // lib/widgets/button.dart
                              ButtonWithIcon(
                                  icon: FontAwesomeIcons.arrowDown19,
                                  // required params are label and onTap
                                  label: 'Filter',
                                  onTap: () {
                                    print("korisnik kliknuo filter");
                                    // TODO: ovde će još da petljam
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
                            const SizedBox(
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
                  ),
                  // put another table
                  Table(
                    // map with indexes
                    columnWidths: const {
                      0: FixedColumnWidth(25),
                      1: FixedColumnWidth(70),
                      2: FixedColumnWidth(175),
                      3: FixedColumnWidth(120),
                    },
                    border: TableBorder(
                      top: BorderSide(
                          color: Colors.grey.withOpacity(.1), width: 1),
                      bottom: BorderSide(
                          color: Colors.grey.withOpacity(.1), width: 1),
                      horizontalInside: BorderSide(
                          color: Colors.grey.withOpacity(.1), width: 1),
                    ),
                    // table properties
                    children: [_buildProdHeader(), ...?productList],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

TableRow _buildProductRowTile(
    BuildContext context, ProductModel product, String productSKU) {
  return TableRow(
      key: ValueKey(product.productSku), // Use productSku as a unique key
      children: [
        _buildProdItem(
            child: Checkbox(
                side: const BorderSide(color: Colors.grey, width: 1),
                focusColor: Colors.black45,
                value: false,
                onChanged: (value) {})),
        _buildProdItem(
            child: Image.network(
          product.productPic,
          width: 40,
          errorBuilder: (context, err, _) {
            return Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.blueGrey, shape: BoxShape.rectangle));
          },
        )),
        _buildProdItem(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.productName,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black87.withOpacity(.7)),
            ),
          ),
        ),
        _buildProdItem(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.category.name.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black87.withOpacity(.7)),
            ),
          ),
        ),
        _buildProdItem(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.productSku,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black87.withOpacity(.7)),
            ),
          ),
        ),
        // product variants, it's a bit different than others
        _buildProdItem(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.variantCount.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black87.withOpacity(.7)),
                ),
                Row(
                  children: [
                    const Text("Varijante: "),
                    ...product.productVariants.map((variant) => Flexible(
                            child: Text(
                          '${variant.name},',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.black87.withOpacity(.7)),
                        )))
                  ],
                )
              ],
            ),
          ),
        ),
        _buildProdItem(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${product.productPrice.toString()}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87.withOpacity(.7),
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        _buildProdItem(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              width: 120,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: product.status.name == "active"
                      ? Colors.green.withOpacity(.3)
                      : Colors.red.withOpacity(.3),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  StockStatus(product.status),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: product.status.name == "active"
                          ? Colors.green
                          : Colors.red),
                ),
              ),
            ),
          ),
        ),
        TableCell(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: defaultSpace + 6),
          child: Center(
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Icon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.black.withOpacity(.5),
              ),
            ),
          ),
        )),
      ]);
}

TableRow _buildProdHeader() {
  return TableRow(
    children: [
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
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("Kategorija"),
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("SKU"),
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("Varianta"),
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("Cena"),
      )),
      _buildProdItem(
          child: const Padding(
        padding: EdgeInsets.all(defaultSpace / 2),
        child: Text("Status"),
      )),
      _buildProdItem(child: Container()),
    ],
  );
}

TableCell _buildProdItem({required Widget child}) {
  return TableCell(
    verticalAlignment: TableCellVerticalAlignment.middle,
    child: SizedBox(
      height: 69,
      child: Center(
        child: child,
      ),
    ),
  );
}

String StockStatus(ProdStatus status) {
  switch (status) {
    case ProdStatus.outOfStock:
      return "Out of Stock";
    case ProdStatus.active:
      return "Active";
    default:
      return "Unknown Status";
  }
}
