import 'package:flutter/material.dart';
import 'package:gerajeune/screens/ecran.dart';

class ProduitUtilisePage extends StatefulWidget {
  const ProduitUtilisePage({Key? key}) : super(key: key);

  @override
  _ProduitUtilisePageState createState() => _ProduitUtilisePageState();
}

class _ProduitUtilisePageState extends State<ProduitUtilisePage> {
  List<String> selectedProducts = [];

  final List<String> products = [
    'Nettoyant',
    'Tonique',
    'Sérum',
    'Soins contour des yeux',
    'Crème de jour',
    'Crème de nuit',
    'Masque',
    'Produit solaire',
    'Maquillage',
    'Aucun produit',
  ];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
              ),
              // Image at the top with full width
              Image.asset(
                'assets/images/produit.png',
                width: MediaQuery.of(context).size.width,
                height: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              // Product Selection Grid
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    final isSelected = selectedProducts.contains(product);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedProducts.remove(product);
                          } else {
                            selectedProducts.add(product);
                          }
                        });
                      },
                      child: Card(
                        elevation: isSelected ? 6 : 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                            color:
                                isSelected ? Colors.green : Colors.grey[300]!,
                            width: 2,
                          ),
                        ),
                        color: isSelected ? Colors.green : Colors.white,
                        child: Center(
                          child: Text(
                            product,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Navigation Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
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
                        onPressed: selectedProducts.isNotEmpty
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EcranPage(),
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
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
