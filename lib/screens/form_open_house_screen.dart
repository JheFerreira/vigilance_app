import 'package:app_vigilance/model/form_open_house_part_model.dart';
import 'package:app_vigilance/model/form_open_house_sample_model.dart';
import 'package:app_vigilance/screens/form_open_house_sample_screen.dart';
import 'package:flutter/material.dart';
import '../model/form_open_house_model.dart';
import '../widgets/custom_text_form_field.dart';

class FormOpenHouseScreen extends StatefulWidget {
  FormOpenHouse? formsOpenHouseEdit;

  FormOpenHouseScreen({this.formsOpenHouseEdit});

  @override
  State<FormOpenHouseScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<FormOpenHouseScreen> {
  List<FormOpenHouse> _newFormOpenHouse = List.empty(growable: true);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nomeCompletoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _logradouroController = TextEditingController();
  TextEditingController _complementoController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();

  
  @override
  void initState() {
    super.initState();

    if (widget.formsOpenHouseEdit != null) {
      setState(() {
        _nomeCompletoController.text = widget.formsOpenHouseEdit!.nomeCompleto;
        _telefoneController.text = widget.formsOpenHouseEdit!.telefone;
        _emailController.text = widget.formsOpenHouseEdit!.email;
        _cepController.text = widget.formsOpenHouseEdit!.cep;
        _logradouroController.text = widget.formsOpenHouseEdit!.logradouro;
        _complementoController.text = widget.formsOpenHouseEdit!.complemento;
        _bairroController.text = widget.formsOpenHouseEdit!.bairro;
        _cidadeController.text = widget.formsOpenHouseEdit!.cidade;
        _estadoController.text = widget.formsOpenHouseEdit!.estado;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text("Cadastro do Cliente"),
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
                _nomeCompletoController.text = "";
                _telefoneController.text = "";
                _emailController.text = "";
                _cepController.text = "";
                _logradouroController.text = "";
                _complementoController.text = "";
                _bairroController.text = "";
                _cidadeController.text = "";
                _estadoController.text = "";
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
                    controller: _nomeCompletoController,
                    labelText: 'Nome Completo',
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
                    controller: _telefoneController,
                    labelText: 'Telefone',
                    keyboardType: TextInputType.number,
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
                    controller: _emailController,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
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
                      labelText: 'Digite o Cep ex: 75689366',
                      suffixIcon: Icon
                      // onTap: () {}, child: Icon(Icons.send)),
                      // FutureBuilder<FormOpenHouseViaCep>
                      IconButton(Icons.search, onPressed: () async {}),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return 'Preenchimento Obrigatório!';
                      },
                      Future: _cepController.getEndereco(_cepController.text),
                      builder: (context, snapchot){
                        if(_cepController.tex == ""){
                          return Container();
                        }

                        if (snapchot.hasData == false){
                          return Center(child: CircularProgressIndicator() ,)
                        }

                      }

                     
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.symmetric(vertical: 30),
                          height: 65,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow[700],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  FormOpenHousePart formsOpenHousePart =
                                      FormOpenHousePart(
                                    id: this.widget.formsOpenHouseEdit == null
                                        ? ""
                                        : this.widget.formsOpenHouseEdit!.id,
                                    nomeCompleto: _nomeCompletoController.text,
                                    telefone: _telefoneController.text,
                                    email: _emailController.text,
                                    cep: _cepController.text,
                                    logradouro: _logradouroController.text,
                                    complemento: _complementoController.text,
                                    bairro: _bairroController.text,
                                    cidade: _cidadeController.text,
                                    estado: _estadoController.text,
                                  );

                                  if (this.widget.formsOpenHouseEdit != null) {
                                    FormOpenHouseSample formOpenHouseSample =
                                        FormOpenHouseSample(
                                            larva: this
                                                .widget
                                                .formsOpenHouseEdit!
                                                .larva,
                                            pupa: this
                                                .widget
                                                .formsOpenHouseEdit!
                                                .pupa,
                                            quantidadeLarva: this
                                                .widget
                                                .formsOpenHouseEdit!
                                                .quantidadeLarva,
                                            codigoDeposito: this
                                                .widget
                                                .formsOpenHouseEdit!
                                                .codigoDeposito,
                                            deposito: this
                                                .widget
                                                .formsOpenHouseEdit!
                                                .deposito,
                                            especie: this
                                                .widget
                                                .formsOpenHouseEdit!
                                                .especie);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FormOpenHouseSampleScreen(
                                                    formsOpenHouseSample:
                                                        formOpenHouseSample,
                                                    data: FormOpenHousePartToJson(
                                                        formsOpenHousePart))));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FormOpenHouseSampleScreen(
                                                    data: FormOpenHousePartToJson(
                                                        formsOpenHousePart))));
                                  }
                                }
                              },
                              child: const Text(
                                "Próximo",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
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
