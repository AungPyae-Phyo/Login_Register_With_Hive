import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:login_register_with_hive/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _newUserNameController = TextEditingController();

  final TextEditingController _newEmailController = TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _register() async {
    final box = Hive.box('userBox');
    final newUserName = _newUserNameController.text;
    final newEmail = _newEmailController.text;
    final newPassword = _newPasswordController.text;

    if (newUserName.isNotEmpty &&
        newEmail.isNotEmpty &&
        newPassword.isNotEmpty) {
      box.put('username', newUserName);
      box.put('email', newEmail);
      box.put('password', newPassword);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration Successfully'),
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid your registration please try again'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  // const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _newUserNameController,
                  decoration: InputDecoration(labelText: 'Enter Name'),
                  validator: (value) {
                    if (value!.isEmpty) return "Please enter a user name";
                    return null;
                  },
                ),
                TextFormField(
                  controller: _newEmailController,
                  decoration: InputDecoration(labelText: 'Enter Email'),
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Please enter your email address";
                    return null;
                  },
                ),
                TextFormField(
                  controller: _newPasswordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) return "Please enter password";
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _register();
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            )),
      ),
    );
  }
}
