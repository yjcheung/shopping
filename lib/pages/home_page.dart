import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  String  homePageContent = '正在获取数据...';
  
  @override
  void initState() {
    // TODO: implement initState
    getHomePageContent().then((value) => {
      setState((){
        homePageContent = value.toString();
    })
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+'),),
      body: SingleChildScrollView(
        child: Text(homePageContent),
      ),
    );
  }
}

//首页轮播组件
class SwiperDiy extends StatelessWidget {

  final List swiperDataList ;

  SwiperDiy({Key key , this.swiperDataList}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 333,
      child: Swiper(
        itemBuilder: (BuildContext context , int index){
          return Image.network('${swiperDataList[index]['image']}');
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
