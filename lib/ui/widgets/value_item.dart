import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortaleza_maker/data/controller.dart';

class ValueItem extends StatefulWidget {
  final String type;
  final Controller controller;

  const ValueItem({
    required this.type,
    required this.controller,
    super.key,
  });

  @override
  State<ValueItem> createState() => _ValueItemState();
}

class _ValueItemState extends State<ValueItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.type,
          style: const TextStyle(
            fontSize: 64.0,
            fontFamily: 'Stencil',
            color: Color(0xFFA7A9AC),
          ),
        ),
        SizedBox(
          width: widget.type == 'I'
              ? 38.0
              : widget.type == 'P'
                  ? 22.0
                  : 14.0,
        ),
        Column(
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7F7F7),
                  elevation: 0.0,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                ),
                child: Transform.rotate(
                  angle: -pi,
                  child: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 24.0,
                    color: Color(0xFFF5D22E),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.controller.changeValueP(
                      value: int.parse(widget.controller.p[0]) + 1,
                      position: 0,
                    );
                  });
                },
              ),
            ),
            Container(
              width: 32.0,
              height: 48.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFFA7A9AC),
                  width: 1.0,
                ),
              ),
              child: Text(
                widget.controller.p[3],
                style: const TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Stencil',
                  color: Color(0xFFA7A9AC),
                ),
              ),
            ),
            SizedBox(
              width: 24.0,
              height: 24.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7F7F7),
                  elevation: 0.0,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                ),
                child: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 24.0,
                  color: Color(0xFFF5D22E),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Column(
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7F7F7),
                  elevation: 0.0,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                ),
                child: Transform.rotate(
                  angle: -pi,
                  child: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 24.0,
                    color: Color(0xFFF5D22E),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: 32.0,
              height: 48.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFFA7A9AC),
                  width: 1.0,
                ),
              ),
              child: Text(
                widget.controller.p[3],
                style: const TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Stencil',
                  color: Color(0xFFA7A9AC),
                ),
              ),
            ),
            SizedBox(
              width: 24.0,
              height: 24.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7F7F7),
                  elevation: 0.0,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                ),
                child: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 24.0,
                  color: Color(0xFFF5D22E),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(width: 8.0),
        const Text(
          '.',
          style: TextStyle(
            fontSize: 64.0,
            fontFamily: 'Stencil',
            color: Color(0xFFA7A9AC),
          ),
        ),
        const SizedBox(width: 8.0),
        Column(
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7F7F7),
                  elevation: 0.0,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                ),
                child: Transform.rotate(
                  angle: -pi,
                  child: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 24.0,
                    color: Color(0xFFF5D22E),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: 32.0,
              height: 48.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFFA7A9AC),
                  width: 1.0,
                ),
              ),
              child: Text(
                widget.controller.p[3],
                style: const TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Stencil',
                  color: Color(0xFFA7A9AC),
                ),
              ),
            ),
            SizedBox(
              width: 24.0,
              height: 24.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7F7F7),
                  elevation: 0.0,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                ),
                child: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 24.0,
                  color: Color(0xFFF5D22E),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Column(
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7F7F7),
                  elevation: 0.0,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                ),
                child: Transform.rotate(
                  angle: -pi,
                  child: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 24.0,
                    color: Color(0xFFF5D22E),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: 32.0,
              height: 48.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFFA7A9AC),
                  width: 1.0,
                ),
              ),
              child: Text(
                widget.controller.p[3],
                style: const TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Stencil',
                  color: Color(0xFFA7A9AC),
                ),
              ),
            ),
            SizedBox(
              width: 24.0,
              height: 24.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7F7F7),
                  elevation: 0.0,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                ),
                child: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 24.0,
                  color: Color(0xFFF5D22E),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
