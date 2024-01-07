// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_a_project/core/constants.dart';
import 'package:i_a_project/core/utils/app_router.dart';
import 'package:i_a_project/core/utils/cache_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController controller1;
  late final Animation<double> animation1;

  late final AnimationController controller2;
  late final Animation<double> animation2;

  void navigate() {
    Timer(const Duration(seconds: 3), () async {
      final String? token = await CacheHelper.getData(key: 'Token');
      if (token == null) {
        context.pushReplacement(AppRouter.kLoginView);
      } else {
        context.pushReplacement(AppRouter.kGroupsView, extra: token);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    controller1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation1 = Tween<double>(begin: .0, end: .5)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
          controller2.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });

    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation2 = Tween<double>(begin: .0, end: .5)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });

    controller1.forward();
    navigate();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 70,
          width: 70,
          child: CustomPaint(
            painter: MyPainter(animation1.value * 2, animation2.value * 2),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius_1;
  final double radius_2;

  MyPainter(this.radius_1, this.radius_2);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle1 = Paint()..color = AppConstants.gradient1;

    Paint circle2 = Paint()..color = AppConstants.gradient2;

    canvas.drawCircle(Offset(size.width * .5, size.height * .5),
        size.width * radius_1, circle1);

    canvas.drawCircle(Offset(size.width * .5, size.height * .5),
        size.width * radius_2, circle2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
