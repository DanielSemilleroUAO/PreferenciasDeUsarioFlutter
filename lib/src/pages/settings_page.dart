import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _colorSecundario;
  late int _genero;
  late String _nombre;

  late TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefs.setCurrentScreen = SettingsPage.routeName;
    _nombre = prefs.getNombre;
    _genero = prefs.getGenero;
    _colorSecundario = prefs.getColorSecundario;
    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) {
                  _colorSecundario = value;
                  prefs.setColorSecundario = _colorSecundario;
                  setState(() {});
                }),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el telefono'),
                onChanged: (value) {
                  prefs.setNombre = value;
                },
              ),
            )
          ],
        ));
  }

  void _setSelectRadio(int? value) async {
    _genero = value ?? 1;
    prefs.setGenero = _genero;
    setState(() {});
  }
}
