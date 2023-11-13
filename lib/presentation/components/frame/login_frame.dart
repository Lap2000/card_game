import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/presentation/components/button/image_button/animated_button/animated_button.dart';
import 'package:flutter/material.dart';

import 'header_login.dart';

class LoginFrame extends StatelessWidget {
  const LoginFrame({
    super.key,
    this.padding = const EdgeInsets.only(top: 0),
    this.action,
  });

  final EdgeInsets padding;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Padding(
      padding: padding,
      child: Column(
        children: [
          const HeaderLogin(),
          Container(
            height: 200,
            width: 460,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsConstance.frameImage.path),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetsConstance.inputImage.path),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: controller,
                          onChanged: (v) {},
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontFamily: AssetsConstance.mainFontFamily.path,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetsConstance.inputImage.path),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: controller,
                          onChanged: (v) {},
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontFamily: AssetsConstance.mainFontFamily.path,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                AnimatedButton(
                  path: AssetsConstance.nextLoginImage.path,
                  size: 80,
                  action: action,
                ),
                // CustomImageButton(
                //   path: AssetsConstance.nextLoginImage.path,
                //   size: 80,
                //   action: action,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
