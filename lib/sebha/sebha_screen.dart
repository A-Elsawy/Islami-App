import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int count = 1;
  int add = 1;
  double angle = 0.0;
  String doaa = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);

    if (add == 34) add = 1;

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 100.0),
                child: Image.asset(
                  appProvider.headSebhaImage(),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 65,
                  ),
                  Transform.rotate(
                    angle: angle,
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            appProvider.bodySebhaImage(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'التسبيحات',
          ),
          Container(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
              backgroundColor: theme.primaryColor,
              child: Text(
                '$add',
                style: const TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                count++;
                add++;
                angle += 0.1;
                changeDoaa();
              });
              print(count);
            },
            height: 50.0,
            color: theme.primaryColor,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Text(
              doaa,
              style: GoogleFonts.elMessiri(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeDoaa() {
    if (count <= 33) {
      doaa = "سبحان الله";
    } else if (count <= 66) {
      doaa = "الحمد الله";
    } else if (count <= 99) {
      doaa = "الله أكبر";
    } else if (count == 100) {
      count = 1;
      add = 1;
    }
  }
}
