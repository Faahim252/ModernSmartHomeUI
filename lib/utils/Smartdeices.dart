import 'dart:math';

import 'package:flutter/material.dart';

class Smartdevices extends StatelessWidget {
  final String SmartdeviceName;
  final String Iconpath;
  final bool powerOn;
  void Function(bool) onchanged;

  Smartdevices(
      {super.key,
      required this.SmartdeviceName,
      required this.Iconpath,
      required this.powerOn,
      required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //icon
              Image.asset(
                Iconpath,
                height: 65,
                color: powerOn ? Colors.white : Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      SmartdeviceName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: powerOn ? Colors.white : Colors.black,
                      ),
                    ),
                  )),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Switch(
                      value: powerOn,
                      onChanged: onchanged,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
