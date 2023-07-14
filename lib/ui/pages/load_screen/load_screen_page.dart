import 'dart:async';

import 'package:card_game/ui/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class PlashScreenPage extends StatefulWidget {
  const PlashScreenPage({super.key, required this.title});
  final String title;

  @override
  State<PlashScreenPage> createState() => _PlashScreenPageState();
}

class _PlashScreenPageState extends State<PlashScreenPage> {
  Artboard? jigglyPuff;
  SMITrigger? trigger;
  StateMachineController? stateMachineController;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive_files/plash_screen_ver1.riv').then(
      (data) {
        final file = RiveFile.import(data);
        final artBoard = file.mainArtboard.instance();
        stateMachineController =
            StateMachineController.fromArtboard(artBoard!, "State Machine 1");
        if (stateMachineController != null) {
          artBoard.addController(stateMachineController!);
          trigger = stateMachineController!.findSMI('Pressed');

          stateMachineController!.inputs.forEach((e) {
            debugPrint(e.runtimeType.toString());
            debugPrint("name${e.name}End");
          });
          trigger = stateMachineController!.inputs.first as SMITrigger;
        }

        setState(() => jigglyPuff = artBoard);
      },
    );

    timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      Get.toNamed<dynamic>(Pages.login.pageName);
    });
  }

  void jump() {
    trigger?.fire();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: jigglyPuff == null
            ? const SizedBox()
            : Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      jump();
                    },
                    child: Rive(fit: BoxFit.fill, artboard: jigglyPuff!),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: const RiveAnimation.asset(
                            'assets/rive_files/loading_ver2.riv',
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
