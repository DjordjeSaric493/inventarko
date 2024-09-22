//Here we'll store inventory data, bunch of enums from product model
import 'models/product_model.dart';

final productInventoryList = [
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/sr/4/4f/Igra_prestola.jpeg",
      productName: "Game of Thrones-jbm li ga koja",
      category: ProdCategory.books,
      productSku: "TS38790",
      productVariants: [ProdVariant.color, ProdVariant.size],
      productPrice: 24,
      status: ProdStatus.active,
      variantCount: 11),
  //tnx cgpt for generating next models
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/en/e/e0/Iphone12promax.png",
      productName: "iPhone 12 Pro Max",
      category: ProdCategory.electronics,
      productSku: "ELEC12345",
      productVariants: [ProdVariant.color, ProdVariant.storage],
      productPrice: 999,
      status: ProdStatus.active,
      variantCount: 3),
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/en/2/24/1984first.jpg",
      productName: "1984 by George Orwell",
      category: ProdCategory.books,
      productSku: "BK9876",
      productVariants: [ProdVariant.material],
      productPrice: 18,
      status: ProdStatus.active,
      variantCount: 2),
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/en/b/b5/Radiohead_-_OK_Computer.png",
      productName: "OK Computer - Radiohead Album",
      category: ProdCategory.music,
      productSku: "MSC3587",
      productVariants: [ProdVariant.format],
      productPrice: 22,
      status: ProdStatus.active,
      variantCount: 1),
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/commons/c/c6/PlayStation_5_console_with_dual_sense_controller.png",
      productName: "PlayStation 5",
      category: ProdCategory.electronics,
      productSku: "ELEC54321",
      productVariants: [ProdVariant.storage],
      productPrice: 499,
      status: ProdStatus.active,
      variantCount: 2),
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/commons/5/56/Manson_MB-1.png",
      productName: "Manson MB-1 Guitar",
      category: ProdCategory.electronics,
      productSku: "ELEC12378",
      productVariants: [ProdVariant.color],
      productPrice: 2500,
      status: ProdStatus.active,
      variantCount: 2),
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/commons/8/84/T-shirt_white_front.png",
      productName: "Basic White T-shirt",
      category: ProdCategory.clothes,
      productSku: "CLTHS5678",
      productVariants: [ProdVariant.size, ProdVariant.color],
      productPrice: 15,
      status: ProdStatus.active,
      variantCount: 5),
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/commons/f/ff/Nike_Air_Force_1_triple_white.jpg",
      productName: "Nike Air Force 1",
      category: ProdCategory.clothes,
      productSku: "CLTHS1234",
      productVariants: [ProdVariant.size, ProdVariant.color],
      productPrice: 110,
      status: ProdStatus.active,
      variantCount: 6),
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/en/6/6b/Abbey_Road_by_The_Beatles.png",
      productName: "Abbey Road - The Beatles",
      category: ProdCategory.music,
      productSku: "MSC1357",
      productVariants: [ProdVariant.size],
      productPrice: 15,
      status: ProdStatus.active,
      variantCount: 1),
  ProductModel(
      productPic:
          "https://upload.wikimedia.org/wikipedia/commons/c/c6/PlayStation_5_console_with_dual_sense_controller.png",
      productName: "PlayStation 5",
      category: ProdCategory.electronics,
      productSku: "ELEC54321",
      productVariants: [ProdVariant.storage],
      productPrice: 499,
      status: ProdStatus.active,
      variantCount: 2),
];
