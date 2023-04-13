import 'package:flutter/material.dart';
import 'package:hydra_sip/modules/home/logic/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: SafeArea(child: Container()),
    );
  }
}
