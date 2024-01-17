import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutoring_app/app/core/extentions/my_extention.dart';
import 'package:tutoring_app/app/modules/auth/domain/helper/auth_validetor.dart';
import 'package:tutoring_app/app/modules/auth/domain/provider/state/auth_provider.dart';
import 'package:tutoring_app/app/modules/auth/widgets/my_text_form_widget.dart';

class MyFormFields extends ConsumerStatefulWidget {
  const MyFormFields({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  ConsumerState<MyFormFields> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends ConsumerState<MyFormFields> {
  final _authValidators = AuthValidators();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode userNameNode = FocusNode();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    userNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = ref.watch(authFormController);
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyTextFormField(
              textEditingController: emailController,
              myFocusNode: emailNode,
              myTextInputAction: TextInputAction.next,
              labelText: context.translate.email,
              prefixIcon: const Icon(Icons.email),
              obscureText: false,
              onChanged: (value) {
                formProvider.setEmailField(value);
              },
              validator: (value) {
                return _authValidators.emailValidator(value);
              },
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            MyTextFormField(
              textEditingController: userNameController,
              myFocusNode: userNameNode,
              myTextInputAction: TextInputAction.next,
              labelText: context.translate.userName,
              prefixIcon: const Icon(Icons.person),
              obscureText: false,
              onChanged: (value) {
                formProvider.setUserNameField(value);
              },
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            MyTextFormField(
              textEditingController: passwordController,
              myFocusNode: passwordNode,
              myTextInputAction: TextInputAction.next,
              labelText: context.translate.password,
              prefixIcon: const Icon(Icons.password),
              suffixIcon: Icon(formProvider.togglePassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye_rounded),
              obscureText: formProvider.togglePassword ? true : false,
              onChanged: (value) {
                formProvider.setPasswordField(value);
              },
              togglePassword: () {
                formProvider.togglePasswordIcon();
              },
              validator: (input) => _authValidators.passwordVlidator(input),
            ),
          ],
        ),
      ),
    );
  }
}
