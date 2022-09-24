import 'dart:async';

import 'package:examen_2/screens/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DanielPincayMapScreen extends StatefulWidget {
  const DanielPincayMapScreen({super.key});

  @override
  State<DanielPincayMapScreen> createState() => _DanielPincayMapScreenState();
}

class _DanielPincayMapScreenState extends State<DanielPincayMapScreen> {
  CameraPosition danielPincayCurrentPosition = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-2.181085, -79.900887),
      tilt: 59.440717697143555,
      zoom: 18);
  Set<Marker> danielPincayMarkers = {};
  final Completer<GoogleMapController> danielPincaycontroller = Completer();
  double danielPincayLatitud = -2.181085;
  double danielPincayLongitud = -79.900887;

  updatePosition() async {
    danielPincayCurrentPosition = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(danielPincayLatitud, danielPincayLongitud),
        tilt: 59.440717697143555,
        zoom: 18);
    danielPincayMarkers = {
      Marker(
          markerId:
              MarkerId('circle_id_${DateTime.now().millisecondsSinceEpoch}'),
          position: LatLng(danielPincayLatitud, danielPincayLongitud),
          infoWindow: const InfoWindow(title: 'Mi Ubicación')),
    };
    final GoogleMapController controller = await danielPincaycontroller.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(danielPincayCurrentPosition));
  }

  @override
  void initState() {
    danielPincayMarkers = {
      Marker(
          markerId:
              MarkerId('circle_id_${DateTime.now().millisecondsSinceEpoch}'),
          position: LatLng(danielPincayLatitud, danielPincayLongitud),
          infoWindow: const InfoWindow(title: 'Mi Ubicación')),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: Utils.getSize(context).height,
              width: Utils.getSize(context).width,
              child: GoogleMap(
                markers: danielPincayMarkers,
                onMapCreated: (controller) {
                  if (!danielPincaycontroller.isCompleted) {
                    danielPincaycontroller.complete(controller);
                  }
                },
                initialCameraPosition: danielPincayCurrentPosition,
              ),
            ),
            Positioned(
                bottom: 15,
                width: Utils.getSize(context).width * 0.4,
                left: Utils.getSize(context).width / 2 -
                    Utils.getSize(context).width * 0.2,
                child: ElevatedButton(
                  child: const Text('Regresar'),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                )),
            Positioned(
                width: Utils.getSize(context).width * 0.8,
                left: ((Utils.getSize(context).width) / 2) -
                    (Utils.getSize(context).width * 0.4),
                top: 20,
                child: Container(
                  color: const Color.fromARGB(144, 153, 152, 152),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                onChanged: (value) {
                                  danielPincayLatitud =
                                      double.tryParse(value) ?? 0;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 170, 169, 169),
                                  labelText: 'Latitud',
                                ),
                              ),
                              TextFormField(
                                onChanged: (value) {
                                  danielPincayLongitud =
                                      double.tryParse(value) ?? 0;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 170, 169, 169),
                                  labelText: 'Longitud',
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          child: const Text('Actualizar'),
                          onPressed: () {
                            updatePosition();
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
