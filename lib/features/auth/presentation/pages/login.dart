import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prueba_conocimiento/features/auth/presentation/pages/new_account.dart';
import 'package:flutter_prueba_conocimiento/features/auth/presentation/pages/forgot_password.dart';
import 'package:flutter_prueba_conocimiento/features/navigation/presentation/pages/home.dart';
import 'package:flutter_prueba_conocimiento/features/navigation/presentation/widgets/card_table_parents.dart';
import 'package:flutter_prueba_conocimiento/features/navigation/presentation/widgets/notification_table.dart';
import 'package:flutter_prueba_conocimiento/features/navigation/presentation/widgets/settings_options.dart';

import '../../../../core/custom_toast.dart';
import '../../../../core/helper/app_navigator.dart';
import '../../../../core/injections.dart';
import '../../../../core/loading_dialog.dart';
import '../../../../core/widgets/basic_app_button.dart';
import '../../../navigation/presentation/widgets/page_title.dart';
import '../../domain/use_cases/validate_form_login_use_case.dart';
import '../../infrastructure/models/login_request.dart';
import '../bloc/form_validate_state.dart';
import '../bloc/form_validate_state_cubit.dart';
import '../bloc/login_state.dart';
import '../bloc/login_state_cubit.dart';
import '../widgets/auth_background.dart';
import '../widgets/card_container.dart';
import '../widgets/input_decoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = "/login";

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwrodFocusNode = FocusNode();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => FormValidationCubit()),
              BlocProvider(create: (context) => sl<LoginStateCubit>()),
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<LoginStateCubit, LoginState>(
                  listener: (context, loginState) {
                    if (loginState is LoginLoadingState) {
                      // Aquí la lógica que va a ejecutarse cuando esté cargando
                      LoadingDialog.show(context);
                    }
                    if (loginState is LoginSuccessState) {
                      // Aquí la lógica que va a ejecutarse cuando sea exitoso
                      print('Success login');
                      AppNavigator.pushReplacement(
                          context,
                          HomeScreen([
                            const PageTitle(),
                            CardTableParents(),
                            NotificationTable(),
                            SettingsOptions()
                          ]));
                    } else if (loginState is LoginFailureState) {
                      // Aquí la lógica que va a ejecutarse cuando falle
                      print('Entro al error de autenticacion');
                      LoadingDialog.hide(context);
                      CustomToast.showError(
                        context: context,
                        title: "Error",
                        description: loginState.failure,
                      );
                    }
                  },
                ),
              ],
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  CardContainer(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        _siginText(context),
                        _emailField(context),
                        _passwordField(),
                        const SizedBox(height: 20),
                        _loginButton(context),
                        const SizedBox(height: 20),
                        _forgotPasswordButton(context),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  _newAccount(context),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return Text('Ingreso', style: Theme.of(context).textTheme.headlineLarge);
  }

  Widget _emailField(BuildContext context) {
    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, state) {
        return TextFormField(
          controller: emailController,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
            hintText: 'ejemplo@botech.com',
            labelText: 'Correo electrónico',
            context: context,
            prefixIcon: Icons.alternate_email_sharp,
            errorText: state is FormInvalid &&
                    state.validationErrors.containsKey('email')
                ? state.validationErrors['email']?.message
                : null,
          ),
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(passwrodFocusNode);
          },
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            prefixIcon: const Icon(Icons.lock),
            errorText: state is FormInvalid &&
                    state.validationErrors.containsKey('password')
                ? state.validationErrors['password']?.message
                : null,
            suffixIcon: IconButton(
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _loginButton(BuildContext context) {
    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, validationState) {
        return BasicAppButton(
          onPressed: () {
            final loginRequest = LoginRequest(
              email: emailController.text,
              password: passwordController.text,
            );
            context
                .read<FormValidationCubit>()
                .validateForm(
                  ValidateLoginFormUseCase(),
                  loginRequest,
                )
                .then((_) {
              if (context.read<FormValidationCubit>().state is FormValid) {
                context.read<LoginStateCubit>().login(loginRequest);
              }
            });
          },
          title: 'Ingresar',
        );
      },
    );
  }

  Widget _forgotPasswordButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, ForgotPasswordPage());
      },
      title: 'Olvidé mi contraseña',
    );
  }

  Widget _newAccount(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(context, NewAccountPage());
      },
      child: Text(
        'Crear una cuenta nueva',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
      ),
    );
  }
}
