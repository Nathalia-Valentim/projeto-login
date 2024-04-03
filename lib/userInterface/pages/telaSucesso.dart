import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj_login/userInterface/widgets/tituloTarefa.dart';


class TelaTarefas extends StatefulWidget {
  const TelaTarefas({Key? key}) : super(key: key);

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  final valor = TextEditingController();

  List<Map<String, dynamic>> estudos = [
    {
      "name": "Trabalho Ed. F",
      "isStudy": false,
      "date": "- 16/04",
    },
    {
      "name": "Prova História",
      "isStudy": false,
      "date": "- 03/04",
    },
  ];

  void addItem(String value) {
    setState(() {
      estudos.add({"name": value, "isStudy": false, "date": ""});
    });
    valor.clear();
  }

  void removeItem(int index) {
    setState(() {
      estudos.removeAt(index);
    });
  }

  void editItem(int index) {
    TextEditingController nameController =
        TextEditingController(text: estudos[index]['name']);
    TextEditingController dateController =
        TextEditingController(text: estudos[index]['date']);
    bool isStudy = estudos[index]['isStudy'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Atividade'),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Data'),
              ),
              Row(
                children: [
                  const Text('Concluído: '),
                  Checkbox(
                    value: isStudy,
                    onChanged: (bool? value) {
                      setState(() {
                        isStudy = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {
                setState(() {
                  estudos[index] = {
                    "name": nameController.text,
                    "isStudy": isStudy,
                    "date": dateController.text,
                  };
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, size: 30), 
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: CircleAvatar(
            radius: 20, 
            backgroundImage: AssetImage('assets/foto_perfil.jpg'), 
          ),
        ),
      ],
        backgroundColor: const Color.fromARGB(255, 188, 228, 242),
   ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            searchBox(),
            tituloTarefa(),
            Expanded(
              child: ListView.builder(
                itemCount: estudos.length,
                itemBuilder: (context, index) {
                  return ListaTarefa(
                    name: estudos[index]['name'],
                    date: estudos[index]['date'],
                    isStudy: estudos[index]['isStudy'],
                    onTap: () {
                      setState(() {
                        estudos[index]['isStudy'] =
                            !estudos[index]['isStudy'];
                      });
                    },
                    onDelete: () => removeItem(index),
                    onEdit: () => editItem(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Adicionar Tarefa'),
                content: TextField(
                  controller: valor,
                  decoration: const InputDecoration(labelText: 'Nome da Tarefa'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      addItem(valor.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 164, 207, 236),
      ),
    );
  }
}

class ListaTarefa extends StatelessWidget {
  final String name;
  final String date;
  final bool isStudy;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ListaTarefa({
    required this.name,
    required this.date,
    required this.isStudy,
    required this.onTap,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: Colors.white,
      child: ListTile(
        title: Text(
          '$name  $date',
          style: GoogleFonts.nunitoSans(fontSize: 16),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit, color: Color.fromARGB(255, 58, 133, 183)),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete, color: Color.fromARGB(255, 240, 65, 65)),
            ),
          ],
        ),
        onTap: onTap,
        leading: Icon(
          isStudy ? Icons.check_box : Icons.check_box_outline_blank,
          color: isStudy ? const Color.fromARGB(255, 76, 175, 84) : null,
        ),
      ),
    );
  }
}

Widget searchBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0), 
          prefixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
            child: const Icon(Icons.search, color: Colors.black, size: 24), 
          ),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 32,
            minWidth: 48, 
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), 
            borderSide: BorderSide.none, 
          ),
          hintText: 'Buscar atividade',
          hintStyle: const TextStyle(color: Colors.blueGrey),
        ),
      ),
    ),
  );
}