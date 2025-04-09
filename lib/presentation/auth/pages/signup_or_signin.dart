import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_2/common/widgets/button/appbar/app_bar.dart';
import 'package:spotify_2/common/widgets/button/basic_app_button.dart';
import 'package:spotify_2/common/widgets/button/helpers/is_dark_mode.dart';
import 'package:spotify_2/core/assets/app_images.dart';
import 'package:spotify_2/core/assets/app_vectors.dart';
import 'package:spotify_2/core/theme/app_colors.dart';
// import 'package:spotify_2/presentation/auth/pages/signin.dart';
import 'package:spotify_2/presentation/auth/pages/signup.dart';

class SignupOrSigninpage extends StatelessWidget {
  const SignupOrSigninpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BasicAppbar(),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(AppVectors.topPattern),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(AppVectors.bottomPattern),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(AppImages.authBG),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppVectors.logo),
                const SizedBox(
                  height: 55,
                ),
                const Text('Enjoy Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 26,
                    )),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  'Spotify is a proprietary Swedish audio streaming and media services provider',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                         SignupPage()));
                          },
                          title: 'Register'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => SignupPage()
                                          // SigninPage()
                                          ));
                            },
                            child: Text('Sign in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: context.isDarkMode
                                        ? Colors.white
                                        : Colors.black))
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
