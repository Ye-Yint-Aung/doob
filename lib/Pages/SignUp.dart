import 'package:device_info_plus/device_info_plus.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //final dateInput = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  register(String name, password, phone) async {
    // final token = await SharedPref.getData(key: SharedPref.token);
    final response = await http.post(Uri.parse(ApiUrl.registerUrl),
        // headers: {
        //   'Accept': 'application/json;charset=UTF-8',
        //   // 'Authorization': token!
        // },
        body: {
          'name': name,
          'phone': phone,
          'password': password,
        });

    if (response.statusCode == 200) {
      print("API Result ${response.body}");
      // print('******* $token');
    } else {
      print('error');
    }
  }

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  AndroidDeviceInfo? androidInfo;
  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfo.androidInfo;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Container(
                        child:
                            Image.asset("lib/Image/dooblogo.png", height: 150),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                            fontFamily: "Century",
                            color: Color(0xffffffff),
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          ),
                          children: [
                            TextSpan(text: 'Connect with '),
                            TextSpan(
                                text: 'doob',
                                style: TextStyle(color: Color(0xffFF9800))),
                            TextSpan(text: '!'),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 5, left: 10, right: 10),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: nameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              // color: Colors.white.withOpacity(0.6),
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 20,
                            color: Colors.white,
                            // color: Colors.white.withOpacity(0.8),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,

                              // color: Colors.white.withOpacity(0.6),
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            size: 20,

                            color: Colors.white,

                            // color: Colors.white.withOpacity(0.4),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,

                              // color: Colors.white.withOpacity(0.6),
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.vpn_key_outlined,
                            size: 20,

                            color: Colors.white,

                            //color: Colors.white.withOpacity(0.4),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: comfirmPasswordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Comfirm Password',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,

                              // color: Colors.white.withOpacity(0.6),
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.vpn_key_outlined,
                            size: 20,

                            color: Colors.white,

                            // color: Colors.white.withOpacity(0.4),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: phoneController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,

                              // color: Colors.white.withOpacity(0.6),
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.phone_iphone,
                            size: 20,

                            color: Colors.white,

                            // color: Colors.white.withOpacity(0.4),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //  FutureBuilder<AndroidDeviceInfo>(
                  //   future: getInfo(),
                  //   builder: (context, snapshot) {
                  //     String? deviceid = snapshot.data?.id!;
                  //     return SizedBox(
                  //       width: size.width,
                  //       height: 40,
                  //       child: TextButton(
                  //         onPressed: () async {
                  //           final signUpState = ref.watch(signupProvider);
                  //           if (signUpState.isSuccess) {
                  //             // ignore: use_build_context_synchronously
                  //             context.go(
                  //                 '${LoginScreen.path}/${TermsPrivacyScreen.path}');
                  //             return;
                  //           }

                  //           if (signUpState.isLoading) {
                  //             return;
                  //           }

                  //           final name = nameController.text;
                  //           final phone = phoneController.text;
                  //           final date = dateInput.text;
                  //           const role = 'user';

                  //           final email = emailController.text;
                  //           final password = passwordController.text;
                  //           print(
                  //               "########## $deviceid");

                  //           await ref.read(signupProvider.notifier).signup(
                  //                 context,
                  //                 name,
                  //                 email,
                  //                 password,
                  //                 date,
                  //                 role,
                  //                 phone,
                  //                 deviceid!,
                  //               );

                  //           final updatedSignUpState =
                  //               ref.watch(signupProvider);
                  //           if (updatedSignUpState.isSuccess) {
                  //             // ignore: use_build_context_synchronously
                  //             context.go(
                  //                 '${LoginScreen.path}/${TermsPrivacyScreen.path}');
                  //             //  '${LoginScreen.path}');
                  //           } else if (updatedSignUpState.error != null) {
                  //             // ignore: use_build_context_synchronously
                  //             // showToast(context, updatedSignUpState.error!);
                  //             showToastError(context);
                  //           }
                  //         },
                  //         style: TextButton.styleFrom(
                  //           backgroundColor: const Color(0xff0000ff),
                  //           // fixedSize: const Size(396, 48),
                  //         ),
                  //         child: Consumer(
                  //           builder: (context, watch, child) {
                  //             final signUpState = ref.watch(signupProvider);
                  //             return signUpState.isLoading
                  //                 ? SizedBox(
                  //                     width: 22,
                  //                     height: 22,
                  //                     child: const CircularProgressIndicator(
                  //                       color: Colors.white,
                  //                     ))
                  //                 : const Text(
                  //                     'Create',
                  //                     style: TextStyle(
                  //                         fontSize: 16, color: Colors.white),
                  //                   );
                  //           },
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  InkWell(
                    onTap: () {
                      register(
                          nameController.text.toString(),
                          //  emailController.text.toString(),
                          passwordController.text.toString(),
                          phoneController.text.toString());
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xffff9800),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text("Register",
                              style: GoogleFonts.mulish(
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: RichText(
                        text: TextSpan(
                            style: GoogleFonts.mulish(color: Colors.white),
                            children: [
                              TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                      color: Color(0xffFF9800),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
