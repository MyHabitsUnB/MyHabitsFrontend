import 'package:flutter/material.dart';
import 'NameUser.dart';

class WelcomePage extends StatelessWidget {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xfff5faf6),
      body: DefaultTabController(
        length: choices.length,
        initialIndex: 0,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: IconTheme(
                    data: IconThemeData(
                      size: 128.0,
                      color: Theme.of(context).accentColor,
                    ),
                    child: TabBarView(
                      children: choices.map((Choice choice) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ChoiceCard(choice: choice),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    TabPageSelector(
                      color: Colors.white,
                      selectedColor: Colors.orange,
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Container(
                      alignment: Alignment(0.0, 0.9),
                      padding: EdgeInsets.all(20.0),
                      child: ButtonTheme(
                          minWidth: 100.0,
                          height: 60.0,
                          child: RaisedButton(
                            child: Text(
                              'Próximo',
                              style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              final TabController controller =
                              DefaultTabController.of(context);

                              if(this.index == 2) {
                                /*if (!controller.indexIsChanging) {
                                  controller.animateTo(choices.length - 1);
                                }*/
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => NameUser()));
                              } else {
                                DefaultTabController.of(context).animateTo(this.index + 1);
                                this.index = this.index + 1;
                              }

                            },
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.text, this.imageFile, this.description});

  final String text;
  final String description;
  final imageFile;
}

const String text1 = "Adote um estilo\n de vida saudável";
const String text2 = "Aperfeiçoe sua\n rotina de estudos";
const String text3 = "Medite e descanse com MyHabits";

const List<Choice> choices = const <Choice>[
  const Choice(
      text: text1,
      imageFile: "assets/images/undraw_Dog_walking.png",
      description:
          'Utilize MyHabits e acompanhe o\n andamento de suas atividades de onde estiver.'),
  const Choice(
      text: text2,
      imageFile: "assets/images/undraw_studying.png",
      description:
          'Estamos aprimorando o app, em breve você\n vai poder fazer tudo por aqui. Aguarde!'),
  const Choice(
      text: text3,
      imageFile: "assets/images/undraw_mindfulness.png",
      description:
          'Programe seu calendário aqui no app para sempre separar um tempo do seu dia para lembrar '),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Image.asset(
            choice.imageFile,
            fit: BoxFit.cover,
            height: 300.0,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Text(
              choice.text,
              style: const TextStyle(
              color: Colors.black,
              fontSize: 25.0,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )),
          SizedBox(
            height: 1,
          ),
          Expanded(
              child: Text(
              choice.description,
              style: const TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              //fontWeight: FontWeight.bold,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
