import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/student_home_screen/view/student_home_screen.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/constants/input_decoration.dart';
import '../../../global/widget/global_bottom_widget.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../../../global/widget/global_textform_field.dart';
import '../controller/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailCon = TextEditingController(text: "admin@gmail.com");
  TextEditingController passCon = TextEditingController(text: "12345");
  late bool _rememberMe;

  @override
  void initState() {
    super.initState();
    _rememberMe = false;
    _loadSavedCredentials();
  }

  void _saveCredentials() {
    AuthService.saveCredentials(
      email: emailCon.text,
      password: passCon.text,
      rememberMe: _rememberMe,
    );
  }

  void _loadSavedCredentials() {
    final credentials = AuthService.loadSavedCredentials();
    setState(() {
      emailCon.text = credentials['email'] ?? "";
      passCon.text = credentials['password'] ?? "";
      _rememberMe = credentials['remember_me'] ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.appColor,
      body: Column(
        children: [
          // Top section with logo and title
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizedBoxH(40),

                // Logo
                GlobalImageLoader(
                  imagePath: Images.appLogo,
                  height: 96,
                  width: 96,
                ),

                sizedBoxH(20),

                // App Name
                GlobalText(
                  str: "SCUBE",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorRes.white,
                ),

                // Subtitle
                GlobalText(
                  str: "Control & Monitoring System",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorRes.white,
                  letterSpacing: 0,
                  height: 1.4,
                ),
              ],
            ),
          ),

          // Bottom section with login form
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 40),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Login Title
                      Center(
                          child: GlobalText(
                            str: "Login",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0,
                            height: 1.5,
                            color: ColorRes.black,
                            textAlign: TextAlign.center,
                          )
                      ),

                      sizedBoxH(40),

                      // Username field
                      GlobalTextFormField(
                        controller: emailCon,
                        labelText: 'Username',
                        decoration: borderDecoration,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) {
                          setState(() {
                            _saveCredentials();
                          });
                        },
                      ),

                      sizedBoxH(20),

                      // Password field
                      GlobalTextFormField(
                        controller: passCon,
                        labelText: 'Password',
                        decoration: borderDecoration,
                        isPasswordField: true,
                        onChanged: (val) {
                          setState(() {
                            _saveCredentials();
                          });
                        },
                      ),

                      // Forgot password link
                      sizedBoxH(10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: GlobalText(
                            str: "Forget password?",
                            color: ColorRes.appTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),

                      sizedBoxH(20),

                      // Login button
                      GlobalButtonWidget(
                        str: 'Login',
                        height: 60,
                        buttomColor: ColorRes.appColor,
                        textColor: ColorRes.white,
                        radius: 10,
                        onTap: () async {
                          Get.to(()=> HomeScreen());
                        },
                      ),

                      sizedBoxH(10),

                      // Register link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GlobalText(
                            str: "Don't have any account? ",
                            color: ColorRes.appTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              // Handle register navigation
                            },
                            child: GlobalText(
                              str: "Register Now",
                              color: ColorRes.appColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}