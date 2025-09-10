import 'package:flutter/material.dart';
import 'package:nexora/ui/common/app_form_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../sign_up/sign_up_view.dart';
//import '../sign_up/sign_up_logic.dart';
import 'login_viewmodel.dart';
import 'login_view.form.dart';
import 'package:nexora/ui/common/text validation.dart';

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
            // mainAxisSize: MainAxisSize.min,
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
                key: viewModel.signUpFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                      validator: (value) {
                        return Validation.emailValidation(value);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordFormField(
                      hintText: "Password",
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: 355,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // validation for email and password
                          if (viewModel.signUpFormKey.currentState!
                              .validate()) {
                            viewModel.navigateToSignUpPage();
                          }
                        },
                        child: Text(
                          "Login",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        viewModel.goBack();
                      },
                      child: Text.rich(
                        TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.black, fontSize: 18),
                          text: "Don't have an account yet?",
                          children: <TextSpan>[
                            TextSpan(
                              text: " Sign up",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.lightBlue,
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.lightBlue,
                                  ),
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
