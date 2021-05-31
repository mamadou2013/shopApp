import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopss/services/user_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();

 final UserService userService = UserService();
  final RegExp isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(

        padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
        color: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            //Image.asset('images/c1.jpg',fit: BoxFit.cover,),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
              child: Text(
                'Login to your Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(0), width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getColor(1), width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(2), width: 2.0)),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      if(value.isEmpty){
                        return 'The email is required';
                      }else if(!isEmailValid.hasMatch(emailController.text)){
                        return 'please respect the email format : test@gmail.com!';
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.no_encryption),
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(0), width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getColor(1), width: 2.0),
                      ),
                      focusedErrorBorder:  OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(2), width: 2.0)),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'The password is required ';
                      } else if (value.length < 8) {
                        return 'The password must have 8 characters at least ';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(140.0, 2.0, 5.0, 0.0),
                    //alignment: Alignment.,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/restart');
                      },
                      child: Text(
                        'Forgot password ?',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5.0),
                    child: RaisedButton(
                        //key: Key("loginButton"),
                        color: Colors.redAccent,
                        child: Text(
                          'Sign In ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        ),
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            //print(isEmailValid.hasMatch(emailController.text));
                            final user = await auth.loginUser(
                                emailController.text, passwordController.text);
                            //print('uid: '+user.uid);
                            if (user != null) {
                              Navigator.pushReplacementNamed(context, '/home');
                            }
                          }
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Do not have an account?',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Register here',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Color getColor(int num) {
    switch(num){
      case 1 : return Colors.green; break;
      case 2 : return Colors.red; break;
      default: return Colors.white;
    }
  }
}
