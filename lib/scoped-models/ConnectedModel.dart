import 'dart:convert';
import 'package:flutter_cable/model/CartItem.dart';
import 'package:flutter_cable/model/Categories.dart';
import 'package:flutter_cable/model/Product.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectedModel extends Model {
  List<CartItem> cartItemList = List();
  List data = [];
  List rating = [];
  List category = [];
  Map<String, dynamic> rates = {};

  bool _isLoading = false;
  Product _selectedProduct;

  User user;

  void setLoggedInUser(User user) {
    this.user = user;
    notifyListeners();
  }

  User get getLoggedInUser {
    return user;
  }

  List<CartItem> get getCartItems {
    cartItemList.sort((a, b) => a.getTotal.compareTo(b.getTotal));
    return List.from(cartItemList);
  }

  Future<List<CartItem>> deleteItem(CartItem cartItem) async {
    return new List.from(cartItemList)..remove(cartItem);
  }

  double get getCartSubTotal {
    double _subTotal = 0.0;
    getCartItems.forEach((item) {
      _subTotal = (_subTotal + item.getTotal).roundToDouble();
    });
    return _subTotal;
  }
   
  double get getCartTotalWeight {
    double _subTotal = 0.0;
    getCartItems.forEach((item) {
      _subTotal = (_subTotal + item.getWeight).roundToDouble();
    });
    return _subTotal;
  }

  get getCartSubTotalShipping {
    return (40);
  }

  get getCartSubTotalAfterShipping {
    return (getCartSubTotal + getCartSubTotalShipping).roundToDouble();
  }

  double get getCalculatedGST {
    // if(state[0]['s_state']== "california"){
    return ((0.00 * getCartSubTotalAfterShipping) / 100).roundToDouble();
    // }else{
    //   return (0.00);
    // }
    //}
  }

  get getCartTotalPayable {
    return (getCartSubTotalAfterShipping).roundToDouble();
  }

  List get getReviews {
    return List.from(data);
  }

  bool get isLoading {
    return _isLoading;
  }

  void selectProduct(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }

  Product get getSelectedProduct {
    return _selectedProduct;
  }

// void discount(Product product) {
//     _selectedProduct = product.getDiscount;
//     notifyListeners();
//   }

