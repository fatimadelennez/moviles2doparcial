import 'package:flutter/material.dart';
import 'package:movies_info_app/HttpHelper.dart';

class home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<home>{
  String result;
  HttpHelper helper;

  @override
  void initState(){
    helper = new HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    helper.getMovieList().then(
        (json){
          setState(() {
            result = json;
          });
        }
    );

    return Container(
        child: Text(result)
    );
  }


}