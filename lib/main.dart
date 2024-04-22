import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      initialRoute: '/registration',
      routes: {
        '/registration': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        // Добавьте другие маршруты здесь
      },
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Добро пожаловать в FutureOn',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text('Вход'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _register(context);
            },
            child: Text('Регистрация'),
          ),
          SizedBox(height: 20),
          Text(
            'Здесь будет ваше изображение',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Future<void> _register(BuildContext context) async {
    try {
      // Создание нового пользователя с электронной почтой и паролем
      await _auth.createUserWithEmailAndPassword(
        email: 'user@example.com',
        password: 'password123',
      );

      // Дополнительная логика после успешной регистрации
      // Например, переход на другой экран
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      // Обработка ошибок регистрации
      print('Error registering user: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error registering user: $e'),
        ),
      );
    }
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
