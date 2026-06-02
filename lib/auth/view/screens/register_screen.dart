import 'package:chat/shared/app_theme.dart';
import 'package:chat/auth/view/screens/login_screen.dart';
import 'package:chat/auth/view/widgets/custom_text_form_field.dart';
import 'package:chat/auth/view/widgets/default_elevated_button.dart';
import 'package:chat/auth/view_model/auth_view_model.dart';
import 'package:chat/auth/view_model/user_states.dart';
import 'package:chat/home_screen.dart';
import 'package:chat/shared/app_validator.dart';
import 'package:chat/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  final nameController =TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whitecolor,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title:const Text(
            'Create Account'
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:AssetImage('assets/images/background.png'),
                fit: BoxFit.fill
            )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.03),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*.07,
                ),
                CustomTextFormField(
                    labelText: 'First Name',
                    controller: nameController,
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return 'First Name can not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.03,
                ),
                CustomTextFormField(
                    labelText: 'Email',
                    controller: emailController,
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return 'Email can not be empty';
                    }
                    else if(AppValidator.isEmail(value))
                    {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                    labelText: 'Password',
                    controller: passwordController,
                  isPassword: true,
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return 'Password can not be empty';
                    }
                    else if(value.length < 6)
                    {
                      return 'Password should be at least < 6';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.04,
                ),
                BlocListener<AuthViewModel,AuthStates>(
                  listener: (context, state) {
                    if(state is RegisterLoading)
                      {
                        UiUtils.showLoading(context);
                      }
                    else if(state is RegisterError)
                      {
                        UiUtils.hideLoading(context);
                        UiUtils.showError(state.message);
                      }
                    else  if(state is RegisterSuccess)
                      {
                        UiUtils.hideLoading(context);
                        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                      }
                  },
                  child: DefaultElevatedButton(
                    onpressed: registre,
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          'Register',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.whitecolor,
                              fontSize: 14
                          ),
                        ),
                        const Spacer(flex: 8,),
                        const Icon(Icons.arrow_forward),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.02,
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                  },
                  child: const Text(
                    'Already Have An Account',
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }

  void registre() {
    if (formKey.currentState?.validate() == true) {
      BlocProvider.of<AuthViewModel>(context).register(
          name: nameController.text,
          email: emailController.text.trim(),
          password: passwordController.text);
    }
  }
}

