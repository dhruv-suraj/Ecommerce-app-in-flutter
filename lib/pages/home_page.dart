import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final url="https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState(){
    super.initState();
    loadData();
  }


  loadData()async{
    await Future.delayed(Duration(seconds: 2));
    final catalogjson=await rootBundle.loadString("assets/files/catalog.json");
    // final response=await http.get(Uri.parse(url));
    // final catalogjson=response.body;
    final decodedData=jsonDecode(catalogjson);
    var productsData=decodedData["products"];
    CatalogModel.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {

    });

  }
  Widget build(BuildContext context) {
    final _cart=(VxState.store as MyStore).cart;
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation,RemoveMutation},
          builder:(context,_)=> FloatingActionButton(
            onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart,color: Colors.white,),
          ).badge(
            color:Vx.red500,
            size: 22,
            count:_cart.items.length,
            textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
          ),
        ),
        body:Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
        ],
        )
      ),
    ));
  }
}







// Padding(
// padding: const EdgeInsets.all(16.0),
// child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty) ?GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 16,
// crossAxisSpacing: 16),
// itemBuilder: (context,index){
// final item=CatalogModel.items[index];
// return Card(
// clipBehavior: Clip.antiAlias,
// shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular (12)),
// child: GridTile(
// header: Container(
// child: Text(item.name,style: TextStyle(color: Colors.white),),
// padding: EdgeInsets.all(12),
// decoration: BoxDecoration(
// color: Colors.blue,
// ),),
// child:Image.network(item.image),
// footer: Container(
// padding: EdgeInsets.all(12),
// child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
// color: Colors.black,),
// )
// );
// },
// itemCount: CatalogModel.items.length,
//
// ):Center(child: CircularProgressIndicator()),
// ),
// drawer: MyDrawer(),



// Padding(
// padding: const EdgeInsets.all(16.0),
// child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty) ?ListView.builder(
// itemCount:CatalogModel.items.length,
// itemBuilder: (context,index){
// return ItemWidget(
// item: CatalogModel.items[index],
// );
// },
// ):Center(child: CircularProgressIndicator()),
// ),