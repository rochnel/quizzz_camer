import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzcamer/widgets/customText.dart';
import 'package:quizzcamer/models/Questions.dart';

class PageQuizz extends StatefulWidget{
  _PageQuizzState createState() => new _PageQuizzState();
}
class _PageQuizzState extends State<PageQuizz>{
  Question question;
  List<Question> listeQuestions = [
    new Question('La capitale economique du cameroun est Douala et capitale politique est yaounder', true, 'La capitale economique du cameroun est Douala et capitale politique est yaounder', 'capital.jpg'),
    new Question('Le premier president camerounais est Paul Biya', false, 'Le premier President camerounais est Amadou haidjo', 'president.jpg'),
    new Question('Le cameroun et un pays Bilingue (anglais/espagnol)', false, 'Le cameroun et un pays Bilingue (anglais/francais)', 'langue.jpg'),
    new Question('la superficie du cameroun est de 475 442 km²', true, 'la superficie du cameroun est de 475 442 km²', 'superficie.jpg'),
    new Question('Le cameroun Compte 30 000 000 habitants en 2019 ', false, 'Le cameroun Compte 20 000 000 habitants en 2019 ', 'population.jpg')
  ];
  int index = 0;
  int score = 0;
  @override
  void initState(){
    super.initState();
    question = listeQuestions[index];
  }

  @override
  Widget build(BuildContext context) {
    double taille = MediaQuery.of(context).size.width * 0.7;
    return Scaffold(
      appBar: new AppBar(
        title: new CustomText("Le Quizz",),
        centerTitle: true,
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new CustomText("Question numéro ${index + 1}", color: Colors.grey[900]),
            new CustomText("Score: $score / $index", color: Colors.grey[900],),
            new Card(
              elevation: 10.0,
              child: new Container(
                height: taille,
                width: taille,
                child: new Image.asset("assets/${question.imagePath}",
                    fit: BoxFit.cover,
                ),
              ),
            ),
            new CustomText(question.question, color: Colors.grey[900], factor: 1.3,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonBool(true),
                buttonBool(false)
              ],
            )
          ],
        ),
      ),
    );
  }
  RaisedButton buttonBool (bool b){
    return new RaisedButton(
      elevation: 10.0,
      onPressed: (() => dialogue(b)),
      color: Colors.blue,
      child: new CustomText((b)? "Vrai": "Faux", factor: 1.25,),
    );
  }
  Future<Null> dialogue(bool b) async{
    bool bonneReponse = (b == question.reponse);
    String vrai = "assets/gagner.jpg";
    String faux = "assets/perdu.jpg";
    if(bonneReponse){
      score++;
    }
    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
          return new SimpleDialog(
            title: new CustomText((bonneReponse)? "C'est gagné!": "Oups! perdu...", factor: 1.4, color: (bonneReponse)? Colors.green: Colors.red,),
            contentPadding: EdgeInsets.all(20.0),
            children: <Widget>[
              new Image.asset((bonneReponse)? vrai: faux, fit: BoxFit.cover,),
              new Container(height: 25.0,),
              new CustomText(question.explication, factor: 1.25, color: Colors.grey[900],),
              new Container(height: 25.0,),
              new RaisedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    questionSuivante();
                  },
              child: new CustomText("Au suivant", factor: 1.25,),
                color: Colors.blue,
              )
            ],
          );
      }
    );
  }
  Future<Null> alert() async{
    return showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext){
      return new AlertDialog(
        title: new CustomText("C'est fini", color: Colors.blue, factor: 1.25,),
        contentPadding: EdgeInsets.all(10.0),
        content: new CustomText("Votre score: $score / $index", color: Colors.grey[900],),
        actions: <Widget>[
          new FlatButton(
              onPressed: (){
                Navigator.pop(buildContext);
                Navigator.pop(context);
              },
              child: new CustomText("OK", factor: 1.25, color: Colors.blue,)
          )
        ],
      );
      }
    );
  }
  void questionSuivante(){
    if(index < listeQuestions.length){
      index++;
      setState(() {
        question = listeQuestions[index];
      });
    }else{
      alert();
    }
  }
}