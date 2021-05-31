class Product {
  final String productId;
  final String productName;
  final String productOldPrice;
  final String productNewPrice;
  final String productQtite;
  final String productPicture1;
  final String productPicture2;
  final String productPicture3;
  final String productCategory;
  final String productDescription;
  final Map sizes;
  final Map colors;

  Product(
      {this.productId,
        this.productName,
        this.productOldPrice,
        this.productNewPrice,
        this.productQtite,
        this.productPicture1,
        this.productPicture2,
        this.productPicture3,
        this.productCategory,
        this.productDescription,
        this.sizes,
        this.colors
      }
      );

  //convert a map to a product
  Product.fromMap(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        productName = firestore['productName'],
        productOldPrice = firestore['productOldPrice'],
        productNewPrice = firestore['productNewPrice'],
        productQtite = firestore['quantity'],
        productPicture1 = firestore['productPicture1'],
        productPicture2 = firestore['productPicture2'],
        productPicture3 = firestore['productPicture3'],
        productCategory = firestore['category'],
        productDescription = firestore['description'],
        sizes = firestore['sizes'],
        colors = firestore['colors']
  ;
}
