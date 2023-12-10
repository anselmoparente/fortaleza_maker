import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortaleza_maker/data/controller.dart';
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
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/fortaleza_maker_logo.svg'),
            Container(
              width: size.width * 0.8,
              padding: const EdgeInsets.only(top: 24.0),
              child: CustomTextFormField(controller: responseController),
            ),
            Container(
              margin: EdgeInsets.only(right: size.width * 0.1),
              child: Column(
                children: [
                  ValueItem(type: 'P', controller: controller),
                  ValueItem(type: 'I', controller: controller),
                  ValueItem(type: 'D', controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
