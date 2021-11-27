import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';


class AddToCart extends StatelessWidget {

  final Item catalog;

AddToCart({Key key, this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.listen(context,to:[AddMutation,RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    // final CatalogModel _catalog=(VxState.store as MyStore).catalog;
    bool isInCart=_cart.items.contains(catalog);
    return  ElevatedButton(onPressed: () {
      if (!isInCart) {
        // isInCart = isInCart.toggle();
        // final _catalog = CatalogModel();
        // final _cart = CartModel();
        // _cart.catalog = _catalog;
        AddMutation(catalog);
        // _cart.add(catalog);
        // setState(() {
        //
        // });
      }
    },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())
        ),
        child: isInCart?Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus))
    ;
  }
}
