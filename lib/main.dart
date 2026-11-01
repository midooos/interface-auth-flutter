// ============================================================
// TP 1 Flutter : Interface d'Authentification Simplifiée
// Réalisé par : Mohamed
// Modification : comparaison m3a email w mot de passe s7a7 (mkatbin fil code)
// ============================================================

// Nimportiw el packages elli nestahkou fihom (el widgets mta3 Flutter)
import 'package:flutter/material.dart';

// Fonction principale - point d'entrée mta3 el application
void main() {
  runApp(MyApp());
}

// Classe principale mta3 el application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp houwa el widget racine elli ydhbot el application
    return MaterialApp(
      title: 'Mon App d\'Authentification',
      theme: ThemeData(
        primarySwatch: Colors.blue, // el couleur principale
      ),
      home: LoginScreen(), // awel écran yetaarad
    );
  }
}

// Écran de connexion - StatefulWidget khater yidir gestion mta3 état (les champs de texte)
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// État mta3 écran de connexion
class _LoginScreenState extends State<LoginScreen> {
  // Controllers bech nlaqqtou el valeurs mta3 champs texte
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variable bech nraqbou el chargement
  bool _isLoading = false;

  // ----- MODIFICATION : el email w el mot de passe s7a7 mkatbin fil code -----
  // Hedhom elli bech nqarnou bihom ma nektbou el utilisateur
  final String correctEmail = 'mohamed@gmail.com';
  final String correctPassword = '12345678';

  // Méthode tetnadha ki nodghto aala bouton connexion
  void _handleLogin() {
    // Récupération des valeurs
    String email = _emailController.text;
    String password = _passwordController.text;

    // Validation basique
    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Veuillez remplir tous les champs');
      return;
    }

    if (!email.contains('@')) {
      _showErrorDialog('Veuillez entrer un email valide');
      return;
    }

    // ----- MODIFICATION : comparaison binethom -----
    // Ken el email wala el mot de passe ghalet, naarddou erreur w nwa99fou
    if (email != correctEmail || password != correctPassword) {
      _showErrorDialog('Email ou mot de passe incorrect');
      return;
    }

    // Simulation de connexion
    setState(() {
      _isLoading = true;
    });

    // Simulation d'un appel réseau (2 secondes)
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // Afficher un message de succès
      _showSuccessDialog();
    });
  }

  // Méthode bech naarddou erreur
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erreur'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Méthode bech naarddou succès
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Succès'),
          content: Text('Connexion réussie ! Bienvenue ${_emailController.text}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Réinitialiser les champs
                _emailController.clear();
                _passwordController.clear();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold yaati el structure de base mta3 el écran
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        // SafeArea ybaad el contenu aal zones mouch amna (encoche, etc.)
        child: Padding(
          padding: EdgeInsets.all(24.0), // Marge intérieure
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrer verticalement
            children: [
              // Titre
              Text(
                'Connexion',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              SizedBox(height: 40), // Espacement

              // Champ Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'entrez@votre.email',
                  prefixIcon: Icon(Icons.email), // Icône 9bal el texte
                  border: OutlineInputBorder(), // Bordure
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.emailAddress, // Clavier mnaseb lel email
              ),

              SizedBox(height: 20), // Espacement

              // Champ Mot de passe
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  hintText: 'Entrez votre mot de passe',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true, // Yokhfi el texte (lel mots de passe)
              ),

              SizedBox(height: 30),

              // Bouton de connexion
              _isLoading
                  ? CircularProgressIndicator() // Yodhher indicateur de chargement
                  : ElevatedButton(
                      onPressed: _handleLogin,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        child: Text(
                          'Se connecter',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

              SizedBox(height: 20),

              // Lien d'inscription
              TextButton(
                onPressed: () {
                  // Tawa ken message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Fonctionnalité d\'inscription à venir !'),
                    ),
                  );
                },
                child: Text(
                  'Créer un compte',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Méthode tetnadha ki el widget yetfsakh
  @override
  void dispose() {
    // Nnadhfou el controllers bech ma ykounouch fuites de mémoire
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
