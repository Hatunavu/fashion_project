import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/cart/cart.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/local/cart.local.dart';

class CartItemWidget extends StatefulWidget {
  CartModel cartModel;
  bool statusSwitchPage;
  Function getListCart;
  CartItemWidget({this.cartModel, this.statusSwitchPage, this.getListCart});
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return buildItemCart();
  }

  Widget buildItemCart() {
    return Container(
        child: widget.cartModel != null && widget.cartModel.items != null
            ? Column(
                children: List.generate(
                    widget.cartModel.items.length,
                    (index) => Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: Colors.black.withOpacity(.1))),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 60,
                                  width: 60,
                                  margin: EdgeInsets.only(left: 10),
                                  child: Image(
                                    image: widget?.cartModel?.items[index]
                                                    .image !=
                                                null &&
                                            widget?.cartModel?.items[index]
                                                    .image !=
                                                ''
                                        ? NetworkImage(
                                            widget.cartModel.items[index].image)
                                        : Text('No result'),
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(width: 15),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      widget.cartModel?.items[index].title ??
                                          Text('Chưa có'),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  SizedBox(height: 3),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: FlutterMoneyFormatter(
                                                    amount: widget.cartModel
                                                            .items[index].price
                                                            .toDouble() /
                                                        100)
                                                .output
                                                .withoutFractionDigits +
                                            'đ',
                                        style: TextStyle(
                                            color: Color(0xFF86744e),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14)),
                                  ]))
                                ],
                              )),
                              actionCartItem(widget.cartModel.items[index])
                            ],
                          ),
                        )))
            : Container());
  }

  Widget actionCartItem(CartItem cartItem) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () async {
            if (cartItem.quantity <= 1) {
              await showAlert('Xóa sản phẩm',
                  'Bạn có chắc muốn xóa sản phẩm này không?', cartItem);
            } else {
              await CartLocal().saveCart(cartItem, false);
              widget.getListCart();
            }
          },
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFF86744e),
                borderRadius: BorderRadius.circular(50)),
            child: Icon(
              Icons.remove,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          cartItem.quantity.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap: () async {
            await CartLocal().saveCart(cartItem, true);
            widget.getListCart();
          },
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFF86744e),
                borderRadius: BorderRadius.circular(50)),
            child: Icon(
              Icons.add,
              size: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  showAlert(String title, String description, CartItem cartItem) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(description),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    return false;
                  },
                  child: Text('Đóng')),
              FlatButton(
                  onPressed: () async {
                    await CartLocal().saveCart(cartItem, false);
                    widget.getListCart();
                    Navigator.pop(context);
                  },
                  child: Text('Xoá'))
            ],
          );
        });
  }
}
