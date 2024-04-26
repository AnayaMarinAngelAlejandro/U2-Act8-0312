import 'package:flutter/material.dart';

void main() => runApp(const AppMiTabBar());

class AppMiTabBar extends StatelessWidget {
  const AppMiTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TabBar Anaya 0312",
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MiPaginaInicial(),
    );
  }
}

//Stateful
class MiPaginaInicial extends StatefulWidget {
  const MiPaginaInicial({Key? key}) : super(key: key);

  @override
  State<MiPaginaInicial> createState() => _MiPaginaInicialState();
}

class _MiPaginaInicialState extends State<MiPaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffe32619),
          title: const Text(
            "WWE Anaya 0312",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Estrellas",
                icon: Icon(Icons.verified_user_outlined),
              ),
              Tab(
                text: "Eventos",
                icon: Icon(Icons.airplane_ticket),
              ),
              Tab(
                text: "Fechas",
                icon: Icon(Icons.shop),
              ),
              Tab(
                text: "Tienda",
                icon: Icon(Icons.masks),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _StyledImage(
              imageUrl:
                  "https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/BretHart.jpg",
              borderRadius: 200,
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
              size: 350,
            ),
            _StyledImage(
              imageUrl:
                  "https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/Eventos.png",
              borderRadius: 80,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
              size: 350,
            ),
            _StyledImage(
              imageUrl:
                  "https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/Fechas.jpg",
              borderRadius: 80,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
              size: 350,
            ),
            _StyledImage(
              imageUrl:
                  "https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/Mercancia.jpg",
              borderRadius: 20.0,
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
              size: 280,
            ),
          ],
        ),
      ),
    );
  }
}

class _StyledImage extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final List<BoxShadow> boxShadow;
  final double size;

  const _StyledImage({
    required this.imageUrl,
    required this.borderRadius,
    required this.boxShadow,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size,
            height: size,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image(
                image: imageUrl.startsWith('http')
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
