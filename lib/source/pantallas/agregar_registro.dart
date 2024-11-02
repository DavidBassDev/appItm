import 'package:app_itm/core/respotaje.dart';
import 'package:app_itm/source/widgets/gestorCombustible_drawer.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class AgregarRegistro extends StatefulWidget {
  const AgregarRegistro({super.key});

  @override
  State<AgregarRegistro> createState() => _AgregarRegistroState();
}

class _AgregarRegistroState extends State<AgregarRegistro> {
  List<Repostaje> listaRepostaje = ListaRegistros().obtenerLista();
  final placaController = TextEditingController();
  final galonesController = TextEditingController();
  final kmController = TextEditingController();
  int registrosCargados = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const GestorcombustibleDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Agregar registro nuevo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, //ISO DEL MAIN AXIS
            children: [
              const SizedBox(height: 100),
              const Text(
                "Escribe tu placa",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: placaController,
                decoration: InputDecoration(
                    //DECORACION EN LOS WIDGET
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 30),
              const Text("Escribe los galones suministrados",
                  style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: galonesController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 30),
              const Text("Escribe los kilometrajes",
                  style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: kmController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 50),
              Text("cantidad de registros ${listaRepostaje.length}")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //USO DE FUNCIONES EN BOTONES
            registrosCargados++;
            setState(() {
              Repostaje repostaje = Repostaje();
              repostaje.placa = placaController.value.text;
              try {
                repostaje.galones = int.parse(galonesController.value.text);
                repostaje.kilometraje = int.parse(kmController.value.text);
                repostaje.rendimiento = Repostaje().calcularRendimiento(
                    repostaje.galones, repostaje.kilometraje);
                ListaRegistros().agregarRepostaje(repostaje);
                Toastification().show(
                    title: const Text("Registro agregado"),
                    autoCloseDuration: const Duration(seconds: 2));
              } catch (e) {
                Toastification().show(
                    title: const Text("Uno o mas campos son invalidos"),
                    autoCloseDuration: const Duration(seconds: 5));
              }
              placaController.clear();
              galonesController.clear();
              kmController.clear();
            });
          },
          child: const Icon(Icons.plus_one_rounded),
        ));
  }
}

class ListaRegistros {
  static final ListaRegistros _instance = ListaRegistros._internal();
  factory ListaRegistros() {
    return _instance;
  }
  ListaRegistros._internal();

  List<Repostaje> listaRepostaje = [];

  // Método para obtener la lista de repostajes
  List<Repostaje> obtenerLista() {
    return listaRepostaje;
  }

  agregarRepostaje(repostaje) {
    listaRepostaje.add(repostaje);
  }
}
