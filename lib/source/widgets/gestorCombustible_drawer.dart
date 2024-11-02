import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class GestorcombustibleDrawer extends StatelessWidget {
  const GestorcombustibleDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        ListTile(
          title: const Text(
            "Opciones",
            style: TextStyle(fontSize: 35),
          ),
          onTap: () {
            Navigator.pop(context);
            context.go("/");
          },
        ),
        const SizedBox(
          height: 30,
        ),
        ListTile(
          title: const Text(
            "Inicio",
            style: TextStyle(fontSize: 27),
          ),
          onTap: () {
            context.go("/");
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
          title: const Text("Mi Perfil", style: TextStyle(fontSize: 27)),
          onTap: () {
            context.go("/miProfile");
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 100,
        ),
        ListTile(
          title: const Text("Cerrar Sesion", style: TextStyle(fontSize: 27)),
          onTap: () {
            Toastification().show(title: const Text("sesion cerrada"));
            Navigator.pop(context);
          },
        )
      ],
    ));
  }
}
