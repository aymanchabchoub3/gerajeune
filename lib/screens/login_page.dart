import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.green.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Top Image
            Image.asset(
              'assets/images/home.png', // Path to your image
              width: double.infinity,
              height: 400, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            // White background section
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0), // Adjust this value to move content up
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Connexion',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Email field
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email,
                                  color: Colors.green.shade600),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Password field
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Mot de passe',
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.green),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              suffix: GestureDetector(
                                onTap: () {
                                  // Handle "Mot de passe oublié" tap
                                },
                                child: const Text(
                                  'Mot de passe oublié',
                                  style: TextStyle(
                                    color: Colors.green,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Login button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle login button press
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green.shade600,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: const Text('Connexion'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Social login section
                        Center(
                          child: Column(
                            children: [
                              const Text(
                                'ou connectez-vous avec',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Google login button
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Google login
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    side: BorderSide(
                                        color: Colors.black.withOpacity(0.1)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/google.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(width: 10),
                                      const Text('Google',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // "No account" text and sign-up link
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Vous n\'avez pas de compte ? '),
                                  GestureDetector(
                                    onTap: () {
                                      // Handle "s'inscrire ici" tap
                                    },
                                    child: const Text(
                                      'S\'inscrire ici',
                                      style: TextStyle(
                                        color: Colors.green,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Back button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // Navigate back to the main page
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green.shade600,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  child: const Text('Retour'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
