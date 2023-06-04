import 'package:flutter/material.dart';

class CustomSignIn extends StatelessWidget {
  const CustomSignIn({super.key, this.onTap});

  final Function()? onTap;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8)
          ),
        child: const Center(
          child: Text(
            "Вход", 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 16, 
              fontWeight: FontWeight.bold)))
      ),
    );
  }
}