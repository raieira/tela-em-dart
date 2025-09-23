import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaPrincipal(),
  ));
}

//
// ================== TELA PRINCIPAL ==================
//
class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FFEF), // cor do fundo
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Menu(),                   // topo da tela
              SizedBox(height: 20),
              Usuario(),                // parte de saudação
              SizedBox(height: 20),
              Campo(                    // campo 1
                imagem: "assets/campo01.jpg",
                amigos: "5+ amigos",
                titulo: "Lajedo",
              ),
              SizedBox(height: 20),
              Campo(                    // campo 2
                imagem: "assets/campo02.jpg",
                amigos: "6+ amigos",
                titulo: "Jupi",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// ================== MENU ==================
//
class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, size: 28), // ícone do menu
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage("assets/rai.jpeg"), // minha foto
        ),
      ],
    );
  }
}

//
// ================== USUÁRIO ==================
//
class Usuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Olá,", style: TextStyle(fontSize: 22)),
        Text("Rai Vieira",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.location_on, size: 18, color: Colors.grey),
            SizedBox(width: 4),
            Text("Garanhuns, PE", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

//
// ================== CAMPO ==================
//
class Campo extends StatelessWidget {
  final String imagem;
  final String amigos;
  final String titulo;

  Campo({
    required this.imagem,
    required this.amigos,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagem),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // fundo escuro em cima da imagem
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black26,
            ),
          ),
          // textos e botão
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(amigos, style: TextStyle(color: Colors.white)),
                Spacer(),
                Text(titulo,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                BotaoAgendar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// ================== BOTÃO ==================
//
class BotaoAgendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text("Agendar"),
    );
  }
}
