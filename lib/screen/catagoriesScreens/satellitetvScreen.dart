import 'package:flutter/material.dart';
import 'package:flutter_cable/model/Categories.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/productPages/AllProductsScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class SatelliteTVAccessories extends StatefulWidget {
  @override
  _SatelliteTVAccessoriesState createState() => _SatelliteTVAccessoriesState();
}

class _SatelliteTVAccessoriesState extends State<SatelliteTVAccessories> {
  
  void initState() {
    
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Satellite TV Accessories"),
        ),
         body: FutureBuilder(
        future:
            ScopedModel.of<MainModel>(context).fetchSatellite(),
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
                  // Expanded(
                  //   flex: 1,
                  //   child: Column(
                  //     children: <Widget>[
                  //       Container(
                  //         margin: const EdgeInsets.only(right: 0, left: 0),
                  //         child: Image.network(
                  //                   'https://www.1000ftcables.com/images/detailed/2/DP21_Dish_Network_Multi_Switch.jpg?t=1476377520',
                  //                   width: 100,
                  //                   height: 100,
                  //                 ),
                  //       )
                  //     ],
                  //   ),
                  // ),
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
