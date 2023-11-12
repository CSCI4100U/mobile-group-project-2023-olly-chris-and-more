import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

// Mohammad

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  get nameController => null;

  Future<void> _handleLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    // Call the handleLogin function with email and password
    // You can implement this function as mentioned earlier
  }

  @override
  Widget build(BuildContext context) {
    // Build the login UI here
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(''), // Replace with the actual image path
            fit: BoxFit.cover, // You can adjust this to 'fill', 'contain', or other values
          ),
        ),

        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'User-Name'),
            ),

            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),

              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                _handleSignup(); // Call the signup function
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class _handleSignup {
}

class SignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _handleSignup() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // Call the handleSignup function with name, email, and password
    // You can implement this function as mentioned earlier
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'User-Name'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                _handleSignup(); // Call the signup function
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
    // Build the signup UI here
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Barnyard Defenders'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Signup'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LoginPage(),
              SignupPage(),
            ],
          ),
        ),
      ),
    );
  }
}