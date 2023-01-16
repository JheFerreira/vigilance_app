import 'package:app_vigilance/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../databases/file_persistence.dart';
import '../helper/form_closed_house.dart';
import '../model/form_closed_house_model.dart';
import 'form_closed_house_screen.dart';

class ListClosedHouseScreen extends StatefulWidget {
  const ListClosedHouseScreen({super.key});

  @override
  State<ListClosedHouseScreen> createState() => _ListClosedHouseScreenState();
}

class _ListClosedHouseScreenState extends State<ListClosedHouseScreen> {
  FormClosedHouseHelper _helper = FormClosedHouseHelper();
  List<FormClosedHouse> formClosedHouseList = List.empty(growable: true);
  final FilePersistence _filePersistence = FilePersistence();

  @override
  void initState() {
    super.initState();
    _helper.getAll().then((listaForm) {
      setState(() {
        formClosedHouseList = listaForm;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Casas Fechadas"),
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
          //       icon: Icon(Icons.search),
          //       tooltip: 'Pesquisar',
          //       onPressed: () async {}),
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
        //   preferredSize: const Size.fromHeight(50),
        //   // title: const Text('RubyTech'),
        //   // centerTitle: true,
        //   child: CustomAppBar(
        //     'Registros das Casas Abertas',
        //   ),
        // ),
        body: Container(
          child: ListView.separated(
            itemCount: formClosedHouseList.length,
            separatorBuilder: (context, position) => Divider(),
            itemBuilder: (context, position) {
              FormClosedHouse _item = formClosedHouseList[position];
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
                        formClosedHouseList.removeAt(position);
                      });
                    }
                  }
                },
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    FormClosedHouse? editFormClosedHouse = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormClosedHouseScreen(
                                formsClosedHouse: _item)));
                    if (editFormClosedHouse != null) {
                      setState(() {
                        formClosedHouseList.removeAt(position);
                        formClosedHouseList.insert(
                            position, editFormClosedHouse);

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
                    _item.logradouro,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    _item.retorno,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    setState(() {
                      _item.done = !_item.done;
                    });
                  },
                  onLongPress: () async {
                    FormClosedHouse? editFormClosedHouse = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormClosedHouseScreen(
                                formsClosedHouse: _item)));
                    if (editFormClosedHouse != null) {
                      setState(() {
                        formClosedHouseList.removeAt(position);
                        formClosedHouseList.insert(
                            position, editFormClosedHouse);
                        // _filePersistence.saveData(_newFormClosedHouse);

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
