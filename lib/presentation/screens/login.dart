import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inovola_task/presentation/screens/sign_up.dart';
import 'package:inovola_task/presentation/widgets/text_filed.dart';

import '../../core/app_theme.dart';
import '../widgets/button.dart';
import 'dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
  var formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child:  Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    'Expenset.',
                    style: AppTextStyles.titleVeryLarge,
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                CommonTextFiled(
                  keyBoardType: TextInputType.text,
                  title: "Email",
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return "Enter your Email";
                    }
                  },
                  onChange: (text) {},
                ),
                const SizedBox(height: 16),
                CommonTextFiled(
                  keyBoardType: TextInputType.text,
                  title: "Password",
                  isPassword: true,
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return "Enter your Password";
                    }
                  },
                  onChange: (text) {},
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password',
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                ),
                const SizedBox(height: 24),
                AppButton(
                    text: 'Login',
                    onPressed: () {
                      final isValid = formKey.currentState!.validate();

                      if (!isValid) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPage()));
                    }),
                const SizedBox(height: 24),
                const Center(child: Text('Or Login with')),
                const SizedBox(height: 16),
                SocialButton(
                    text: 'Continue With Google', icon: Icons.g_mobiledata),
                const SizedBox(height: 12),
                SocialButton(text: 'Continue With Google', icon: Icons.apple),
                const SizedBox(height: 24),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Didn't have an account? ",
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()),
                              );
                            },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const SocialButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: Icon(icon, size: 20),
        label: Text(text),
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
