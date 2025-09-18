import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Julio";
  String bio = "Amante de los animales 🐾";
  String email = "julio@ejemplo.com";
  String phone = "+51 987654321";
  String location = "Lima, Perú";

  // ---- Función para mostrar diálogo de edición ----
  Future<void> _editField(String title, String currentValue, Function(String) onSave) async {
    final controller = TextEditingController(text: currentValue);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Editar $title"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Escribe tu $title",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ---- Avatar + Nombre ----
              const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/profile_demo.png'), // demo
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _editField("nombre", name, (val) => setState(() => name = val)),
                child: Text(
                  name,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () => _editField("biografía", bio, (val) => setState(() => bio = val)),
                child: Text(
                  bio,
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                ),
              ),
              const SizedBox(height: 30),

              // ---- Información Principal ----
              _buildInfoCard([
                _buildInfoTile(Icons.email_outlined, email, "Correo electrónico",
                    onTap: () => _editField("correo", email, (val) => setState(() => email = val))),
                _divider(),
                _buildInfoTile(Icons.phone_outlined, phone, "Teléfono",
                    onTap: () => _editField("teléfono", phone, (val) => setState(() => phone = val))),
                _divider(),
                _buildInfoTile(Icons.location_on_outlined, location, "Ubicación",
                    onTap: () => _editField("ubicación", location, (val) => setState(() => location = val))),
              ]),

              const SizedBox(height: 20),

              // ---- Métricas ----
              Row(
                children: [
                  Expanded(child: _buildStat("Adopciones", "12")),
                  Expanded(child: _buildStat("Rescates", "5")),
                  Expanded(child: _buildStat("Likes", "48")),
                ],
              ),
              const SizedBox(height: 20),

              // ---- Opciones de Configuración ----
              _buildInfoCard([
                _buildInfoTile(Icons.pets, "Mis adopciones", "Historial"),
                _divider(),
                _buildInfoTile(Icons.favorite_border, "Favoritos", "Animales guardados"),
                _divider(),
                _buildInfoTile(Icons.settings_outlined, "Configuración", "Cuenta y privacidad"),
                _divider(),
                _buildInfoTile(Icons.notifications_outlined, "Notificaciones", "Preferencias"),
              ]),

              const SizedBox(height: 30),

              // ---- Botón Cerrar Sesión ----
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {},
                icon: const Icon(Icons.logout),
                label: const Text("Cerrar sesión", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Widgets Auxiliares ----
  Widget _buildInfoCard(List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[600], fontSize: 13),
      ),
      trailing: const Icon(Icons.edit, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _divider() => const Divider(height: 1, thickness: 0.6);

  Widget _buildStat(String label, String value) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(label, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
