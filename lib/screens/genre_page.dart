import 'package:flutter/material.dart';
import 'peau_page.dart'; // Import the PeauPage

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  int? _selectedGender;
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/genre.png',
                width: MediaQuery.of(context).size.width *
                    0.8, // Adjust width dynamically
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _genderButton(0, 'assets/images/male.png'),
                  const SizedBox(
                      width: 16), // Reduced width to fit screen better
                  _genderButton(1, 'assets/images/female.png'),
                ],
              ),
              if (_selectedGender == 0)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Votre mousse nettoyante sera aussi une mousse à raser 2 en 1.',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 16),
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Votre âge',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Précédent',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_validateAge()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PeauPage(),
                            ),
                          );
                        } else {
                          _showInvalidAgeDialog();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateAge() {
    final age = int.tryParse(_ageController.text);
    return age != null && age > 0 && age < 120;
  }

  void _showInvalidAgeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invalid Age'),
        content: const Text('Please enter a valid age to continue.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _genderButton(int gender, String asset) {
    final isSelected = _selectedGender == gender;
    return Flexible(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedGender = gender;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: isSelected
              ? (Matrix4.identity()..scale(1.1))
              : Matrix4.identity(),
          curve: Curves.easeInOut,
          child: ClipOval(
            child: Image.asset(
              asset,
              width: isSelected ? 120 : 100, // Adjust width dynamically
              height: isSelected ? 120 : 100, // Adjust height dynamically
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
