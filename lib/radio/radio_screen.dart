import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 70.0, bottom: 50.0),
              child: Image.asset(
                'assets/images/radio_image.png',
                fit: BoxFit.cover,
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 50.0),
            child: Text(
              'إذاعة القرأن الكريم',
              style: GoogleFonts.elMessiri(fontSize: 38.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageIcon(
                const AssetImage('assets/images/previous.png'),
                color: appProvider.toggle(),
                size: 40.0,
              ),
              ImageIcon(
                const AssetImage('assets/images/play.png'),
                color: appProvider.toggle(),
                size: 40.0,
              ),
              ImageIcon(
                const AssetImage('assets/images/next.png'),
                color: appProvider.toggle(),
                size: 40.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
