import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var email = '';
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [
                    0.1,
                    0.4,
                    0.7,
                    0.9,
                  ]),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _buildLoginBox('E-mail', 'Insira seu e-mail', Icons.email,
                      isPassword: false, isEmail: TextInputType.emailAddress),
                  SizedBox(height: 30),
                  _buildRemember(),
                  _buildLoginButton(),
                  _buildSignUp(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildLoginBox(
    String title,
    String boxText,
    IconData iconBox, {
    bool isPassword,
    TextInputType isEmail,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10),
        Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xFF6CA8F1),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            height: 60,
            child: TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'texto é obrigatório';
                  }
                  return null;
                },
                obscureText: isPassword,
                keyboardType: isEmail,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    iconBox,
                    color: Colors.white,
                  ),
                  hintText: boxText,
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontFamily: 'OpenSans',
                  ),
                ),
                onChanged: (text) {
                  email = text;
                }),
          ),
        ),
      ],
    );
  }

  Container _buildRemember() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
                value: _rememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                }),
          ),
          Text(
            'Lembrar de mim',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          )
        ],
      ),
    );
  }

  Container _buildLoginButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white, // background
          onPrimary: Colors.red, // foreground
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          final isValid = _formKey.currentState.validate();
          if (isValid) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Olá $email'),
                  );
                });
          }
        },
        child: Text('Login',
            style: TextStyle(
              color: Colors.blue,
              letterSpacing: 1.5,
              fontSize: 18,
              fontFamily: 'OpenSans',
            )),
      ),
    );
  }

  Column _buildSignUp() {
    return Column(
      children: [
        Text(
          ' OU ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        Container(
            child: ElevatedButton(
          onPressed: () => print('Função de criar conta'),
          child: Text(
            'Criar conta',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ))
      ],
    );
  }
}
