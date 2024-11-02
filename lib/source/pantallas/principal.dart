import 'package:app_itm/core/respotaje.dart';
import 'package:app_itm/source/pantallas/agregar_registro.dart';
import 'package:app_itm/source/widgets/gestorCombustible_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Repostaje repostaje = Repostaje();
    return Scaffold(
      drawer: const GestorcombustibleDrawer(), //USO DE UN WIDGET PERSONALIZADO
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Aplicacion ITM"), //USO DEL APPBAR
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Bienvenido al gestor de combustible.",
              style: TextStyle(fontSize: 20), //USO DEL TEXT STYLE
            ),
            const Text("Selecciona una de las siguientes opciones:",
                style: TextStyle(fontSize: 20)),
            const SizedBox(
              height: 200,
            ), //USO DEL SIZEDBOX
            TextButton(
              onPressed: () {
                context.go('/agregar'); //INTERACCION CON EL GO ROUTER
              },
              child: const Text(
                "Crear nuevo registro",
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
                onPressed: () {
                  bool registros =
                      ListaRegistros().obtenerLista().isEmpty; //METODOS DE DART

                  if (registros) {
                    Toastification().show(
                        //USO DEL TOAST, CON AYUDA DEL SITIO PUB.DEV
                        title: const Text("Debes agregar un registro!"),
                        autoCloseDuration: const Duration(seconds: 3));
                  } else {
                    context.go('/registros');
                  }
                },
                child: const Text(
                  "Consultar Registros",
                  style: TextStyle(fontSize: 25),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                repostaje.registrosEjemplo();
                Toastification().show(
                    title: const Text("Lista cargada!"),
                    autoCloseDuration: const Duration(seconds: 4));
              },
              child: const Text(
                "Cargar registros de ejemplo",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Image.network(
        //USO DEL FLOATING CON WIDGET DE IMAGEN
        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Logo-ITM-01.png/800px-Logo-ITM-01.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
