import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samuel',
      theme: ThemeData(
        // This is the theme of your application.
        //
        //
        colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 0, 0, 255)),//Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'E5 Samuel Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  
  final _couleur1 = const Color.fromARGB(255, 190, 235, 255);
  final _couleur2 = const Color.fromARGB(255, 207, 213, 33);
  var _couleur = const Color.fromARGB(255, 190, 235, 255);
  final TextStyle _tS = const TextStyle(color: Color.fromARGB(255, 0, 42, 255), fontSize: 18);
  final TextStyle _tSX = const TextStyle(color: Color.fromARGB(255, 255, 0, 0), fontSize: 42, fontWeight: FontWeight.bold);
  //int _fS = 18;
  int _counter = 10;
  var _phrase = const Text("Clic avant l'explosion");//
  TextEditingController usernameController = TextEditingController(); // Il va stocker username
  TextEditingController passwordController = TextEditingController(); // Il va stocker password

  Text _username = Text('');
  Text _password = Text('');

  void _message(){
    if (_counter > 0){
      _phrase = Text("Clic avant l'explosion", style: _tS);
      _couleur = _couleur1;
    }else{
      _phrase = Text("BOUM", style: _tSX,);
      _couleur = _couleur2;
    }
    //_tS.fontSize ++;
  }

void _incrementCounter() {
    setState(() {
      //
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter-=1;
    });
  }

  void _incrementCounterLimited(){//int maximum){
    int maximum = 100;
    if (_counter < maximum){
      _incrementCounter();
    }
    _message();
  }

  void _decrementCounterPositive(){
    if (_counter > 0){
      _decrementCounter();
    }
    _message();
  }

  

void _getinfo(){
  _username = Text(usernameController.text);
  _password = Text(passwordController.text);
  print(_username);
  print(_password);
  // print([usernameController.text, passwordController.text]);
}
// void _isvalid(){
//   if (){

//   }
//   print('Incorrect');
// }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    //
    return Scaffold(
      appBar: AppBar(
        //
        backgroundColor: const Color.fromARGB(255, 80, 163, 219),//Theme.of(context).colorScheme.inversePrimary,
        //
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          //
          //
          //
          //
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Username'),
            TextFormField(  // Un champ de texte
              controller: usernameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
              //textAlign: Center,
            ),
            const Text('Password'),
            TextFormField(  // Un champ de texte// https://stackoverflow.com/questions/49125064/how-to-show-hide-password-in-textformfield
            //keyboardType: TextInputType.text,
            controller: passwordController,
            obscureText: true,//!_passwordVisible,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your password',
              ),
              //textAlign: Center,
            ),
            //Text('Validate'),
            FloatingActionButton(
              onPressed: _getinfo,
              tooltip: 'Validate',
              backgroundColor: Colors.green,
              child: const Icon(Icons.check),
            ),

            // _username,
            // _password,

            // //
            // _phrase,
            // Text(
            //   '$_counter',
            //   style: _tS,
            // ),
          ],
        ),
      ),
      //
      floatingActionButton: Row(
          //
          //
          //
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _decrementCounterPositive,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: _incrementCounterLimited,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
      backgroundColor: _couleur,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}