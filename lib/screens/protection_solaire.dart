import 'package:flutter/material.dart';
import 'package:gerajeune/screens/protection_solaire_preferez.dart';

class ProtectionSolairePage extends StatefulWidget {
  const ProtectionSolairePage(
      {Key? key, required this.selectedOption, required buttonStateNotifier})
      : super(key: key);

  final String selectedOption;

  @override
  _ProtectionSolairePageState createState() => _ProtectionSolairePageState();
}

class _ProtectionSolairePageState extends State<ProtectionSolairePage> {
  String? selectedOption;
  bool showTextField = false;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f2f1), Color(0xFF256142)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/protection_solaire.png',
                width: MediaQuery.of(context).size.width,
                height: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  _buildOptionButton('Toujours'),
                  const SizedBox(height: 18),
                  _buildOptionButton('Seulement en été'),
                  const SizedBox(height: 18),
                  _buildOptionButton('Jamais'),
                  const SizedBox(height: 18),
                  _buildOptionButton('Parfois'),
                  const SizedBox(height: 18),
                  _buildOptionButton('Seulement à la plage'),
                  const SizedBox(height: 18),
                  _buildOptionButton('Autre'),
                  if (showTextField)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                          hintText: 'Insérez votre texte',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 160),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shadowColor: Colors.grey.withOpacity(0.5),
                        elevation: 5,
                      ),
                      child: const Text('Précédent',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedOption != null
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProtectionSolairePreferezPage(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shadowColor: Colors.green.withOpacity(0.5),
                        elevation: 5,
                      ),
                      child: const Text('Continuer',
                          style: TextStyle(fontSize: 16)),
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

  Widget _buildOptionButton(String label) {
    final isSelected = selectedOption == label;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedOption = label;
          showTextField = (label == 'Autre');
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.green,
        backgroundColor: isSelected ? Colors.green : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.green, width: 2),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shadowColor: Colors.grey.withOpacity(0.3),
        elevation: 3,
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
