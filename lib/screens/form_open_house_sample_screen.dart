import 'package:app_vigilance/helper/form_open_house_helper.dart';
import 'package:app_vigilance/model/form_open_house_model.dart';
import 'package:app_vigilance/model/form_open_house_part_model.dart';
import 'package:app_vigilance/screens/home_screen.dart';
import 'package:app_vigilance/screens/list_open_house_screen.dart';
import 'package:flutter/material.dart';
import '../model/form_open_house_sample_model.dart';
import '../widgets/custom_text_form_field.dart';

class FormOpenHouseSampleScreen extends StatefulWidget {
  FormOpenHouseSample? formsOpenHouseSample;
  String? data;

  FormOpenHouseSampleScreen({this.formsOpenHouseSample, this.data});

  @override
  State<FormOpenHouseSampleScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<FormOpenHouseSampleScreen> {
  FormOpenHouseHelper _helper = FormOpenHouseHelper();
  List<FormOpenHouseSample> _newFormOpenHouse = List.empty(growable: true);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _larvaController = TextEditingController();
  TextEditingController _pupaController = TextEditingController();
  TextEditingController _quantidadeLarvaController = TextEditingController();
  TextEditingController _codigoDepositoController = TextEditingController();
  TextEditingController _depositoController = TextEditingController();
  TextEditingController _especieController = TextEditingController();
  late FormOpenHousePart formsOpenHousePart;

  @override
  void initState() {
    super.initState();

    if (widget.formsOpenHouseSample != null) {
      setState(() {
        _larvaController.text = widget.formsOpenHouseSample!.larva;
        _pupaController.text = widget.formsOpenHouseSample!.pupa;
        _quantidadeLarvaController.text =
            widget.formsOpenHouseSample!.quantidadeLarva;
        _codigoDepositoController.text = widget.formsOpenHouseSample!.larva;
        _depositoController.text = widget.formsOpenHouseSample!.deposito;
        _especieController.text = widget.formsOpenHouseSample!.especie;
      });
    }

    if (widget.data != null) {
      formsOpenHousePart = FormOpenHousePartFromJson(widget.data!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Cadastro da Amostra"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 1, 145, 202),
              Color.fromARGB(255, 141, 214, 243),
            ],
          ),
        )),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _larvaController.text = "";
                _pupaController.text = "";
                _quantidadeLarvaController.text = "";
                _codigoDepositoController.text = "";
                _depositoController.text = "";
                _especieController.text = "";
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
                    controller: _larvaController,
                    labelText: 'Larva',
                    validator: (value) {
                      if (value!.isEmpty) return 'Preenchimento Obrigatório!';
                    },
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
                    controller: _pupaController,
                    labelText: 'Pupa',
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
                    controller: _quantidadeLarvaController,
                    labelText: 'Quantidade de Larva',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) return 'Preenchimento Obrigatório!';
                    },
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
                    controller: _codigoDepositoController,
                    labelText: 'Código do Depósito',
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
                    controller: _depositoController,
                    labelText: 'Depósito',
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
                    controller: _especieController,
                    labelText: 'Espécie',
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
                                primary: widget.formsOpenHouseSample == null
                                    ? Colors.yellow[700]
                                    : Colors.yellow[700]),
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                FormOpenHouseSample formsOpenHouseSample =
                                    FormOpenHouseSample(
                                  larva: _larvaController.text,
                                  pupa: _pupaController.text,
                                  quantidadeLarva:
                                      _quantidadeLarvaController.text,
                                  codigoDeposito:
                                      _codigoDepositoController.text,
                                  deposito: _depositoController.text,
                                  especie: _especieController.text,
                                );

                                if (widget.formsOpenHouseSample == null) {
                                  var response = await _helper.add(
                                      FormOpenHouse.fromParts(
                                          formsOpenHousePart,
                                          formsOpenHouseSample));

                                  if (response == true) {
                                    Navigator.push(
                                      context, // transição da tela cadastro para lista
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ListOpenHouseScreen(),
                                      ),
                                    );
                                  }
                                } else {
                                  var response = await _helper.update(
                                      FormOpenHouse.fromParts(
                                          formsOpenHousePart,
                                          formsOpenHouseSample));

                                  if (response == true) {
                                    Navigator.push(
                                      context, // transição da tela cadastro para lista
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ListOpenHouseScreen(),
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                            child: widget.formsOpenHouseSample == null
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