//   get productDiscount{
//     return discount;
//   } 


  Future<void> deleteCartItemFromCart(CartItem cartItem) async {
    if (cartItemList.contains(cartItem)) {
      cartItemList.remove(cartItem);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('cart', json.encode(cartItemList));
    }
  }

  Future<List<Product>> fetchProducts(String categoryId) async {
    final response = await http.get(
        'https://1000ftcables.com/appdata/getAllProducts.php?category_id=${categoryId}');
    if (response.statusCode == 200) {
      List cart = json.decode(response.body);
      List<Product> products = cart
          .map((product) => Product.fromJson(product))
          .cast<Product>()
          .toList();
      return products;
    }
    return List();
  }

  Future<Null> getCart({bool updateCartItem = true}) async {
    _isLoading = true;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (updateCartItem) {
      CartItem cartItem = CartItem(
        productId: getSelectedProduct.productId,
        productName: getSelectedProduct.product,
        productPrice: double.parse(getSelectedProduct.price),
        productCode: getSelectedProduct.productCode,
        image: getSelectedProduct.image,
        weight: double.parse(getSelectedProduct.weight),
      );

      if (cartItemList.contains(cartItem)) {
        CartItem updated = cartItemList.firstWhere(
            (CartItem item) => item.productId == cartItem.productId);
        cartItemList.remove(updated);
        updated.quantity += 1;
        cartItemList.add(updated);
      } else {
        cartItemList.add(cartItem);
      }

      preferences.setString('cart', json.encode(cartItemList));
    }

    if (cartItemList.length == 0) {
      var list = json.decode(preferences.getString('cart'));
      cartItemList =
          list.map((item) => CartItem.fromJson(item)).cast<CartItem>().toList();
    }
    _isLoading = false;
    notifyListeners();
    return;
  }

  Future<void> updateCartItemQuantity(CartItem cartItem) async {
    if (cartItemList.contains(cartItem)) {
      cartItemList.remove(cartItem);
      cartItemList.add(cartItem);
      notifyListeners();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('cart', json.encode(cartItemList));
    }
  }

   

  Future<Null> submitreviews(Map<String, dynamic> requestBody) async {
    var url = "http://${ip}/flutter/addreviews.php";
    var response = await http.post(
      url,
      body: jsonEncode(requestBody),
    );
    print(response.body);
    //  Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => Lo
  }

  Future<List<Categories>> fetchCategories() async {
    final response =
        await http.get('https://1000ftcables.com/appdata/getcart5.php');
    if (response.statusCode == 200) {
      List category = json.decode(response.body);

      List<Categories> categories = category
          .map((catagory) => Categories.fromJson(catagory))
          .cast<Categories>()
          .toList();
      return categories;
    }
    return List();
  }

  Future<List<Categories>> fetchCat6A() async {
    final response =
        await http.get('https://1000ftcables.com/appdata/getcart6A.php');
    if (response.statusCode == 200) {
      List category = json.decode(response.body);

      List<Categories> categories = category
          .map((catagory) => Categories.fromJson(catagory))
          .cast<Categories>()
          .toList();
      return categories;
    }
    return List();
  }

  Future<List<Categories>> fetchCat6() async {
    final response =
        await http.get('https://1000ftcables.com/appdata/getcart6.php');
    if (response.statusCode == 200) {
      List category = json.decode(response.body);

      List<Categories> categories = category
          .map((catagory) => Categories.fromJson(catagory))
          .cast<Categories>()
          .toList();
      return categories;
    }
    return List();
  }

  Future<List<Categories>> fetchCoaxialCable() async {
    final response =
        await http.get('https://1000ftcables.com/appdata/getcoaxialcable.php');
    if (response.statusCode == 200) {
      List category = json.decode(response.body);

      List<Categories> categories = category
          .map((catagory) => Categories.fromJson(catagory))
          .cast<Categories>()
          .toList();
      return categories;
    }
    return List();
  }

  Future<List<Categories>> fetchCableManagment() async {
    final response = await http
        .get('https://1000ftcables.com/appdata/getcablemanagment.php');
    if (response.statusCode == 200) {
      List category = json.decode(response.body);

      List<Categories> categories = category
          .map((catagory) => Categories.fromJson(catagory))
          .cast<Categories>()
          .toList();
      return categories;
    }
    return List();
  }

  Future<List<Categories>> fetchFiberTesting() async {
    final response =
        await http.get('https://1000ftcables.com/appdata/fibertesting.php');
    if (response.statusCode == 200) {
      List category = json.decode(response.body);

      List<Categories> categories = category
          .map((catagory) => Categories.fromJson(catagory))
          .cast<Categories>()
          .toList();
      return categories;
    }
    return List();
  }

  Future<List<Categories>> fetchPatchCords() async {
    final response =
        await http.get('https://1000ftcables.com/appdata/getpatchcords.php');
    if (response.statusCode == 200) {
      List category = json.decode(response.body);

      List<Categories> categories = category
          .map((catagory) => Categories.fromJson(catagory))
          .cast<Categories>()
          .toList();
      return categories;
    }
    return List();
  }

  Future<List<Categories>> fetchSatellite() async {
    final response =
        await http.get('https://1000ftcables.com/appdata/satellite.php');
    if (response.statusCode == 200) {
      List category = json.decode(response.body);

      List<Categories> categories = category
          .map((catagory) => Categories.fromJson(catagory))
          .cast<Categories>()
          .toList();
      return categories;
    }
    return List();
  }

  Future<List<Categories>> fetchTools() async {
    final response = await http
        .get('https://1000ftcables.com/appdata/gettoolsequipment.php');
    if (response.statusCode == 200) {
      List category = json.decode(response.body);

      List<Categories> categories = category
          .map((catagory) => Categories.fromJson(catagory))
          .cast<Categories>()
          .toList();
      return categories;
    }
    return List();
  }
}
