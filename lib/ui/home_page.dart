// ignore_for_file: use_build_context_synchronously

import 'package:bluetooth_classic/models/device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortaleza_maker/data/controller.dart';
import 'package:fortaleza_maker/ui/widgets/connection_dialog.dart';
import 'package:fortaleza_maker/ui/widgets/custom_textformfield.dart';
import 'package:fortaleza_maker/ui/widgets/value_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Controller controller;
  TextEditingController responseController = TextEditingController();

  @override
  void initState() {
    controller = Controller();
    controller.checkPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/fortaleza_maker_logo.svg'),
                Container(
                  width: size.width * 0.8,
                  margin: const EdgeInsets.only(top: 24.0),
                  child: CustomTextFormField(controller: responseController),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      ValueItem(type: 'P', controller: controller),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFA7A9AC),
                      ),
                      ValueItem(type: 'I', controller: controller),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFA7A9AC),
                      ),
                      ValueItem(type: 'D', controller: controller),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1.0,
                  color: Color(0xFFA7A9AC),
                ),
                Text(
                  'VELOCIDADE MAX: ${controller.velocity}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Stencil',
                    color: Color(0xFFA7A9AC),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.85,
                  child: Slider(
                    min: 0.0,
                    max: 255.0,
                    divisions: 51,
                    activeColor: const Color(0xFFF5D22E),
                    thumbColor: const Color(0xFFF5D22E),
                    label: controller.velocity.toString(),
                    value: controller.velocity,
                    onChanged: (double value) => setState(() {
                      String valueSend = value.toStringAsFixed(0);
                      controller.changeVelocity(double.parse(valueSend));
                    }),
                    onChangeEnd: (double value) {},
                  ),
                ),
                Container(
                  width: size.width * 0.75,
                  margin: const EdgeInsets.only(top: 24.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF5D22E),
                    ),
                    child: const Text(
                      'INICIAR',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: 'Stencil',
                      ),
                    ),
                    onPressed: () async {
                      if (controller.isConnected) {
                        controller.changePlay();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Conecte a um dispositivo!'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            top: 32.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5D22E),
                shape: const CircleBorder(),
              ),
              child: Icon(
                (controller.isConnected)
                    ? Icons.bluetooth
                    : Icons.bluetooth_disabled,
                color: Colors.white,
              ),
              onPressed: () async {
                if (controller.isConnected) {
                  await controller.disconnectToDevice();
                  setState(() {
                    controller.isConnected = false;
                  });
                } else {
                  await controller.searchDevices();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Procurando dispositivos!'),
                    ),
                  );

                  await Future.delayed(const Duration(seconds: 5));

                  if (controller.devices.isNotEmpty) {
                    Device? device = await showDialog(
                      context: context,
                      builder: (BuildContext context) => ConectionDialog(
                        devices: controller.devices,
                      ),
                    );

                    if (device != null) {
                      bool value = await controller.connectToDevice(device);
                      setState(() {
                        controller.isConnected = value;
                      });
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Nenhum dispositivo encontrado!'),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
