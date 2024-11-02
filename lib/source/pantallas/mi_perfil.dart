import 'package:app_itm/source/widgets/gestorCombustible_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class MiPerfil extends StatelessWidget {
  const MiPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const GestorcombustibleDrawer(),
        appBar: AppBar(
          title: const Text("Mi perfil"),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/b/b7/Google_Contacts_logo.png"),
                maxRadius: 80,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "David Muñoz",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                "Administrador",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 70),
              TextButton(
                  onPressed: () {
                    Toastification().show(title: const Text("Clave cambiada"));
                  },
                  child: const Text(
                    "Cambiar clave",
                    style: TextStyle(fontSize: 20),
                  )),
              TextButton(
                  onPressed: () {
                    context.go("/");
                  },
                  child: const Text(
                    "Regresar",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ));
  }
}
