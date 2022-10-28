import 'package:flutter/material.dart';
import 'package:flutter_storage/data/di/injection.dart';
import 'package:flutter_storage/ui/pages/home/home_bloc.dart';
import 'package:flutter_storage/ui/pages/home/home_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => getIt<HomeBloc>(),
      child: const HomeView(),
    );
  }
}
