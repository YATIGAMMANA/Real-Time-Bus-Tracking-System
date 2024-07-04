// ignore_for_file: unused_field, unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'passenger_signup.dart';
import 'pilot_signup.dart';
import 'signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/signup': (context) => const SignUpScreen(),
        '/signup/passenger': (context) => const PassengerSignUpScreen(),
        '/signup/pilot': (context) => const PilotSignUpScreen(),
        '/': (context) => const RegistrationScreen(),
        '/login': (context) => const LoginScreen(),
        '/person_login': (context) => const PersonLoginScreen(),
        '/pilot_login': (context) => const PilotLoginScreen(),
      },
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: 'B.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Pilot',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 229, 228),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '\nBus Pilot Operator',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 247, 224, 26),
        centerTitle: true,
        toolbarHeight: 150,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Image.asset(
                'assets/dsBuffer.png',
                width: double.infinity,
              ),
            ),
            SizedBox(
              width: 150,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromARGB(255, 247, 224, 26),
                ),
                child: const Text(
                  'START',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: 'B.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Pilot',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 229, 228),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '\nBus Pilot Operator',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 247, 224, 26),
        centerTitle: true,
        toolbarHeight: 150,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  'Login as a ',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              // Center the passenger login button
              child: SizedBox(
                width: 200,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/person_login');
                  },
                  icon: const Column(
                    children: [
                      Icon(Icons.person, size: 120, color: Colors.black),
                      SizedBox(height: 5),
                      Text(
                        'Passenger',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  label: const Text(''),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(color: Colors.black, width: 1),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30), // Small space added here
            Center(
              // Center the pilot login button
              child: SizedBox(
                width: 200,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/pilot_login');
                  },
                  icon: const Column(
                    children: [
                      Icon(Icons.directions_bus,
                          size: 120, color: Colors.black),
                      SizedBox(height: 5),
                      Text(
                        'Rider',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  label: const Text(''),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(color: Colors.black, width: 1),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonLoginScreen extends StatefulWidget {
  const PersonLoginScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PersonLoginScreenState createState() => _PersonLoginScreenState();
}

class _PersonLoginScreenState extends State<PersonLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nic = '';
  String _password = '';

  Row signUpPassangerOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PassengerSignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var nicField = TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || (value.length != 9 && value.length != 12)) {
          return 'Incorrect Email';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          _nic = value.toString();
        }
      },
    );

    var passwordField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.length < 8) {
          return 'Password should be at least 8 characters!';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          _password = value.toString();
        }
      },
    );

    var loginButton = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          _formKey.currentState?.save();
          // Perform login with _nic and _password
          // Add your login logic here
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Adjust the border radius here
          side: const BorderSide(color: Colors.black), // Add black border color
        ),
        backgroundColor: Colors.white,
        padding:
            const EdgeInsets.symmetric(vertical: 15), // Button background color
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: 'B.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Pilot',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 229, 228),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '\nBus Pilot Operator',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 247, 224, 26),
        centerTitle: true,
        toolbarHeight: 150,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Login as a passenger ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.person, color: Colors.black, weight: 50, size: 40),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: nicField,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: passwordField,
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 140,
                  child: loginButton,
                ),
              ),
              const SizedBox(
                  height:
                      20), // Add some space between the login button and sign-up option
              signUpPassangerOption(), // Display the sign-up option
            ],
          ),
        ),
      ),
    );
  }
}

class PilotLoginScreen extends StatefulWidget {
  const PilotLoginScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PilotLoginScreenState createState() => _PilotLoginScreenState();
}

class _PilotLoginScreenState extends State<PilotLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  Row signUpPilotOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PilotSignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var busRegNumberField = TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email';
        }
        return null;
      },
      onSaved: (value) {
        // Use the value if needed
      },
    );

    var passwordField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.length < 8) {
          return 'Password should be at least 8 characters!';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {}
      },
    );

    var loginButton = SizedBox(
      width: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            _formKey.currentState?.save();
            // Perform login with _busRegistrationNumber and _password
            // Add your login logic here
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Adjust the border radius here
            side:
                const BorderSide(color: Colors.black), // Add black border color
          ),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 2,
          ), // Button background color
        ),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: 'B.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Pilot',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 229, 228),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '\nBus Pilot Operator',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 247, 224, 26),
        centerTitle: true,
        toolbarHeight: 150,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Login as a rider ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.directions_bus,
                    color: Colors.black,
                    weight: 50,
                    size: 50,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: busRegNumberField,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: passwordField,
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 140,
                  child: loginButton,
                ),
              ),
              const SizedBox(
                  height:
                      20), // Add some space between the login button and sign-up option
              signUpPilotOption(),
            ],
          ),
        ),
      ),
    );
  }
}
