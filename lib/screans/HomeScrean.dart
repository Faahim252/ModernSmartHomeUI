import 'package:flutter/material.dart';
import 'package:modermsmarthome/utils/Smartdeices.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  final double horizantalpadding = 15;
  final double verticapanding = 25;

  List mySmartdevices = [
    //['smartdevicename, iconpath , powerStatus]
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart Tv", "lib/icons/smart-tv.png", false],
    ["Smart Ac", "lib/icons/air-conditioner.png", false],
    ["Smart Light", "lib/icons/fan.png", false]
  ];

  void powerSwitchChange(bool value, int Index) {
    setState(() {
      mySmartdevices[Index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // custom appbar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizantalpadding,
                  vertical: verticapanding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'lib/icons/menu.png',
                      height: 45,
                      color: Colors.grey[800],
                    ),
                    Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.grey[800],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //welcome Home
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizantalpadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Home'),
                    Text(
                      'I Am FAAHIM',
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizantalpadding),
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //smart device + grid

              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizantalpadding),
                child: Text('Smart devices'),
              ),

              Expanded(
                child: GridView.builder(
                  itemCount: mySmartdevices.length,
                  //physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: horizantalpadding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.3,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, Index) {
                    return Smartdevices(
                      SmartdeviceName: mySmartdevices[Index][0],
                      Iconpath: mySmartdevices[Index][1],
                      powerOn: mySmartdevices[Index][2],
                      onchanged: (value) => powerSwitchChange(value, Index),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
