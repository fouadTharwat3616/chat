import 'package:chat/shared/app_theme.dart';
import 'package:chat/auth/view/screens/register_screen.dart';
import 'package:chat/auth/view/widgets/custom_text_form_field.dart';
import 'package:chat/auth/view/widgets/default_elevated_button.dart';
import 'package:chat/auth/view_model/auth_view_model.dart';
import 'package:chat/auth/view_model/user_states.dart';
import 'package:chat/home_screen.dart';
import 'package:chat/shared/app_validator.dart';
import 'package:chat/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatefulWidget {
  static const String routeName='login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whitecolor,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title:const Text(
          'Login',
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
                Text(
                  'Welcome Back!',style: Theme.of(context).textTheme.titleMedium,
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
                  isPassword: true,
                  labelText: 'Password',
                    controller: passwordController,
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
                  listener: (_, state) {
                    if(state is LoginLoading)
                      {
                        UiUtils.showLoading(context);
                      }
                    else if(state is LoginError)
                      {
                        UiUtils.hideLoading(context);
                        UiUtils.showError(state.message);
                      }
                    else if(state is LoginSuccess)
                      {
                        UiUtils.hideLoading(context);
                        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                      }
                  },
                  child: DefaultElevatedButton(
                      onpressed: login,
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          'login',
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
                      Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
                    },
                    child: const Text(
                        'OR Create an Account',
                    ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
  void login(){
    if (formKey.currentState?.validate() == true) {
      BlocProvider.of<AuthViewModel>(context).login(
          email: emailController.text, password: passwordController.text
      );
    }

  }
}
