import 'package:flutter/material.dart';
import 'package:flutter_cable/model/Categories.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/productPages/AllProductsScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class FiberTestingTool extends StatefulWidget {
  @override
  _FiberTestingToolState createState() => _FiberTestingToolState();
}

class _FiberTestingToolState extends State<FiberTestingTool> {
  
  void initState() {
   
    super.initState();
  }

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fiber Testing Tools"),
        ),
        body: FutureBuilder(
        future:
            ScopedModel.of<MainModel>(context).fetchFiberTesting(),
        builder: (_, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? buildList(context, snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
       
    );
  }

   Widget buildList(BuildContext context, List<Categories> categories) {
    if (categories.length == 0) {
      return Center(
        child: Text('No Products available.'),
      );
    } else {
      return  ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllProducts(
                      categories[index].categoryId,
                      categories[index].categoryTitle,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 5,
                      ),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        categories[index].categoryName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                       child: Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
     }
   }
}
