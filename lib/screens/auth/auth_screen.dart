import 'dart:io';

import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/providers/auth_provider.dart';
import 'package:condo_app/screens/widgets/widgets.dart';
import 'package:condo_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const routeName = '/auth';

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    void submitForm() async {
      String email = _emailController.text;
      String password = _passwordController.text;

      try {
        ref.read(loadingProvider.notifier).state = true;

        await ref.read(authProvider).login(email, password).then((value) {
          if (value.containsKey('Success') && value.containsKey('User')) {
            ref.read(userProvider.notifier).state = value['User'];
            context.push('/');
          } else {
            QuickAlert.show(
                context: context,
                title: "Revise sus credenciales",
                text: value['Message'],
                type: QuickAlertType.error,
                width: 300,
                onConfirmBtnTap: () {
                  Navigator.of(context).pop();
                  ref.read(loadingProvider.notifier).state = false;
                },
                confirmBtnText: "OK");
          }
        });
        // Navigate to the home screen
      } catch (e) {
        QuickAlert.show(
            context: context,
            title: 'Error',
            text: e.toString(),
            type: QuickAlertType.error,
            width: 300,
            onConfirmBtnTap: () {
              Navigator.of(context).pop();
              ref.read(loadingProvider.notifier).state = false;
            },
            confirmBtnText: "OK");
      } finally {
        ref.read(loadingProvider.notifier).state = false;
      }
    }

    final size = MediaQuery.of(context).size;

    final isLoading = ref.watch(loadingProvider);
    return GestureDetector(
      onTap: () {
        // Ocultar el teclado cuando se toca cualquier parte de la pantalla
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/img/logo.png'),
                  ),
                ),
                Column(
                  children: [
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Column(
                          children: [
                            CustomInputField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'Usuario',
                              hintText: 'email@example.com',
                              suffixIcon: Icons.email_rounded,
                              validator: validateEmail,
                            ),
                            CustomInputField(
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              labelText: 'Contraseña',
                              hintText: '••••••••••',
                              obscureText: obscureText,
                              suffixIcon: Icons.visibility_rounded,
                              isPassword: true,
                              validator: validatePassword,
                            ),
                            buttonLogin(size, isLoading, submitForm),
                            const SizedBox(height: 20),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "¿Olvido su contraseña?",
                                  style: TextStyle(
                                      color: AppTheme.primaryLight,
                                      fontWeight: FontWeight.normal),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    context.push('/register');
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "¿Aún no tienes cuenta? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: "Crear una",
                          style: TextStyle(
                            color: Colors
                                .red, // Color rojo para el texto "Crear una"
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Platform.isIOS ? 20 : 0)
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton buttonLogin(Size size, bool isLoading, void submitForm()) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(size.width * 0.6, 60),
        backgroundColor: const Color(0xFF007979),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: isLoading
          ? null
          : () {
              if (_formKey.currentState!.validate()) {
                // Realizar la acción de envío si todos los campos son válidos
                submitForm();
              }
            },
      child: Consumer(
        builder: (context, watch, _) {
          final isLoading = ref.watch(loadingProvider);
          return isLoading
              ? const CircularProgressIndicator()
              : const CustomLabelText(
                  texto: "INGRESAR",
                  fontWeight: FontWeight.bold,
                );
        },
      ),
    );
  }
}
