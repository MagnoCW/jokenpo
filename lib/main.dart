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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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

  void _escolhaDoApp(jokenpo) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                  _escolhaDoApp(pedra);
                }, 
                  child: Image.asset(
                    pedra,
                    width: 100,
                    height: 100,
                  ),
                ),         
                TextButton(onPressed: () {
                  _escolhaDoApp(papel);
                }, 
                  child: Image.asset(
                    papel,
                    width: 100,
                    height: 100,
                  ),
                ),
                TextButton(onPressed: () {
                  _escolhaDoApp(tesoura);
                }, 
                  child: Image.asset(
                    tesoura,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
