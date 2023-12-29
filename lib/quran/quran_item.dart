import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';

class QuranItem extends StatelessWidget {

  final String suraName;
  final String suraNumber;

  const QuranItem({super.key, required this.suraName, required this.suraNumber});

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            suraNumber,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: appProvider.toggle(),
          width: 2.5,
          height: 45.0,
        ),
        Expanded(
          child: Text(
            suraName,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
