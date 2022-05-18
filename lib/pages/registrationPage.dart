// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testproject/pages/loginPage.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // First Name TextField
    final firstNameFormField = TextFormField(
      autofocus: false,
      controller: firstNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your first name.';
        }
        if (!RegExp(r'^.{3,}$').hasMatch(value)) {
          return 'Please enter minimum 3 charecter.';
        }
        // return null;
      },
      onSaved: (value) {},
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        // hintText: "First Name",
        labelText: 'First Name',
        prefixIcon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    // Last Name TextField
    final lastNameFormField = TextFormField(
      autofocus: false,
      controller: lastNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your first name.';
        }
        if (!RegExp(r'^.{3,}$').hasMatch(value)) {
          return 'Please enter minimum 3 charecter.';
        }
        // return null;
      },
      onSaved: (value) {},
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Last Name",
        prefixIcon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    // Email TextField
    final emailFormField = TextFormField(
      autofocus: false,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter your email address.';
        }
        if (!RegExp("^[a-zA-z0-9-_+.]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return 'Please Enter Valid Email.';
        }
        return null;
      },
      onSaved: (value) {},
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
        // hintText: "Email",
        prefixIcon: Icon(
          Icons.email,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

// Password TextField
    final passwordFormField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        // RegExp regexp = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return 'Please enter your password.';
        }
        if (!RegExp(r'^.{6,}$').hasMatch(value)) {
          return 'Please enter your valid password (min 6 charecter)';
        }
      },
      onSaved: (value) {},
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    // Confirm Password TextField
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordController.text != passwordController.text) {
          return "Don't mass your password";
        }
      },
      onSaved: (value) {},
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        hintText: 'Confirm Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

// Registration Button
    final registrationButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          'Registration',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginPage()));
        },
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Registration Page',
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 150.0),
                firstNameFormField,
                SizedBox(height: 10.0),
                lastNameFormField,
                SizedBox(height: 10.0),
                emailFormField,
                SizedBox(height: 10.0),
                passwordFormField,
                SizedBox(height: 10.0),
                confirmPasswordField,
                SizedBox(height: 10.0),
                registrationButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
