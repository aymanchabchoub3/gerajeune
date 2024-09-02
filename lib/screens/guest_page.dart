import 'package:flutter/material.dart';
import 'face_care_page.dart'; // Import new pages
import 'hair_care_page.dart';
import 'body_care_page.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({super.key});

  @override
  _GuestPageState createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  String _selectedCareType = ''; // Track selected care type

  void _selectCareType(String careType) {
    setState(() {
      _selectedCareType = careType;
    });
  }

  void _navigateToCarePage(BuildContext context, String careType) {
    Widget page;
    switch (careType) {
      case 'face':
        page = const FaceCarePage();
        break;
      case 'hair':
        page = const HairCarePage();
        break;
      case 'body':
        page = const BodyCarePage();
        break;
      default:
        page = const FaceCarePage(); // Default page
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white, // Set body background color to white
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Image.asset(
                  'assets/images/guestpage.png',
                  width: 310, // Adjust width as needed
                  height: 120, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16), // Space between image and buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildCareButton(
                        text: 'Personnalisez votre soin visage',
                        careType: 'face',
                      ),
                      const SizedBox(height: 16),
                      _buildCareButton(
                        text: 'Personnalisez votre soin cheveux',
                        careType: 'hair',
                      ),
                      const SizedBox(height: 16),
                      _buildCareButton(
                        text: 'Personnalisez votre soin corps',
                        careType: 'body',
                      ),
                      const SizedBox(height: 16),
                      _buildCareButton(
                        text: 'Composez votre parfum aux extraits naturels',
                        careType: 'perfume',
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_selectedCareType.isNotEmpty) {
                              _navigateToCarePage(context, _selectedCareType);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF256142),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'Continuez',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareButton({
    required String text,
    required String careType,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _selectCareType(careType);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor:
              _selectedCareType == careType ? Colors.white : Colors.black,
          backgroundColor: _selectedCareType == careType
              ? Colors.green.shade600
              : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          side: BorderSide(
            color: _selectedCareType == careType
                ? Colors.green.shade600
                : Colors.grey.shade300,
            width: 1,
          ),
          shadowColor: Colors.grey.withOpacity(0.3),
          elevation: 5,
        ),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
