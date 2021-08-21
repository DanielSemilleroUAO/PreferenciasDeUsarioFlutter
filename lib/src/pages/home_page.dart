import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/pages/settings_page.dart';
import 'package:preferenciasusuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    prefs.setCurrentScreen = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencia de usuario'),
        backgroundColor: (prefs.getColorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              prefs.getColorSecundario ? 'Color secundario' : 'Color primario'),
          Divider(),
          Text('Genero: ${prefs.getGenero == 1 ? 'Masculino' : 'Femenino'}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.getNombre}'),
          Divider()
        ],
      ),
    );
  }

  _crearMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.pages,
              color: Colors.blue,
            ),
            title: Text('Home'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(
              Icons.party_mode,
              color: Colors.blue,
            ),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text('Settings'),
            onTap: () {
              //Navigator.pop(context);
              //Navigator.pushNamed(context, SettingsPage.routeName);
              //Sirve para solo dejar la primera pagina
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
