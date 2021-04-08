import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:flutter_covid_dashboard_ui/widgets/widgets.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String _contatoDias = 'linkedin.com/in/filypsdias';
  String _nomeDias = 'Desenvolvedor Filipe Dias';
  String _imageDias = 'https://media-exp1.licdn.com/dms/image/C4E03AQHjO_gfnjGd8g/profile-displayphoto-shrink_200_200/0/1603659841322?e=1622678400&v=beta&t=0NRVNtOPb370Yed-KqiPz5HWmCthtj2fK7Ywb-RPhAg';

  String _contatoJoao = 'linkedin.com/in/joao4018';
  String _nomeJoao = 'Desenvolvedor  João Carlos';
  String _imageJoao = 'https://media-exp1.licdn.com/dms/image/C4E03AQFpsmOQ9_LiOA/profile-displayphoto-shrink_200_200/0/1596504330579?e=1622678400&v=beta&t=CPl59zUWlCpRIBE4ocJkq5H0FBe-KtcfXFHacUQmTeU';

  String _contatoWander = 'linkedin.com/in/Wander';
  String _nomeWander = 'Orientador Wander Cleber';
  String _imageWander = 'https://media-exp1.licdn.com/dms/image/C4D0BAQEBKZtnieRY7g/company-logo_200_200/0/1596467791778?e=1625702400&v=beta&t=sXw4LOTbX6c-Z4kwel61czwFHTG_RXuRtiaT8TXe4w4';


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildYourOwnTestW(screenHeight, _nomeWander, _contatoWander, _imageWander),
          _buildYourOwnTest(screenHeight, _nomeDias, _contatoDias, _imageDias),
          _buildYourOwnTest(screenHeight, _nomeJoao, _contatoJoao, _imageJoao),
        ],
      ),
    );
  }


  SliverToBoxAdapter _buildYourOwnTest(double screenHeight, String nome, String contato, String image) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 17.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.20,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "$image")
                  )
              ),
            ),
            SizedBox(width: screenHeight * 0.02),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$nome!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Desenvolvedor MyHabits \nContato para suporte\n$contato',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                  maxLines: 3,
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
  SliverToBoxAdapter _buildYourOwnTestW(double screenHeight, String nome, String contato, String image) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.20,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "$image",)
                  )
              ),
            ),
            SizedBox(width: screenHeight * 0.02),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$nome!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Orientador MyHabits \nContato para suporte\n$contato',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                  maxLines: 3,
                ),
              ],
            )
          ],
        ),
      ),
    );

  }

}
