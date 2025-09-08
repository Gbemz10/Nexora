import 'package:flutter/material.dart';
import 'package:nexora/ui/views/sign_up/app_form_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'sign_up_viewmodel.dart';
import 'sign_up_logic.dart';
import 'sign_up_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignUpView extends StackedView<SignUpViewModel> with $SignUpView {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Glad to have you here",
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
                      validator: (value) {
                        return emailValidation(value);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Password",
                        // suffixIcon:
                        //     IconButton(onPressed: onPressed, icon: icon),
                      ),
                      validator: (value) {
                        return passwordValidation(value!);
                      },
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
                        onPressed: () {},
                        child: const Text(
                          "Create",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // try {
                        //   if (signUpFormKey.currentState!.validate()) {
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: (context) => const LoginView(),
                        //       ),
                        //     );
                        //   }
                        // } catch (e) {
                        //   debugPrint(e.toString());
                        // }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: const Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "Already have an account?"),
                            TextSpan(
                              text: " Log in",
                              style: TextStyle(
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
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();

  @override
  void onViewModelReady(SignUpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SignUpViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
