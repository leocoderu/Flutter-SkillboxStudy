import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxdemo/core/constant/page_route_constants.dart';
import 'package:reduxdemo/core/constant/string_constant.dart';
import 'package:reduxdemo/core/resources/styles.dart' as MyTheme;
import 'package:reduxdemo/core/util/helper.dart';
import 'package:reduxdemo/core/util/validator.dart';
import 'package:reduxdemo/model/app_state.dart';
import 'package:reduxdemo/model/login/login_response.dart';
import 'package:reduxdemo/redux/actios/login_actions.dart';
import 'package:reduxdemo/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  _LoginViewModel viewModel;

  final _formKey = GlobalKey<FormState>();

  final validatior = Validator();

  Widget _email(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          StringConstant.email,
          style: MyTheme.TextStyles.getMediumText(
              size.width, MyTheme.Colors.black, PageRouteConstants.kBold),
        ),
        SizedBox(
          height: MyTheme.AppDimension.px8,
        ),
        CustomTextField(
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          errorText: StringConstant.please_enter_email_address,
          textEditingController: _emailController,
          focusNode: _emailFocus,
          onFieldSubmitted: (_) {
            _fieldFocusChange(context, _emailFocus, _passwordFocus);
          },
          validator: validatior.validateEmail,
        )
      ],
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget _password(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          StringConstant.password,
          style: MyTheme.TextStyles.getMediumText(
              size.width, MyTheme.Colors.black, PageRouteConstants.kBold),
        ),
        SizedBox(
          height: MyTheme.AppDimension.px8,
        ),
        CustomTextField(
          obscureText: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          errorText: StringConstant.invalid_password,
          textEditingController: _passwordController,
          focusNode: _passwordFocus,
          validator: validatior.validatePassword,
        )
      ],
    );
  }

  Widget _submitButton(Size size) {
    return Container(
        width: size.width,
        height: kBottomNavigationBarHeight,
        child: RaisedButton(
          child: Text(
            StringConstant.sign_in,
            style: MyTheme.TextStyles.getMediumText(
                size.width, MyTheme.Colors.white, PageRouteConstants.kSemiBold),
          ),
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());

            if (_formKey.currentState.validate()) {
              viewModel.login(
                  _emailController.text, _passwordController.text, context);
            }
          },
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MyTheme.AppDimension.px28),
          ),
        ));
  }

  loginUser(String username, String password) {
    viewModel.login(username, password, context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyTheme.Colors.white,
        resizeToAvoidBottomPadding: true,
        body: StoreConnector<AppState, _LoginViewModel>(
          converter: (store) => _LoginViewModel.fromStore(store),
          builder: (_, viewModel) => buildContent(viewModel, size),
          onDidChange: (viewModel) {
            if (viewModel.loginError) {
              Helper.errorDialog(context, StringConstant.error_message,
                  StringConstant.invalid_user_credentials);
            }
          },
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget getLoadingIndicator(_LoginViewModel viewModel) {
    if (viewModel.isLoading) {
      return new CircularProgressIndicator();
    }
    return new Container();
  }

  Widget buildContent(_LoginViewModel viewModel, Size size) {
    this.viewModel = viewModel;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: size.height,
        width: size.width,
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: kBottomNavigationBarHeight,
                ),
                Container(
                  width: MyTheme.AppDimension.px150,
                  height: MyTheme.AppDimension.px150,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                Text(StringConstant.sign_in,
                    style: MyTheme.TextStyles.getLargeText(size.width,
                        MyTheme.Colors.black, PageRouteConstants.kBold)),
                Container(
                  width: size.width * 0.85,
                  child: Column(
                    children: <Widget>[
                      _email(size),
                      SizedBox(height: size.height * .03),
                      _password(size),
                      SizedBox(height: size.height * .03),
                      _submitButton(size),
                      SizedBox(height: size.height * .03),
                      getLoadingIndicator(viewModel),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class _LoginViewModel {
  final bool isLoading;
  final bool loginError;
  final LoginResponse user;

  final Function(String, String, BuildContext) login;

  _LoginViewModel({
    this.isLoading,
    this.loginError,
    this.user,
    this.login,
  });

  static _LoginViewModel fromStore(Store<AppState> store) {
    return _LoginViewModel(
      isLoading: store.state.userState.isLoading,
      loginError: store.state.userState.loginError,
      user: store.state.userState.loginResponse,
      login: (String username, String password, BuildContext context) {
        store.dispatch(loginUser(username, password, context));
      },
    );
  }
}
