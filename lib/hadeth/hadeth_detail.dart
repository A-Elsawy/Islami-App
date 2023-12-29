import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/hadeth/hadeth_data.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class HadethDetail extends StatefulWidget {
  static const String routeName = "hadeth-detail";

  const HadethDetail({super.key});

  @override
  State<HadethDetail> createState() => _HadethDetailState();
}

class _HadethDetailState extends State<HadethDetail> {
  @override
  Widget build(BuildContext context) {
    var argumentOfModelRoute =
        ModalRoute.of(context)?.settings.arguments as HadethData;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            appProvider.bgImage(),
          ),
          fit: BoxFit.cover,
        ),
      ),
      width: mediaQuery.width,
      height: mediaQuery.height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامى'),
        ),
        body: Container(
          margin: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
            bottom: 60,
          ),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          width: mediaQuery.width,
          height: mediaQuery.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: appProvider.containerColor(),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    argumentOfModelRoute.title,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.play_circle,
                    size: 32,
                    color: appProvider.toggle(),
                  )
                ],
              ),
              const Divider(
                indent: 25,
                endIndent: 25,
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    argumentOfModelRoute.content,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.elMessiri(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  itemCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
