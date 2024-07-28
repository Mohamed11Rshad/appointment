import 'package:appointment/core/helpers/app_regex.dart';
import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/theming/styles.dart';
import 'package:appointment/core/widgets/app_text_form_field.dart';
import 'package:appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;
  bool isobscureText = true;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
            hintText: "Password",
            isobscureText: isobscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isobscureText = !isobscureText;
                });
              },
              child: Icon(
                isobscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(12),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'Forgot Password?',
              style: TextStyles.font13BlueRegular,
            ),
          ),
        ],
      ),
    );
  }
}
