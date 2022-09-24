import 'package:examen_2/screens/utils.dart';
import 'package:flutter/material.dart';

class DanielPincayLoginScreen extends StatefulWidget {
  const DanielPincayLoginScreen({super.key});

  @override
  State<DanielPincayLoginScreen> createState() =>
      _DanielPincayLoginScreenState();
}

class _DanielPincayLoginScreenState extends State<DanielPincayLoginScreen> {
  String danielPincayUserName = '';
  String danielPincayPassword = '';
  @override
  Widget build(BuildContext context) {
    const danielPincayTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Utils.getSize(context).width,
          height: Utils.getSize(context).height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Inicio de Sesión',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                TextFormField(
                  onChanged: (value) {
                    danielPincayUserName = value;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 170, 169, 169),
                    labelStyle: danielPincayTextStyle,
                    labelText: 'Usuario',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    danielPincayPassword = value;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Clave',
                    filled: true,
                    fillColor: Color.fromARGB(255, 170, 169, 169),
                    labelStyle: danielPincayTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (danielPincayUserName ==
                                    Utils.danielPincayUserName &&
                                danielPincayPassword ==
                                    Utils.danielPincayPassword) {
                              Navigator.pushNamed(context, 'mapScreen');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Datos incorrectos')));
                            }
                          },
                          child: const Text(
                            'Ingresar',
                            textAlign: TextAlign.center,
                          )),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'retrievePassword');
                          },
                          child: const Text(
                            'Recuperar Contraseña',
                            textAlign: TextAlign.center,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: Utils.getSize(context).height * 0.15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
