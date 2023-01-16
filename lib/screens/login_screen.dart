import 'package:app_vigilance/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../helper/post_login_helper.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _passVisible = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final PostLoginHelper _helper = PostLoginHelper();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (await _helper.isUserLogged()) {}
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuild Tela Login');
    return Scaffold(
        key: _scaffoldKey,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                child: Container(
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 1, 145, 202),
                        Color.fromARGB(255, 141, 214, 243),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/login.png',
                            width: 500,
                          )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height / 1,
                  margin: EdgeInsets.symmetric(vertical: 40),
                  padding: EdgeInsets.only(top: 32),

                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 65,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: CustomTextField(
                          controller: _usernameController,
                          labelText: 'Login',
                          icon:
                              Icon(Icons.login, color: Colors.lightBlueAccent),
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                  //padding: EdgeInsets.only(top: 32),
                  // margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 65,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: CustomTextField(
                          controller: _passwordController,
                          labelText: 'Senha',
                          obscureText: !_passVisible,
                          icon: Icon(Icons.lock, color: Colors.lightBlueAccent),
                          suffixIcon: IconButton(
                            icon: _passVisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                              setState(() {
                                _passVisible = _passVisible ? false : true;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(top: 16, right: 32),
                      //     child: TextButton(
                      //       style: TextButton.styleFrom(
                      //         textStyle: const TextStyle(
                      //           fontSize: 16,
                      //           color: Colors.green,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(50))),
                      //         shadowColor: Colors.green,
                      //       ),
                      //       onPressed: () {},
                      //       child: const Text('Esqueci minha senha'),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 40),
                        height: 65,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          // gradient: const LinearGradient(
                          //   colors: [
                          //     Color.fromARGB(206, 0, 177, 247),
                          //     Color.fromARGB(255, 141, 214, 243),
                          //   ],
                          // ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool logged = await _helper.login(
                                    _usernameController.text,
                                    _passwordController.text);
                                if (logged == true) {
                                  Navigator.push(
                                    context, // transição da tela home para a tela cadastro
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Usuário não encontrado!'),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            child: Center(
                                child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                      )
                    ],
                  ),
                ),
              ]),
            ))));
  }
}
