import 'package:flutter/material.dart';
import 'package:flutter_cable/model/Product.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/productPages/detailsPageScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class AllProducts extends StatefulWidget {
  final String categoryId;
  final String title;

  AllProducts(this.categoryId, this.title);
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      //   actions: <Widget>[
      //   ScopedModelDescendant(
      //     builder: (BuildContext context, Widget child, MainModel model) {
      //       return IconButton(
      //         onPressed: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => Cart(
      //               model:   model,
      //             ),
      //           ),
      //         ),
      //         icon: Icon(
      //           Icons.add_shopping_cart,
      //           color: Colors.white,
      //           size: 30,
      //         ),
      //       );
      //     },
      //   )
      // ]
       // bottom: _searchBar(),
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
          return Card(
            child: GestureDetector(
              onTap: () {
                ScopedModel.of<MainModel>(context).selectProduct(
                  products[index],
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(products[index].productId,
                        products[index].listPrice, products[index].price),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[
                    //     Container(
                    //   padding: EdgeInsets.only(top: 5),
                    //   margin: EdgeInsets.only(right: 5, left: 5),
                    //   child: CachedNetworkImage(
                    //     imageUrl: 'https://www.1000ftcables.com/images/detailed/2/'+ products[index].image,
                    //     placeholder: (context, url) => Container(
                    //       margin: EdgeInsets.all(20),
                    //       child: Container(
                    //         height: 70,
                    //         width: 70,
                    //         child: CircularProgressIndicator(
                    //           valueColor: AlwaysStoppedAnimation(Colors.white),
                    //           backgroundColor: Color(0xffe16a56),
                    //         ),
                    //       ),
                    //     ),
                    //     errorWidget: (context, url, error) => Icon(Icons.error),
                    //   ),
                    // ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(right: 0, left: 0),
                      child: Image.network(
                        'https://www.1000ftcables.com/images/detailed/2/' +
                                    products[index].image ==
                                null
                            ? 'https://www.1000ftcables.com/images/thumbnails/225/170/detailed/0/cat6shielded.gif'
                            : 'https://www.1000ftcables.com/images/detailed/2/' +
                                products[index].image,
                        width: 80,
                        height: 90,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            products[index].product,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                   
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: <Widget>[
                    //     Container(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Text(
                    //             "\$" + products[index].listPrice.toString(),
                    //             style: TextStyle(
                    //               fontSize: 13,
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.black,
                    //               decoration: TextDecoration.lineThrough,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                   
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "\$" + products[index].price.toString(),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        // Container(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: <Widget>[
                        //       Icon(
                        //         Icons.star,
                        //         color: Colors.amber[700],
                        //       ),
                        //       Icon(
                        //         Icons.star,
                        //         color: Colors.amber[700],
                        //       ),
                        //       Icon(
                        //         Icons.star,
                        //         color: Colors.amber[700],
                        //       ),
                        //       Icon(
                        //         Icons.star,
                        //         color: Colors.amber[700],
                        //       ),
                        //       Icon(
                        //         Icons.star,
                        //         color: Colors.amber[700],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: <Widget>[

                    //     Container(
                    //        child: Text(
                    //         ((double.parse(products[index].listPrice) - double.parse(products[index].price)) / double.parse(products[index].listPrice) * 100).toString(),

                    //         style: TextStyle(
                    //           fontSize: 13,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  // _searchBar(BuildContext context, List<Product> products) {
  //   return PreferredSize(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Card(
  //         shape: BeveledRectangleBorder(
  //           borderRadius: BorderRadius.circular(
  //             10,
  //           ),
  //         ),
  //         child: TextField(
  //           cursorColor: Colors.red,
  //           decoration: InputDecoration(
  //             hintText: 'Search Here',
  //             border: InputBorder.none,
  //             icon: IconButton(
  //               icon: Icon(Icons.search),
  //               color: Colors.red,
  //               onPressed: () {},
  //             ),
  //           ),
  //           onChanged: (text) {
  //             text = text.toLowerCase();
  //             setState(() {
  //               _notesForDisplay = _notes.where((note) {
  //                 var noteTitle = note.product.toLowerCase();
  //                 return noteTitle.contains(text);
  //               }).toList();
  //             });
  //           },
  //         ),
  //       ),
  //     ),
  //     preferredSize: Size.fromHeight(40),
  //   );
  // }
}
