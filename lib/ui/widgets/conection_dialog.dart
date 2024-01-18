import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';

class ConectionDialog extends StatelessWidget {
  final List<BluetoothDevice> devices;

  const ConectionDialog({
    required this.devices,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: Container(
        alignment: Alignment.center,
        child: const Text(
          'Conectar ao dispositivo',
          style: TextStyle(color: Colors.black),
        ),
      ),
      content: Container(
        padding: const EdgeInsets.all(8.0),
        height: size.height * 0.5,
        width: size.height * 0.9,
        child: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.pop(context, devices[index]),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF5D22E),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: SizedBox(
                  height: size.height * 0.05,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Icon(Icons.devices),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(devices[index].name ?? 'Unknown'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
      ],
    );
  }
}
