import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _email = TextEditingController();
  final _passWord = TextEditingController();
  final _confirmPassword = TextEditingController();
  //disposing
  @override
  void dispose() {
    _email.dispose();
    _passWord.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  //signUp method
  Future signUp() async {
    if (passWordisConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _passWord.text.trim(),
      );
    }
  }

//bool for
  bool passWordisConfirmed() {
    if (_passWord.text.trim() == _confirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                Icon(
                  Icons.android,
                  size: 120,
                ),
                SizedBox(
                  height: 60,
                ),
                //Texts
                Text('Log-In',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 36, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                //Another text
                Text(
                  "You are member create ID",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  //color: Colors.grey[200],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white),
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  //color: Colors.grey[200],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white),
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                        controller: _passWord,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  //color: Colors.grey[200],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white),
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                        controller: _confirmPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          border: InputBorder.none,
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //adding gesturn detection
                  //container
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Text button for using
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You are Member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        ' Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[600]),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
