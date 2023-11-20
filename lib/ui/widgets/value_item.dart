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
      mainAxisAlignment: MainAxisAlignment.end,
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
              ? 28.0
              : widget.type == 'P'
                  ? 12.0
                  : 4.0,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  widget.controller.changeValueP(
                    value: int.parse(widget.controller.p[0]) + 1,
                    position: 0,
                  );
                });
              },
              icon: Transform.rotate(
                angle: -pi,
                child: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
              ),
              iconSize: 24.0,
              color: const Color(0xFFF5D22E),
            ),
            Container(
              width: 32.0,
              height: 48.0,
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
                widget.controller.p[0],
                style: const TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Stencil',
                  color: Color(0xFFA7A9AC),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_drop_down_circle_outlined),
              iconSize: 24.0,
              color: const Color(0xFFF5D22E),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Transform.rotate(
                angle: -pi,
                child: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
              ),
              iconSize: 24.0,
              color: const Color(0xFFF5D22E),
            ),
            Container(
              width: 32.0,
              height: 48.0,
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
                widget.controller.p[1],
                style: const TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Stencil',
                  color: Color(0xFFA7A9AC),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_drop_down_circle_outlined),
              iconSize: 24.0,
              color: const Color(0xFFF5D22E),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Transform.rotate(
                angle: -pi,
                child: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
              ),
              iconSize: 24.0,
              color: const Color(0xFFF5D22E),
            ),
            Container(
              width: 32.0,
              height: 48.0,
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
                widget.controller.p[2],
                style: const TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Stencil',
                  color: Color(0xFFA7A9AC),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_drop_down_circle_outlined),
              iconSize: 24.0,
              color: const Color(0xFFF5D22E),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Transform.rotate(
                angle: -pi,
                child: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
              ),
              iconSize: 24.0,
              color: const Color(0xFFF5D22E),
            ),
            Container(
              width: 32.0,
              height: 48.0,
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
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_drop_down_circle_outlined),
              iconSize: 24.0,
              color: const Color(0xFFF5D22E),
            ),
          ],
        ),
      ],
    );
  }
}
