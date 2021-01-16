import 'package:flutter/material.dart';
// import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/cart/cart.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/cart/cart.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/local/cart.local.dart';
import 'package:suplo_project_8_12_2020/utilities/money.utilities.dart';

class CartItemWidget extends StatefulWidget {
  CartItem cartItem;
  int quantity = 0;
  CartItemWidget({this.cartItem, this.quantity});
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
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(width: 1, color: Colors.black.withOpacity(.1))),
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
                image: widget?.cartItem.image != null &&
                        widget?.cartItem.image != ''
                    ? NetworkImage(widget.cartItem.image)
                    : Text('No result'),
                fit: BoxFit.cover,
              )),
          SizedBox(width: 15),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.cartItem.title ?? Text('Chưa có'),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: 3),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: MoneyFormat.formatCurrency(widget.cartItem.price),
                    style: TextStyle(
                        color: Color(0xFF86744e),
                        fontWeight: FontWeight.w700,
                        fontSize: 14)),
              ]))
            ],
          )),
          actionCartItem(widget.cartItem)
        ],
      ),
    ));
  }

  Widget actionCartItem(CartItem cartItem) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () async {
            if (widget.quantity > 1) {
              cartBloc.updateItem(widget.cartItem.id, -1);
            } else {
              showAlert(
                  'Xóa sản phẩm', 'Bạn có chắc muốn xóa sản phẩm này không?');
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
          onTap: () {
            cartBloc.updateItem(widget.cartItem.id, 1);
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

  showAlert(String title, String description) {
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
                  },
                  child: Text('Đóng')),
              FlatButton(
                  onPressed: () {
                    cartBloc.removeItem(widget.cartItem.id);
                    Navigator.pop(context);
                  },
                  child: Text('Xoá'))
            ],
          );
        });
  }
}
