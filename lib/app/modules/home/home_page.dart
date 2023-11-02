// import 'package:admFlutter/app/modules/usuario/usuario_controller.dart';
//import 'package:admFlutter/app/modules/oracoes/oracoes_controller.dart';
import 'package:admFlutter/app/modules/agenda/agenda_controller.dart';
import 'package:admFlutter/app/modules/oracoes/oracoes_controller.dart';
import 'package:admFlutter/app/shared/cores.service.dart';
import 'package:admFlutter/app/shared/igreja.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  //UsuarioController usuarioController = Modular.get();
  final List<String> imgList = [
    'https://i.pinimg.com/564x/9e/50/37/9e5037732cd2b96da366fbcdd3de3cbe.jpg',
    'https://files.mormonsud.net/wp-content/uploads/2018/07/arr-capa.jpg',
    'https://lh3.googleusercontent.com/proxy/yd8jWdqNk9SWpYQrl6ZTjxRQ-njs46xukLv4p--lSar7rds1saSypUCGyfeomrymhAgKTXAFF3qQol2e2d7zxh0O2u4pdy8t4BFPn3Q_qs2FLhQNLGsMFOUpN7O0coNWGpEYzPjbhZWaCMPNiPZClCPLjWNP4poB1X2xAFmxF4C0KMwukHpxi2c0',
    'https://portalamoregraca.com.br/_site/upload/noticias/o-bom-pastor-331.png',
    'https://image.slidesharecdn.com/obompastor-150607211549-lva1-app6891/95/jesus-o-bom-pastor-1-638.jpg?cb=1433711789',
    'https://espiritanos.pt/wp-content/uploads/2017/11/31-Bom-Pastor.jpg'
  ];
  OracoesController oracoesController = Modular.get();
  AgendaController agendaController = Modular.get();
  CargaIgreja cargaIgreja = Modular.get();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Scaffold(
      backgroundColor: Cores().corErro,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/images/santabarbara.jpg'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.text_fields),
              title: Text('Incluir Artigos'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Gerir artigos'),
              onTap: () {
                Modular.to.pushNamed(
                    '/listadocumentos'); // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Gerir dados de pastorais'),
              onTap: () {
                Modular.to.pushNamed(
                    '/listapastorais'); // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Gerir dados da agenda..'),
              onTap: () {
                print('chamando');
                agendaController.uploadEventos();
                // Modular.to.pushNamed(
                //     '/listadocumentos'); // Update the state of the app.
                // // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Cadastro de profissionais'),
              onTap: () {
                Modular.to.pushNamed(
                    '/listadocumentos'); // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Carregar dados de orações'),
              onTap: () {
                print('vai chamar');
                oracoesController.processarCarga();
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Carregar dados das paróquias'),
              onTap: () {
                print('vai chamar carga de paroquia');
                cargaIgreja.criar();
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Fale conosco'),
              onTap: () {
                Modular.to.pushNamed(
                    '/listadocumentos'); // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Alterar seus dados'),
              onTap: () {
                Modular.to.pushNamed('/datatable');
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 2,
            autoPlay: true,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}
