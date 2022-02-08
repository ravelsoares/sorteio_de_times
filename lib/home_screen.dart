import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String insert = 'jogador';
  bool isJogador = false;
  String labelText = 'Insira um jogador';
  final TextEditingController _timeController = TextEditingController();
  List times = [];
  List jogadores = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteio de times'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                jogadores.clear();
                times.clear();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _timeController,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: isJogador
                                ? 'Insira um jogador'
                                : 'Insira um time',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isJogador = !isJogador;
                                });
                              },
                              icon: isJogador
                                  ? const Icon(Icons.person)
                                  : const Icon(Icons.shield),
                            )),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String text = _timeController.text.trim();
                        setState(() {
                          if (isJogador) {
                            jogadores.add(text);
                          } else {
                            times.add(text);
                          }

                          isJogador = !isJogador;
                        });
                        _timeController.clear();
                      },
                      child: const Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Times',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: times.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(times[index]),
                        trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red[400]),
                            onPressed: () {
                              setState(() {
                                times.removeAt(index);
                              });
                            }),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Jogadores',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: jogadores.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(jogadores[index]),
                        trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red[400]),
                            onPressed: () {
                              setState(() {
                                jogadores.removeAt(index);
                              });
                            }),
                      );
                    },
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
