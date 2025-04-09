// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:spotify_2/common/widgets/button/appbar/app_bar.dart';
// import 'package:spotify_2/common/widgets/button/basic_app_button.dart';
// import 'package:spotify_2/core/assets/app_vectors.dart';
// import 'package:spotify_2/data/models/auth/signin_user_req.dart';
// import 'package:spotify_2/domain/usecases/signin.dart';
// import 'package:spotify_2/presentation/auth/pages/signup.dart';
// import 'package:spotify_2/presentation/root/pages/root.dart';
// import 'package:spotify_2/sevice_locator.dart';

// class SigninPage extends StatelessWidget {
//   SigninPage({super.key});

//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: _signinText(context),
//       appBar: BasicAppbar(
//           title: SvgPicture.asset(AppVectors.logo, height: 40, width: 40)),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               _registerText(),
//               const SizedBox(height: 50),
//               _emailField(context),
//               const SizedBox(height: 20),
//               _passwordField(context),
//               const SizedBox(height: 20),
//               BasicAppButton(
//                 onPressed: () async {
//                   if (_email.text.isEmpty || _password.text.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           content: Text('All fields are required'),
//                           behavior: SnackBarBehavior.floating),
//                     );
//                     return;
//                   }

//                   var result = await sl<SigninUseCase>().call(
//                     params: SigninUserReq(
//                       email: _email.text.toString(),
//                       password: _password.text.toString(),
//                     ),
//                   );

//                   result.fold(
//                     (l) {
//                       var snackbar = SnackBar(
//                           content: Text(l.toString()),

//                           behavior: SnackBarBehavior.floating);
//                       ScaffoldMessenger.of(context).showSnackBar(snackbar);
//                     },
//                     (r) {
//                       var snackbar = const SnackBar(
//                           content: Text('Signin Successful!'),
//                           behavior: SnackBarBehavior.floating);
//                       ScaffoldMessenger.of(context).showSnackBar(snackbar);

//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const RootPage()),
//                         (route) => false,
//                       );
//                     },
//                   );
//                 },
//                 title: 'Sign In',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _registerText() => const Text('Sign In',
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25));

//   Widget _emailField(BuildContext context) => TextField(
//         controller: _email,
//         decoration: const InputDecoration(hintText: 'Enter Email'),
//       );

//   Widget _passwordField(BuildContext context) => TextField(
//         controller: _password,
//         decoration: const InputDecoration(hintText: 'Password'),
//       );

//   Widget _signinText(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text('Not A Member? ',
//               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
//           TextButton(
//             onPressed: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => SignupPage()));
//             },
//             child: const Text('Register Now'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// extension on Object? {}
