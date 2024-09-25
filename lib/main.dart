import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'JoKenPo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String padrao = 'lib/images/padrao.png';
  String pedra = 'lib/images/pedra.png';
  String papel = 'lib/images/papel.png';
  String tesoura = 'lib/images/tesoura.png';

  String? jokenpo;
  bool _bool = true;

  void _jogar(bool ganhar) {
    if (ganhar) {
      _appGanha();
    } else {
      _appPerde();
    }
  }

  void _appGanha() {
    setState(() {
      if (jokenpo == pedra){
        padrao = papel;
      } else if (jokenpo == papel) {
        padrao = tesoura;
      } else {
        padrao = pedra;
      }
    });
  }

  void _appPerde () {
    setState(() {
      if (jokenpo == pedra){
        padrao = tesoura;
      } else if (jokenpo == papel) {
        padrao = pedra;
      } else {
        padrao = papel;
      }
    });
  }

  void _reiniciarAppGanha(bool ganha) {
    setState(() {
      padrao = 'lib/images/padrao.png';
      _bool = ganha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(
              'Escolha do App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Image.asset(
              padrao,
              width: 120,
              height: 120,
            ),
            SizedBox(height: 20,),
            Text(
              'Escolha o seu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {
                  jokenpo = pedra;
                  _jogar(_bool);
                }, 
                  child: Image.asset(
                    pedra,
                    width: 100,
                    height: 100,
                  ),
                ),         
                TextButton(onPressed: () {
                  jokenpo = papel;
                  _jogar(_bool);
                }, 
                  child: Image.asset(
                    papel,
                    width: 100,
                    height: 100,
                  ),
                ),
                TextButton(onPressed: () {
                  jokenpo = tesoura;
                  _jogar(_bool);
                }, 
                  child: Image.asset(
                    tesoura,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100,),
            Listener(
              onPointerDown: (PointerDownEvent event) {
                if (event.buttons == 1) {
                  _reiniciarAppGanha(true);
                } else if (event.buttons == 2) {
                  _reiniciarAppGanha(false);
                }
              },
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.orange), // Define a cor de fundo do botão
                  padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 24, vertical: 12)), // Adiciona um padding
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0), // Define as bordas arredondadas
                    ),
                  ),
                ),
                onPressed: () {
                }, 
                child: Text(
                  'Reiniciar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}