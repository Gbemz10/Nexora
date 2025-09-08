import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../sign_up/sign_up_view.dart';
import '../sign_up/sign_up_logic.dart';
import 'login_viewmodel.dart';
import 'login_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                "Log in",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Welcome back!",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.lightBlue,
                    ),
              ),
              const SizedBox(
                height: 17,
              ),
              Form(
                key: signUpFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                      controller: emailController,
                      validator: (value) {
                        emailValidation(value);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Password",
                        // suffixIcon:
                        //     IconButton(onPressed: onPressed, icon: icon),
                      ),
                      controller: passwordController,
                      validator: (value) {
                        passwordValidation(value!);
                      },
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      constraints: const BoxConstraints(
                        maxWidth: 355,
                        maxHeight: 65,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // try {
                          //   if (signUpFormKey.currentState!.validate()) {
                          //
                          //   }
                          // } catch (e) {
                          //   debugPrint(e.toString());
                          // }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          text: "Don't have an account yet?",
                          children: <TextSpan>[
                            TextSpan(
                              text: " Sign up",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.lightBlue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
