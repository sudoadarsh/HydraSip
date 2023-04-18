import 'package:flutter/material.dart';
import 'package:hydra_sip/base/render_widgets/render_widgets.dart';
import 'package:hydra_sip/modules/home/logic/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final HomeBloc _homeBloc;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc.close();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [

            const Positioned.fill(child: Icon(Icons.face)),

            // Water Animation.
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                builder: (context, child) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: CustomPaint(
                      painter: WaterPainter(
                        _animationController.value,
                        waveColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      ),
                    ),
                  );
                }, animation: _animationController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
