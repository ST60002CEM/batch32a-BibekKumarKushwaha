import 'package:flutter/material.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.blue[800]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    obscureText: obscureText,
    keyboardType: keyboardType,
    validator: validator,
  );
}

Widget buildPasswordField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  bool obscureText = true,
  TextInputType keyboardType = TextInputType.text,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.blue[800]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    obscureText: obscureText,
    keyboardType: keyboardType,
    validator: validator,
  );
}

Widget buildSocialLoginButton(
  String text,
  String asset,
  Color color,
  VoidCallback onPressed,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: color,
      backgroundColor: Colors.white,
      side: BorderSide(color: color),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      textStyle: TextStyle(fontSize: 16.0, color: color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          asset,
          height: 24.0,
          width: 24.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(color: color),
        ),
      ],
    ),
  );
}

Widget buildMainLoginButton(
  String text,
  Color color,
  VoidCallback onPressed,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 130.0),
      textStyle: const TextStyle(fontSize: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}
