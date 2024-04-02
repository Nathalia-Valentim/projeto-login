import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaSucesso extends StatefulWidget {
  TelaSucesso({super.key});

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
    TextEditingController nameController = TextEditingController(text: estudos[index]['name']);
    TextEditingController dateController = TextEditingController(text: estudos[index]['date']);
    bool isStudy = estudos[index]['isStudy'];

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Editar Item'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Atividade'),
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(labelText: 'Data'),
                ),
                Row(
                  children: [
                    Text('Concluido: '),
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
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Salvar'),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de estudos', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 58, 133, 183),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: valor,
              decoration: InputDecoration(
                hintText: 'Adicione sua atividade...',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: valor.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
              ),
            ElevatedButton(
              onPressed: () => addItem(valor.text),
              child: Text('Adicionar Item'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Color.fromARGB(255, 58, 133, 183),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: estudos.length,
                itemBuilder:
                (context, index) {
                  return Card(
                    margin: EdgeInsets.all(5),
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
                            icon: Icon(Icons.edit, color: Color.fromARGB(255, 58, 133, 183)),
                          ),
                          IconButton(
                            onPressed: () => removeItem(index),
                            icon: Icon(Icons.delete, color: Color.fromARGB(255, 240, 65, 65)),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          estudos[index]['isStudy'] = !estudos[index]['isStudy'];
                        });
                      },
                      leading: Icon(
                        estudos[index]['isStudy'] ? Icons.check_box : Icons.check_box_outline_blank,
                        color: estudos[index]['isStudy'] ? Color.fromARGB(255, 76, 175, 84) : null,
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
