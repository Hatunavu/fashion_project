import 'package:flutter/material.dart';
import 'package:footer/footer_view.dart';
import 'package:suplo_project_8_12_2020/app/blocs/footer/footer.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/footer/footer.provider.dart';


class FooterPage extends StatefulWidget {
  String url;
  FooterPage({this.url});
  @override
  _FooterPageState createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> {

  FooterModel footer;

  @override
  void initState() {
    // TODO: implement initState
    getFooter();
    super.initState();
  }

  getFooter() async {
    footer = await FooterProvider().getFooter(widget.url);
    if(this.mounted){
      setState(() {
        footer=footer;
      });
      if(footer!=null){}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1000,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(footer?.bgImage?.image ),
          fit: BoxFit.fitHeight)
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(footer?.information?.imageLogo)
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
    );
  }
}