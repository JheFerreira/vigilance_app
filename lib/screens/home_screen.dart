import 'package:app_vigilance/model/form_open_house_model.dart';
import 'package:app_vigilance/screens/list_closed_house_screen.dart';
import 'package:app_vigilance/screens/list_open_house_screen.dart';
import 'package:app_vigilance/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../databases/file_persistence.dart';
import '../helper/post_login_helper.dart';
import '../model/form_closed_house_model.dart';
import '../model/post_login_model.dart';
import '../widgets/custom_curve_clipper.dart';
import 'form_closed_house_screen.dart';
import 'form_open_house_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late Future<List<PostLogin>> _posts;
  final PostLoginHelper _helper = PostLoginHelper();
  List<FormOpenHouse> _newFormOpenHouse = List.empty(growable: true);
  List<FormClosedHouse> _newFormClosedHouse = List.empty(growable: true);
  final FilePersistence _filePersistence = FilePersistence();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (await _helper.isUserLogged()) {}
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    print("Build Tela Home");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 1, 145, 202),
              Color.fromARGB(255, 1, 145, 202),
            ],
          ),
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () async {
              try {
                await Navigator.push(
                  context, // transição da tela menu para login
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              } catch (error) {
                print("Error: ${error.toString()}");
              }
            },
          ),
        ],
      ),
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 1, 145, 202),
                  Color.fromARGB(255, 141, 214, 243),
                ],
              )),
              accountName: Text(
                "Yasmim Cunha",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              accountEmail: Text(
                "yasmim@gmail.com",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.values
                        ? Color.fromARGB(255, 141, 214, 243)
                        : Colors.white,
                child: Text(
                  "Y",
                  style: TextStyle(fontSize: 40.0, color: Colors.yellow[500]),
                ),
              ),
            ),
            //const Divider(color: Colors.black54),

            ListTile(
              leading: Icon(Icons.home_outlined, color: Colors.lightBlueAccent),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent),
              ),
              onTap: () async {
                try {
                  await Navigator.push(
                    context, // transição da tela menu para home
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } catch (error) {
                  print("Error: ${error.toString()}");
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.list, color: Colors.lightBlueAccent),
              title: Text(
                'Lista Casas Abertas',
                style: TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent),
              ),
              onTap: () async {
                try {
                  await Navigator.push(
                    context, // transição da tela menu para lista casa aberta
                    MaterialPageRoute(
                      builder: (context) => ListOpenHouseScreen(),
                    ),
                  );
                } catch (error) {
                  print("Error: ${error.toString()}");
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.list, color: Colors.lightBlueAccent),
              title: Text(
                'Lista Casas Fechadas',
                style: TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent),
              ),
              onTap: () async {
                try {
                  await Navigator.push(
                    context, // transição da tela menu para lista casa fechada
                    MaterialPageRoute(
                      builder: (context) => ListClosedHouseScreen(),
                    ),
                  );
                } catch (error) {
                  print("Error: ${error.toString()}");
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.lightBlueAccent),
              title: Text(
                'Configurações',
                style: TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colors.lightBlueAccent),
              title: Text(
                'Segurança',
                style: TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.close, color: Colors.lightBlueAccent),
              title: Text(
                'Sair',
                style: TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent),
              ),
              onTap: () async {
                try {
                  await Navigator.push(
                    context, // transição da tela menu para login
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                } catch (error) {
                  print("Error: ${error.toString()}");
                }
              },
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: media.height,
            width: double.infinity,
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                ClipPath(
                  clipper: CustomCurveClipper(),
                  child: Container(
                    width: media.width,
                    height: media.height * .50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 1, 145, 202),
                          Color.fromARGB(255, 141, 214, 243),
                        ],
                      ),
                    ),
                    // child: InkWell(
                    //   onTap: () {
                    //     Get.toNamed('/login');
                    //   },
                    //   // highlightColor: Colors.green.withOpacity(0.5),
                    //   // borderRadius: BorderRadius.circular(10),
                    //   // radius: 10,
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 12, horizontal: 24),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //     child: Icon(
                    //       Icons.close,
                    //       size: 30,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/agentes.png',
                            width: 400,
                          )),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  width: media.width,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    alignment: Alignment.center,
                    child: Text(
                      'LOOKOUT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: media.height * .5,
                  width: media.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 50,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              try {
                                Navigator.push(
                                  context, // transição da tela home para a tela cadastro casa aberta
                                  MaterialPageRoute(
                                    builder: (context) => FormOpenHouseScreen(),
                                  ),
                                );
                              } catch (error) {
                                print("Error: ${error.toString()}");
                              }
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              height: 145,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(146, 1, 150, 250),
                                    offset: Offset(1, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(children: [
                                buildButtom1(),
                                Divider(
                                  color: Colors.grey,
                                  height: 1,
                                ),
                              ]),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              try {
                                FormClosedHouse? formClosedHouse =
                                    await Navigator.push(
                                  context, // transição da tela home para a tela cadastro casa fechada
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FormClosedHouseScreen(),
                                  ),
                                );
                                if (formClosedHouse != null) {
                                  setState(() {
                                    _newFormClosedHouse.add(formClosedHouse);
                                    _filePersistence
                                        .saveData(_newFormOpenHouse);

                                    const SnackBar snackBar = SnackBar(
                                      content:
                                          Text("Cadastro gravado com sucesso!"),
                                      backgroundColor:
                                          Color.fromARGB(255, 10, 182, 39),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  });
                                }
                              } catch (error) {
                                print("Error: ${error.toString()}");
                              }
                            },
                            child: Container(
                              height: 145,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(146, 1, 150, 250),
                                    offset: Offset(1, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(children: [
                                buildButtom2(),
                                Divider(
                                  color: Colors.grey,
                                  height: 1,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildButtom1() {
  return Expanded(
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                    // width: 50,
                    height: 80,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/casa.png',
                      width: 120,
                    )),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Casa Aberta',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildButtom2() {
  return Expanded(
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  // width: 50,
                  height: 80,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/casa.png',
                    width: 120,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Casa Fechada',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
