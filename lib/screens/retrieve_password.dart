import 'package:examen_2/screens/utils.dart';
import 'package:flutter/material.dart';

class DanielPincayRetrievePassword extends StatefulWidget {
  const DanielPincayRetrievePassword({super.key});

  @override
  State<DanielPincayRetrievePassword> createState() =>
      _DanielPincayRetrievePasswordState();
}

class _DanielPincayRetrievePasswordState
    extends State<DanielPincayRetrievePassword> {
  final danielPincayTextStyle = const TextStyle(
    color: Color.fromARGB(255, 83, 83, 83),
    fontWeight: FontWeight.bold,
  );
  final danielPincayRegexEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String danielPincaycorreo = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Utils.getSize(context).width,
          height: Utils.getSize(context).height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background.jpg'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Recuperar Contraseña de Usuario',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Expanded(child: Container()),
                TextFormField(
                  onChanged: (value) {
                    danielPincaycorreo = value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 170, 169, 169),
                    labelStyle: danielPincayTextStyle,
                    labelText: 'Correo Electronico',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (danielPincayRegexEmail.hasMatch(danielPincaycorreo)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Es Correo')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No es correo')));
                      }
                    },
                    child: const Text(
                      'Enviar Solicitud',
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
