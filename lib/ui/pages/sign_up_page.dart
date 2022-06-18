import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_text_form_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get\nyour next journey',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget NameInput() {
        return customTextFormFild(
          controller: nameController,
          hint: 'Your Name',
          title: 'Full Name',
          obscureText: false,
        );
      }

      Widget emailInput() {
        return customTextFormFild(
          controller: emailController,
          hint: 'Your Email Address',
          title: 'Email',
          obscureText: false,
        );
      }

      Widget PasswordImput() {
        return customTextFormFild(
          controller: passwordController,
          hint: 'Your Password',
          title: 'Password',
          obscureText: true,
        );
      }

      Widget HobbyInput() {
        return customTextFormFild(
          controller: hobbyController,
          hint: 'Your Hobby',
          title: 'Hobby',
          obscureText: false,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/bonus', (route) => false);
            } else if (state is AuthFail) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.eror),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {}
            return customButtonNext(
              title: 'Sign Up',
              onPressed: () {
                context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    hobby: hobbyController.text);
              },
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          children: [
            NameInput(),
            emailInput(),
            PasswordImput(),
            HobbyInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget Janji() {
      return GestureDetector(
        onTap: (() {
          Navigator.pushNamed(context, '/sign-in');
        }),
        child: Container(
          margin: EdgeInsets.only(top: 50, bottom: 73),
          child: Column(
            children: [
              Text(
                'Have an account? Sign in',
                style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
            Janji(),
          ],
        ),
      ),
    );
  }
}
