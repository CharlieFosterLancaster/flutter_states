import 'package:flutter/material.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
          title: usuarioService.existeUsuario
              ? Text('Nombre: ${usuarioService.usuario.nombre}')
              : Text('Pagina 2')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final nuevoUsuario = new Usuario(
                    nombre: 'Carlos',
                    edad: 35,
                    profesiones: [
                      'FullStack developer',
                      'Video jugador experto'
                    ]);
                usuarioService.usuario = nuevoUsuario;
              }),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                if (usuarioService.existeUsuario) {
                  usuarioService.cambiarEdad(24);
                }
              }),
          MaterialButton(
              child: Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                if (usuarioService.existeUsuario) {
                  usuarioService.agregarProfesion();
                }
              }),
        ],
      )),
    );
  }
}
