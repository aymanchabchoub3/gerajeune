import 'package:flutter/material.dart';
import 'package:gerajeune/screens/beauty_quiz_page.dart';
import 'package:gerajeune/screens/face_capture_page.dart.dart';
import 'package:gerajeune/screens/home_screen.dart';
import 'login_page.dart'; // Import the LoginPage

class FaceCarePage extends StatelessWidget {
  const FaceCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First Image
              Image.asset(
                'assets/images/mirror1.png', // Replace with your image asset
                width: double.infinity,
                height: MediaQuery.of(context).size.height *
                    0.25, // Adjusted height
                fit: BoxFit.cover,
              ),

              // Second Image
              Image.asset(
                'assets/images/mirror2.png', // Replace with your image asset
                width: double.infinity,
                height:
                    MediaQuery.of(context).size.height * 0.2, // Adjusted height
                fit: BoxFit.cover,
              ),

              // Three Buttons
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FaceCapturePage(
                              onFaceDetected: (progress) {
                                // Handle face detection progress here
                                print('Face detection progress: $progress');
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF256142),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Scannez votre visage',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BeautyQuizPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF256142),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Commencez le quiz',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Replace this section in FaceCarePage
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF256142),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Connectez-vous',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Replace the text with an image
              Image.asset(
                'assets/images/mirror4.png', // Replace with your image asset
                width: 400,
                height: MediaQuery.of(context).size.height *
                    0.17, // Adjust height as needed
                fit: BoxFit.cover,
              ),

              // Bottom Image
              Image.asset(
                'assets/images/mirror3.png', // Replace with your image asset
                width: double.infinity,
                height: MediaQuery.of(context).size.height *
                    0.08, // Adjusted height
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
