//what every product must have to be listed in inventory
//name,photo,category(enum),status, number of stock, price etc

enum ProdCategory { electronics, books, music, clothes }

enum ProdVariant { color, size, material, format, storage }

enum ProdStatus { active, outOfStock }

class ProductModel {
  final String productName;
  final String productPic;
  final ProdCategory category;
  final String productSku;
  final int variantCount;
  final List<ProdVariant> productVariants;
  final num productPrice;
  final ProdStatus status;

//won't use const becus I don't want to be immutable
// if I put const- all finals must be provided, that's the difference here
  ProductModel({
    required this.productName,
    required this.productPic,
    required this.category,
    required this.productSku,
    required this.variantCount,
    required this.productVariants,
    required this.productPrice,
    required this.status,
  });
/*required: Ensures that the parameters must be passed when creating a ProductModel object.
this: Directly assigns the values to the corresponding final fields.*/
}
