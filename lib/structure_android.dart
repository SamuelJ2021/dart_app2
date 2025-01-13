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
      title: 'ma_deuxieme_application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Icon _coeur = Icon(Icons.favorite_border, color: Colors.white);// Color.fromARGB(255, 210, 6, 6),);
  Icon _discord = Icon(Icons.discord, color: const Color.fromARGB(255, 107, 110, 248),);
  bool _likeBool = false;
  int _selectedIndex = 0;
  String _texte = '0: Accueil';
  final List _liste = ['0: Accueil', '1: Mon compte', '2: Statistiques'];
  //String _im = 'Images/RickAstleyMangePavlovaFraisesFenetre.png';

  void _likeThis(){
    setState(() {
      if (_likeBool){
        _coeur = Icon(Icons.favorite_border, color: Colors.white,);
        _likeBool = false;
      }
      else {
        _coeur = Icon(Icons.favorite, color: Colors.red);//const Color.fromARGB(255, 89, 243, 33),);
        _likeBool = true;
      }
    });
  }


  void _likeThat(){
    setState(() {
      if (_likeBool){
        _discord = const Icon(Icons.discord, color: Color.fromARGB(255, 107, 110, 248),);
        _likeBool = false;
      }
      else {
        _discord = const Icon(Icons.discord_sharp, color: Color.fromARGB(255, 33, 187, 243),);
        _likeBool = true;
      }
    });
  }

  void _itemClique(int index){
    setState(() {
      _selectedIndex = index;
      _texte = _liste[index];
      if (index == 1){
        
      }
    });
  }

//Widget Image(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(onPressed: _likeThis, icon: _coeur),
            IconButton(onPressed: _likeThat, icon: _discord)
          ],
          backgroundColor: const Color.fromARGB(100, 0, 0, 0),
        ),
        body: Center(
          //child: Text(_texte)
          child: Column(
            children: [
              Text(_texte),
              Row(
                children: [
                  Image.asset('Images/background1.jpg',scale: 5.5),
                  Text('+'),
                  Image.network('https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS1WEMbAAG6G6oo6E3CA5NNNTXbYyYcQ5AI-juYeD7YAZdQ3G1W')
                  ],
                ),
              Text('='),
              Image.asset('Images/RickAstleyMangePavlovaFraisesFenetre.png', scale:2.5)
              ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[    
            FloatingActionButton(
              onPressed: _likeThis,
              tooltip: 'do this',
              child: const Icon(Icons.umbrella),
              backgroundColor: Colors.green,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded),
              label: 'Mon compte'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ev_station),
              label: 'Statistiques'
            ),
          ],
          onTap: _itemClique,
          currentIndex: _selectedIndex,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue
                  ),
                  child: Text('Drawer Header'),
                ),
              ListTile(
                title: const Text('Met lui un texte pour qu\'on le voit'),
                onTap: (){},
              ),
              ListTile(
                title: const Text('Met lui un texte pour qu\'on le voit encore'),
                onTap: (){},
              ),
              ListTile(
                title: const Text('Met lui un texte pour qu\'on le voit encore encore'),
                onTap: (){},
              ),
              /*ListTile(
                /*Image.network(
                  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS1WEMbAAG6G6oo6E3CA5NNNTXbYyYcQ5AI-juYeD7YAZdQ3G1W"
                  )*/
                onTap: (){},
              ),
              https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS1WEMbAAG6G6oo6E3CA5NNNTXbYyYcQ5AI-juYeD7YAZdQ3G1W
              */
            ],
          ),
        ),
        //
    );
  }
}