import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var likes = 0;
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 1 App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarea 1'),
          ),
          body: 
          Column(
            children: [
              Image(image: AssetImage("imagenIteso.jpg"), fit: BoxFit.fill),
              ListTile(
                title: const Text("El ITESO, Universidad Jesuita de Guadalajara"),
                subtitle: const Text("San Pedro, Tlaquepaque, Jal."),
                trailing:MyStatefulWidget(), 
              ),
              BotonesDelMedio(),
              SizedBox(height:50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 600,
                    alignment: Alignment.center,
                    child: const Text(
                      "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México.",
                      overflow: TextOverflow.clip,
                      maxLines: 7,
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Color colorlike = Colors.black;
  Color colordislike = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.thumb_up),
          color: colorlike,
          tooltip: 'Increase likes by 1',
          onPressed: () {
            setState(() {
              likes += 1;
              if(colorlike == Colors.blueAccent){
                colorlike = Colors.black;
              } else {
                colorlike = Colors.blueAccent;
              }
              
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.thumb_down),
          color: colordislike,
          tooltip: 'Decrease likes by 1',
          onPressed: () {
            setState(() {
              likes -= 1;
              if(colordislike == Colors.redAccent){
                colordislike = Colors.black;
              } else {
                colordislike = Colors.redAccent;
              }
            });
          },
        ),
        Text('Likes : $likes',
        style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.6)
        ),
      ],
    );
  }
}

class BotonesDelMedio extends StatefulWidget{
  State<BotonesDelMedio> createState() => BotonesDelMedioState();
}

class BotonesDelMedioState extends State<BotonesDelMedio>{
  Color _iconColorCorreo = Colors.black;
  Color _iconColorCel = Colors.black;
  Color _iconColorRuta = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            color: _iconColorCorreo,
            icon: const Icon(Icons.mail_outline),
            iconSize: 50,
            tooltip: 'Correo',
            onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Correo del Iteso"),
                  duration: const Duration(milliseconds: 1000) ,)
              );
              setState(() {
                if(_iconColorCorreo == Colors.blueAccent){
                _iconColorCorreo = Colors.black;
                } else {
                  _iconColorCorreo = Colors.blueAccent;
                } 
              });
              
          },
          ),
          const Text('Correo')
        ],
      ),
      SizedBox(width: 100,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            IconButton(
              icon: const Icon(Icons.add_call),
              iconSize: 50,
              tooltip: 'Llamada',
              color: _iconColorCel,
              onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Telefono del Iteso"),
                  duration: const Duration(milliseconds: 1000) ,)
              );
              setState(() {
                if(_iconColorCel == Colors.blueAccent){
                _iconColorCel = Colors.black;
                } else {
                  _iconColorCel = Colors.blueAccent;
                } 
              });
          },
          
          ),
          const Text('Llamada')
          ],
        ),
        SizedBox(width: 100,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 50,
              icon: const Icon(Icons.directions_outlined),
              tooltip: 'Ruta',
              color: _iconColorRuta,
              onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Ruta para el ITESO"),
                  duration: const Duration(milliseconds: 1000) ,)
              );
              setState(() {
                if(_iconColorRuta == Colors.blueAccent){
                _iconColorRuta = Colors.black;
                } else {
                  _iconColorRuta = Colors.blueAccent;
                } 
              });
          },
          ),
          const Text('Ruta')
          ],
        ),

      ],
    );
  }
}