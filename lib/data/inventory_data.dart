//Here we'll store inventory data, bunch of enums from product model
import 'models/product_model.dart';

final productInventoryList = [
  ProductModel(
      productPic: "Game of Thrones-jbm li ga koja ",
      productName: "",
      category: ProdCategory.books,
      productSku: "TS38790",
      productVariants: [ProdVariant.color, ProdVariant.size],
      productPrice: 24,
      status: ProdStatus.active,
      variantCount: 11)
];
