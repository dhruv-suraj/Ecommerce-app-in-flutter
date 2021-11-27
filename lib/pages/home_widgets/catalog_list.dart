import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/home_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';




class CatalogList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount:CatalogModel.items.length,
        itemBuilder: (context,index){
          final catalog=CatalogModel.items[index];
          return InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(
                builder: (context)=>HomeDetailPage(
                    catalog: catalog),
            ),
            ),
              child: CatalogItem(catalog:catalog));
        });
  }
}


class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog}) : assert(catalog!=null) ,super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
              tag:Key(catalog.id.toString()),
                child: Image.network(catalog.image).box.rounded.p8.color(context.canvasColor).make().p16().w40(context)),
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.accentColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    AddToCart(catalog:catalog)
                  ],
                ).pOnly(right: 8)
              ],
            ))
          ],
        )
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

