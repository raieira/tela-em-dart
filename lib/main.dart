import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

// =================== TELA PRINCIPAL ===================
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FFEF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(),          // topo
              SizedBox(height: 20),
              GreetingSection(), // saudação
              SizedBox(height: 20),
              GolfCourseCard(    // card 1
                imageAsset: "assets/campo01.jpg",
                friends: "5+ Friends",
                title: "Winged Foot",
              ),
              SizedBox(height: 20),
              GolfCourseCard(    // card 2
                imageAsset: "assets/campo02.jpg",
                friends: "6+ Friends",
                title: "TPC Sawgrass",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =================== WIDGET TOPO ===================
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, size: 28),
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage("assets/campo01.png"), // só exemplo
        ),
      ],
    );
  }
}

// =================== WIDGET SAUDAÇÃO ===================
class GreetingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("HELLO,", style: TextStyle(fontSize: 22)),
        Text("JACK NICKLAUS",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.location_on, size: 18, color: Colors.grey),
            SizedBox(width: 4),
            Text("Columbus, Ohio", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

// =================== WIDGET CARD DO CAMPO ===================
class GolfCourseCard extends StatelessWidget {
  final String imageAsset;
  final String friends;
  final String title;

  GolfCourseCard({
    required this.imageAsset,
    required this.friends,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imageAsset), // imagem local
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // camada escura em cima da imagem
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black26,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(friends, style: TextStyle(color: Colors.white)),
                Spacer(),
                Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                StartRoundButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =================== WIDGET BOTÃO ===================
class StartRoundButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text("Start Round"),
    );
  }
}
