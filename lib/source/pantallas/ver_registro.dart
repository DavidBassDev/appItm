import 'package:app_itm/core/respotaje.dart';
import 'package:app_itm/source/pantallas/agregar_registro.dart';
import 'package:app_itm/source/widgets/gestorCombustible_drawer.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class VerRegistro extends StatefulWidget {
  const VerRegistro({super.key});

  @override
  State<VerRegistro> createState() => _VerRegistroState();
}

class _VerRegistroState extends State<VerRegistro> {
  @override
  Widget build(BuildContext context) {
    List<Repostaje> listaRepostajes = ListaRegistros().obtenerLista();

    return Scaffold(
        drawer: const GestorcombustibleDrawer(),
        appBar: AppBar(
          title: const Text("Consultar registros"),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
            itemCount: listaRepostajes.length,
            itemBuilder: (context, index) {
              Repostaje repostaje = listaRepostajes[index];
              return ListTile(
                  onLongPress: () {
                    if (repostaje.rendimiento < 30) {
                      Toastification().show(
                          title: const Text("Rendimiento bajo!"),
                          autoCloseDuration: const Duration(seconds: 5));
                    } else {
                      Toastification().show(
                          title: const Text("Rendimiento Bueno!"),
                          autoCloseDuration: const Duration(seconds: 5));
                    }
                  },
                  title: Text('Placa: ${repostaje.placa}'),
                  subtitle: Text(
                      'Galones: ${repostaje.galones}, Kilometraje: ${repostaje.kilometraje}, Rendimiento ${repostaje.rendimiento}'));
            },
          ))
        ]));
  }
}
