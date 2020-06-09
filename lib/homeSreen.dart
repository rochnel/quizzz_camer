import 'package:flutter/material.dart';
import 'package:quizzcamer/widgets/page_quizz.dart';

class HomeSreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSreenState();
  }
}
class HomeSreenState extends State<HomeSreen>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Stack(

        children: <Widget>[

          Center(
            child: new Image.asset('assets/home.jpg',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
            )
          ),
          Center(
          child: new Image.asset('assets/quizz.PNG'),
          ),

          Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 450)),
              Text(
                "Amuser vous tout en apprenent sur le cameroun. \n l'afrique en miniature.",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 600)),
              Container(
                //padding: EdgeInsets.only(top: 20),
                width: size.width,
                height: 50,
                child: RaisedButton(onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                    return new PageQuizz();
                  }));
                },
                  elevation: 2,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Text("COMMENCER LE QUIZZ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
