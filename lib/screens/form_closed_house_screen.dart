import 'package:app_vigilance/screens/list_closed_house_screen.dart';
import 'package:flutter/material.dart';
import '../helper/form_closed_house.dart';
import '../model/form_closed_house_model.dart';
import '../widgets/custom_text_form_field.dart';
import 'home_screen.dart';

class FormClosedHouseScreen extends StatefulWidget {
  FormClosedHouse? formsClosedHouse;

  FormClosedHouseScreen({this.formsClosedHouse});

  @override
  State<FormClosedHouseScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<FormClosedHouseScreen> {
  FormClosedHouseHelper _helper = FormClosedHouseHelper();
  List<FormClosedHouse> _newFormClosedHouse = List.empty(growable: true);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _logradouroController = TextEditingController();
  TextEditingController _complementoController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();
  TextEditingController _retornoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.formsClosedHouse != null) {
      setState(() {
        _dataController.text = widget.formsClosedHouse!.data;
        _cepController.text = widget.formsClosedHouse!.cep;
        _logradouroController.text = widget.formsClosedHouse!.logradouro;
        _complementoController.text = widget.formsClosedHouse!.complemento;
        _bairroController.text = widget.formsClosedHouse!.bairro;
        _cidadeController.text = widget.formsClosedHouse!.cidade;
        _estadoController.text = widget.formsClosedHouse!.estado;
        _retornoController.text = widget.formsClosedHouse!.retorno;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Cadastro do Cliente"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 1, 145, 202),
              Color.fromARGB(255, 141, 214, 243)
            ],
          ),
        )),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _dataController.text = "";
                _cepController.text = "";
                _logradouroController.text = "";
                _complementoController.text = "";
                _bairroController.text = "";
                _cidadeController.text = "";
                _estadoController.text = "";
                _retornoController.text = "";
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 40),
                //   width: MediaQuery.of(context).size.width / 1.1,
                //   height: 50,
                //   padding:
                //       EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(2),
                //     ),
                //     color: Colors.white,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black12,
                //         blurRadius: 20,
                //       ),
                //     ],
                //   ),
                //   child: CustomTextFormField(
                //     controller: _statusCasaController,
                //     hintText: 'Status da Casa',
                //     validator: (value) {
                //       if (value!.isEmpty) return 'Preenchimento Obrigatório!';
                //     },
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 65,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
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
                  child: CustomTextFormField(
                    controller: _dataController,
                    labelText: 'Data',
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value!.isEmpty) return 'Preenchimento Obrigatório!';
                    },
                  ),
                ),

                Container(
                  // margin: EdgeInsets.symmetric(vertical: 40),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 65,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
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
                  child: CustomTextFormField(
                    controller: _cepController,
                    labelText: 'CEP',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) return 'Preenchimento Obrigatório!';
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 65,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
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
                  child: CustomTextFormField(
                    controller: _logradouroController,
                    labelText: 'Logradouro',
                  ),
                ),
                Container(
                  // margin: EdgeInsets.symmetric(vertical: 40),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 65,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
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
                  child: CustomTextFormField(
                    controller: _complementoController,
                    labelText: 'Complemento',
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 65,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
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
                  child: CustomTextFormField(
                    controller: _bairroController,
                    labelText: 'Bairro',
                  ),
                ),
                Container(
                  //margin: EdgeInsets.symmetric(vertical: 40),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 65,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
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
                  child: CustomTextFormField(
                    controller: _cidadeController,
                    labelText: 'Cidade',
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 65,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
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
                  child: CustomTextFormField(
                    controller: _estadoController,
                    labelText: 'Estado',
                  ),
                ),
                Container(
                  //margin: EdgeInsets.symmetric(vertical: 40),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 65,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
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
                  child: CustomTextFormField(
                    controller: _retornoController,
                    labelText: 'Data retorno',
                    keyboardType: TextInputType.datetime,
                  ),
                ),

                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          //margin: EdgeInsets.symmetric(vertical: 30),
                          height: 70,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: widget.formsClosedHouse == null
                                    ? Colors.yellow[700]
                                    : Colors.yellow[700]),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                FormClosedHouse formsClosedHouse =
                                    FormClosedHouse(
                                  data: _dataController.text,
                                  cep: _cepController.text,
                                  logradouro: _logradouroController.text,
                                  complemento: _complementoController.text,
                                  bairro: _bairroController.text,
                                  cidade: _cidadeController.text,
                                  estado: _estadoController.text,
                                  retorno: _retornoController.text,
                                );

                                _helper.add(formsClosedHouse);
                                Navigator.push(
                                  context, // transição da tela cadastro para lista
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ListClosedHouseScreen(),
                                  ),
                                );
                              }
                            },
                            child: widget.formsClosedHouse == null
                                ? const Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const Text(
                                    "Editar",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.symmetric(vertical: 30),
                          height: 70,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlueAccent,
                            ),
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () async {
                              try {
                                Navigator.push(
                                  context, // transição da tela cadastro para home
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              } catch (error) {
                                print("Error: ${error.toString()}");
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
