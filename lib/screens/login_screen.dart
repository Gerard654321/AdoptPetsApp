import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.info_outline),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Hero(tag: 'app-logo', child: Icon(Icons.pets, size: 56)),
                    const SizedBox(height: 18),
                    Text('Bienvenido', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 6),
                    Text('Inicia sesión para continuar', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 24),

                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            TextField(
                              controller: _emailCtrl,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(prefixIcon: Icon(Icons.email), hintText: 'Correo'),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              controller: _passCtrl,
                              obscureText: _obscure,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                hintText: 'Contraseña',
                                suffixIcon: IconButton(
                                  icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                                  onPressed: () => setState(() => _obscure = !_obscure),
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                onPressed: () {
// visual only: navigate to Home
                                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => const HomeScreen(),
                                    transitionsBuilder: (_, anim, __, child) {
                                      return FadeTransition(opacity: anim, child: child);
                                    },
                                  ));
                                },
                                child: const Text('Iniciar sesión'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                    Center(child: TextButton(onPressed: () {}, child: const Text('Crear cuenta (demo)'))),
                  ]
              )
          )
        )
    );
  }
}