import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cable/model/Product.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/tab_bar_views/description.dart';
import 'package:flutter_cable/tab_bar_views/share.dart';
import 'package:flutter_cable/screen/cartScreen/cartScreen.dart';
import 'package:flutter_cable/screen/productPages/shopnowScreen.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class Details extends StatefulWidget {
  final String productID;
  final String listPrice;
  final String price;
  final String imgLink;
  Details(this.productID, this.listPrice, this.price,this.imgLink);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  List data = List();
  List feature = List();
  List review = [];
  User user;
  MainModel model;
  Product product;
  

  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _tabController = TabController(vsync: this, length: 2);

    this.fetchData();
    this.fetchFeatures();
    fetchReviews();
    model = ScopedModel.of<MainModel>(context);
    model.getCart(updateCartItem: false);
  }

  // get discount {
  //   return double.parse(widget.listPrice - widget.price);
  // }

  Future<String> fetchData() async {
    var res = await http.get(
        Uri.encodeFull(
            'https://1000ftcables.com/appdata/getProductColor.php?product_id=${widget.productID}'),
        headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });

    return "Sucess";
  }

  Future<String> fetchFeatures() async {
    var res = await http.get(
        Uri.encodeFull(
            'https://1000ftcables.com/appdata/getProductFeatures.php?product_id=${widget.productID}'),
        headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      feature = resBody;
    });

    return "Sucess";
  }

  Future fetchReviews() async {
    final response =
        await http.get('https://1000ftcables.com/appdata/getReviews.php');

    if (response.statusCode == 200) {
      setState(() {
        review = json.decode(response.body);
      });
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Your product added succesfully in cart"),
          actions: <Widget>[
            ScopedModelDescendant(
              builder: (BuildContext context, Widget child, MainModel model) {
                return FlatButton(
                  child: new Text(
                    "View Cart",
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(
                         
                          model: model,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            new FlatButton(
              child: new Text(
                "Continue",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.red,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Shopnow(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  //String _selectedcolor;

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    product = ScopedModel.of<MainModel>(context).getSelectedProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.product),
        backgroundColor: appBarColor,
        // actions: <Widget>[
        //   ScopedModelDescendant(
        //     builder: (BuildContext context, Widget child, MainModel model) {
        //       return IconButton(
        //         onPressed: () => Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => Cart(
        //               model: model,
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
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: _header(),
            ),
            SliverPersistentHeader(
              delegate: CustomSliverDelegate(_tabController),
              pinned: true,
              floating: true,
            ),
          ];
        },
        body: Container(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Description(product.fullDescription),
              // ListView.builder(
              //   itemCount: feature.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Container(
              //       child: Feature(feature[index]['variant']),
              //     );
              //   },
              // ),
              ListView.builder(
                itemCount: review.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Reviews(
                        review[index]['name'], review[index]['message']),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ScopedModelDescendant(
              builder: (BuildContext context, Widget child, MainModel model) {
                return Expanded(
                  child: MaterialButton(
                    color: appBarColor,
                    elevation: 0,
                    onPressed: () {
                      _showDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Add to Cart",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: widget.imgLink +
                product.image,
            placeholder: (context, url) => Container(
              margin: EdgeInsets.all(20),
              child: Container(
                height: 20,
                width: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),

        Container(
          height: 40,
          margin: EdgeInsets.only(
            left: 20,
          ),
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Price: \$" + product.price.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.amber[700],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[700],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[700],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[700],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[700],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          color: Colors.white30,
        ),

        // Container(
        //   margin: EdgeInsets.only(
        //     left: 20,
        //   ),
        //   child: Row(
        //     children: <Widget>[
        //       Text(
        //         "List Price: \$" + product.listPrice.toString(),
        //         style: TextStyle(
        //           fontSize: 13,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.black38,
        //           decoration: TextDecoration.lineThrough,
        //         ),
        //       ),
        //     ],
        //   ),
        //   color: Colors.white30,
        // ),

        Container(
          height: 70,
          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
          child: Text(
            product.product,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          color: Colors.white30,
        ),
      ],
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  TabController _tabController;
  CustomSliverDelegate(this._tabController);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey[50],
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.black,
        tabs: <Widget>[
          Tab(
            child: Text(
              'Description',
              style: TextStyle(color: Colors.black),
            ),
          ),
          // Tab(
          //   child: Text(
          //     'Features',
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          Tab(
            child: Text(
              'Reviews',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
