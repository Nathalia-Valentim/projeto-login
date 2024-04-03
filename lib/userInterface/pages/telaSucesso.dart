import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TelaSucesso extends StatefulWidget {
  const TelaSucesso({super.key});

  @override
  State<TelaSucesso> createState() => _TelaSucessoState();
}

class _TelaSucessoState extends State<TelaSucesso> {
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
    // Adiciona um item sem preço inicialmente
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
                    const Text('Concluido: '),
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
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de estudos',
            style:
                GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 58, 133, 183),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: valor,
              decoration: InputDecoration(
                hintText: 'Adicione sua atividade...',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: valor.clear,
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            ElevatedButton(
              onPressed: () => addItem(valor.text),
              child: const Text('Adicionar Item'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 58, 133, 183),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: estudos.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(
                        '${estudos[index]['name']}  ${estudos[index]['date']}',
                        style: GoogleFonts.nunitoSans(fontSize: 16),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => editItem(index),
                            icon: const Icon(Icons.edit,
                                color: Color.fromARGB(255, 58, 133, 183)),
                          ),
                          IconButton(
                            onPressed: () => removeItem(index),
                            icon: const Icon(Icons.delete,
                                color: Color.fromARGB(255, 240, 65, 65)),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          estudos[index]['isStudy'] =
                          !estudos[index]['isStudy'];
                        });
                      },
                      leading: Icon(
                        estudos[index]['isStudy']
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                        color: estudos[index]['isStudy']
                        ? const Color.fromARGB(255, 76, 175, 84)
                        : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
