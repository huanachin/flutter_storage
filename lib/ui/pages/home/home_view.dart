import 'package:flutter/material.dart';
import 'package:flutter_storage/data/database/config.dart';
import 'package:flutter_storage/ui/pages/home/home_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box(DemoDatabase.settingsBox).listenable(),
        builder: (context, box, widget) {
          final isDark = context.read<HomeBloc>().isDarkMode();
          return Container(
            alignment: Alignment.center,
            color: isDark ? Colors.black : Colors.white,
            child: Switch(
              value: isDark,
              onChanged: (bool val) {
                context.read<HomeBloc>().setDarkMode(val);
              },
            ),
          );
        },
      ),
    );
  }
}
