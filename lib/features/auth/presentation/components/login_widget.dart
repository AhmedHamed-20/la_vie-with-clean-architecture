// import 'package:flutter/material.dart';
// import '../../../../core/components/defaults.dart';
// import '../../../../core/constants/constants.dart';
// import '../text_fileds_controlers/textfiled_controlers.dart';

// class LoginWidget extends StatelessWidget {
//   final VoidCallback onPressedOnLogin;
//   final VoidCallback onPressedOnForgetPassword;
//   final bool obScureText;
//   final FormFieldValidator<String>? validatorPassword;
//   final FormFieldValidator<String>? validatorEmail;
//   final Widget suffixIcon;
//   const LoginWidget(
//       {Key? key,
//       required this.onPressedOnLogin,
//       required this.onPressedOnForgetPassword,
//       required this.obScureText,
//       required this.validatorPassword,
//       required this.validatorEmail,
//       required this.suffixIcon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Email',
//             style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                   color: AppColors.subtitleTextColor,
//                 ),
//           ),
//           const SizedBox(
//             height: AppPadding.p8,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               bottom: AppPadding.p30,
//             ),
//             child: Form(
//               autovalidateMode: AutovalidateMode.always,
//               child: SizedBox(
//                 height: AppHeight.h70,
//                 child: defaultTextFormField(
//                   validator: validatorEmail,
//                   width: double.infinity,
//                   height: AppHeight.h46,
//                   radius: AppRadius.r5,
//                   context: context,
//                   controller: TextFormFieldControllers.emailLoginController,
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//               ),
//             ),
//           ),
//           Text(
//             'Password',
//             style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                   color: AppColors.subtitleTextColor,
//                 ),
//           ),
//           const SizedBox(
//             height: AppPadding.p8,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               bottom: AppPadding.p30,
//             ),
//             child: Form(
//               autovalidateMode: AutovalidateMode.always,
//               child: SizedBox(
//                 height: AppHeight.h100,
//                 child: defaultTextFormField(
//                   validator: validatorPassword,
//                   obscureText: obScureText,
//                   suffixIcon: suffixIcon,
//                   width: double.infinity,
//                   height: AppHeight.h100,
//                   radius: AppRadius.r5,
//                   context: context,
//                   controller: TextFormFieldControllers.passwordLoginController,
//                 ),
//               ),
//             ),
//           ),
//           state is loadin
//               ? Center(
//                   child: CircularProgressIndicator(
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 )
//               : defaultButton(
//                   onPressed: onPressedOnLogin,
//                   buttonChild: Text(
//                     'Login',
//                     style: Theme.of(context).textTheme.labelMedium,
//                   ),
//                   width: double.infinity,
//                   height: AppHeight.h46,
//                 ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TextButton(
//                 onPressed: onPressedOnForgetPassword,
//                 child: Text(
//                   'Forget Password?',
//                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                         color: Theme.of(context).primaryColor,
//                       ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
