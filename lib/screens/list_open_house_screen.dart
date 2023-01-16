import 'package:app_vigilance/helper/form_open_house_helper.dart';
import 'package:flutter/material.dart';
import '../databases/file_persistence.dart';
import '../model/form_open_house_model.dart';
import 'form_open_house_screen.dart';
import 'home_screen.dart';

class ListOpenHouseScreen extends StatefulWidget {
  const ListOpenHouseScreen({super.key});

  @override
  State<ListOpenHouseScreen> createState() => _ListOpenHouseScreenState();
}

class _ListOpenHouseScreenState extends State<ListOpenHouseScreen> {
  FormOpenHouseHelper _helper = FormOpenHouseHelper();
  List<FormOpenHouse> formOpenHouseList = List.empty(growable: true);
  final FilePersistence _filePersistence = FilePersistence();

  @override
  void initState() {
    super.initState();
    _helper.getAll().then((listaForm) {
      setState(() {
        formOpenHouseList = listaForm;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Casas Abertas"),
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
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     tooltip: 'Pesquisar',
          //     onPressed: () {},
          //   ),
          // ],
          leading: GestureDetector(
            child: IconButton(
              icon: Icon(Icons.home),
              tooltip: 'Home',
              onPressed: () async {
                try {
                  await Navigator.push(
                    context, // transição da tela lista para a tela home
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
        // appBar: PreferredSize(
        //     preferredSize: const Size.fromHeight(50),

        //     // title: const Text('RubyTech'),
        //     // centerTitle: true,
        //     child: CustomAppBar(
        //       'Registros das Casas Abertas',
        //       automaticallyImplyLeading: false,
        //     )),
        body: Container(
          child: ListView.separated(
            itemCount: formOpenHouseList.length,
            separatorBuilder: (context, position) => Divider(),
            itemBuilder: (context, position) {
              FormOpenHouse _item = formOpenHouseList[position];
              return Dismissible(
                key: UniqueKey(),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: const Align(
                      alignment: Alignment(0.9, 0.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                      )),
                ),
                background: Container(
                  color: Colors.yellow[700],
                  child: const Align(
                      alignment: Alignment(-0.9, 0.0),
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      )),
                ),
                onDismissed: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    var response = await _helper.delete(_item);
                    if (response == true) {
                      setState(() {
                        formOpenHouseList.removeAt(position);
                      });
                    }
                  }
                },
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    FormOpenHouse? editFormOpenHouse = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormOpenHouseScreen(
                                  formsOpenHouseEdit: _item,
                                )));
                    if (editFormOpenHouse != null) {
                      setState(() {
                        formOpenHouseList.removeAt(position);
                        formOpenHouseList.insert(position, editFormOpenHouse);

                        const SnackBar snackBar = SnackBar(
                          content: Text("Cadastro alterado com sucesso!"),
                          backgroundColor: Color.fromARGB(255, 221, 188, 0),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    }
                    return false;
                  } else {
                    return true;
                  }
                },
                child: ListTile(
                  title: Text(
                    _item.nomeCompleto,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    _item.cep,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    setState(() {
                      _item.done = !_item.done;
                    });
                  },
                  onLongPress: () async {
                    FormOpenHouse? editFormOpenHouse = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormOpenHouseScreen(
                                  formsOpenHouseEdit: _item,
                                )));
                    if (editFormOpenHouse != null) {
                      setState(() {
                        formOpenHouseList.removeAt(position);
                        formOpenHouseList.insert(position, editFormOpenHouse);

                        const SnackBar snackBar = SnackBar(
                          content: Text("Cadastro alterado com sucesso!"),
                          backgroundColor: Color.fromARGB(255, 221, 188, 0),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    }
                  },
                ),
              );
            },
          ),
        ));
  }
}
