import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cable/model/Product.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/productPages/detailsPageScreen.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:scoped_model/scoped_model.dart';

class AllProducts extends StatefulWidget {
  final String categoryId;
  final String title;
  final String imgLink;

  AllProducts(this.categoryId, this.title, this.imgLink);
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: appBarColor,
       
      ),
      body: FutureBuilder(
        future:
            ScopedModel.of<MainModel>(context).fetchProducts(widget.categoryId),
        builder: (_, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? buildGrid(context, snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildGrid(BuildContext context, List<Product> products) {
    if (products.length == 0) {
      return Center(
        child: Text('No Products available.'),
      );
    } else {
      return GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                ScopedModel.of<MainModel>(context).selectProduct(
                  products[index],
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(products[index].productId.toString(),
                        products[index].listPrice, products[index].price,widget.imgLink),
                  ),
                );
              },
              child: Card(
                elevation: 4.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 180,
                        child: CachedNetworkImage(
                          imageUrl: widget.imgLink +
                                  products[index].image,
                          placeholder: (context, url) => Container(
                            margin: EdgeInsets.all(20),
                            child: Container(
                              height: 20,
                              width: 50,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              products[index].product,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Text(
                                'Price:\$' + products[index].price.toString(),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }
  }
}
