import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  );

  @override
  void initState() {
    super.initState();
    _ctrl.forward();
    Future.delayed(const Duration(milliseconds: 1800), () {
// navigate with fade
      Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => const LoginScreen(),
        transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
      ));
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ScaleTransition(
            scale: CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'app-logo',
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
                      shape: BoxShape.circle,
                      boxShadow: const [BoxShadow(blurRadius: 12, color: Colors.black12, offset: Offset(0, 6))],
                    ),
                    child: const Icon(Icons.pets, size: 72),
                  ),
                ),
                const SizedBox(height: 18),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 900),
                  child: Text('RescuePaws', style: Theme.of(context).textTheme.headlineSmall),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}