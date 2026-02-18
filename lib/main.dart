import 'package:flutter/material.dart';

void main() {
  runApp(const PChopApp());
}

class PChopApp extends StatelessWidget {
  const PChopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PantallaCarrito(),
    );
  }
}

class PantallaCarrito extends StatelessWidget {
  const PantallaCarrito({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Fondo morado tenue
      appBar: AppBar(
        backgroundColor: const Color(0xFFB39DDB),
        title: const Text("PChop", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título Carrito
                const Text(
                  "Carrito",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF5E35B1)),
                ),
                const SizedBox(height: 20),

                // Lista de productos del boceto
                Expanded(
                  child: ListView(
                    children: [
                      _itemCarrito("Procesador i9", "\$1,500", "https://raw.githubusercontent.com/Adrian-Hazael-hdz/Act10_SegunPan_1128/refs/heads/main/carrito1.jpg"),
                      _itemCarrito("Laptop Gamer", "\$18,000", "https://raw.githubusercontent.com/Adrian-Hazael-hdz/Act10_SegunPan_1128/refs/heads/main/carrito2.jpg"),
                      _itemCarrito("Tarjeta de Video", "\$2,000", "https://raw.githubusercontent.com/Adrian-Hazael-hdz/Act10_SegunPan_1128/refs/heads/main/carrito3.jpg"),
                      _itemCarrito("Smartphone Z", "\$7,500", "https://raw.githubusercontent.com/Adrian-Hazael-hdz/Act10_SegunPan_1128/refs/heads/main/carrito4.jpg"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Botones inferiores (Volver y Checkout)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _botonInferior("Volver", Icons.replay_outlined),
                    _botonInferior("Check out", null),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget para cada fila de producto según el boceto
  Widget _itemCarrito(String nombre, String precio, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen cuadrada
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.5),
            ),
            child: Image.network(url, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          // Información al lado
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(precio, style: const TextStyle(fontSize: 16, color: Colors.black87)),
              const SizedBox(height: 10),
              // Iconos de papelera e info
              Row(
                children: [
                  const Icon(Icons.delete_outline, color: Colors.black, size: 28),
                  const SizedBox(width: 15),
                  const Icon(Icons.info_outline, color: Colors.black, size: 28),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  // Widget para los botones de abajo
  Widget _botonInferior(String texto, IconData? icono) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Row(
        children: [
          Text(texto, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          if (icono != null) ...[
            const SizedBox(width: 8),
            Icon(icono, size: 20),
          ]
        ],
      ),
    );
  }
}