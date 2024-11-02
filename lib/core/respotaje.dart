import 'package:app_itm/source/pantallas/agregar_registro.dart';

class Repostaje {
  int galones = 0;
  String placa = "";
  int kilometraje = 0;
  double rendimiento = 0;

// Constructor
  Repostaje({
    this.galones = 0,
    this.placa = "",
    this.kilometraje = 0,
    this.rendimiento = 0,
  });

//funciones
  double calcularRendimiento(galones, kilometraje) {
    double rendimiento = 0;
    rendimiento = kilometraje / galones;
    return rendimiento.ceilToDouble();
  }

  void registrosEjemplo() {
    ListaRegistros listaRegistros = ListaRegistros();
    int galonesIniciales = 60;
    int kmInicial = 5000;
    for (var i = 0; i < 30; i++) {
      Repostaje repostaje = Repostaje();
      repostaje.galones = galonesIniciales + 10;
      galonesIniciales = galonesIniciales + 10; //modifica la variable local
      repostaje.kilometraje = kmInicial - 100;
      kmInicial = kmInicial - 100; //modifica la variable local
      repostaje.placa = "ABC$i";
      repostaje.rendimiento =
          calcularRendimiento(repostaje.galones, repostaje.kilometraje);
      listaRegistros.agregarRepostaje(repostaje);
    }
  }
}
