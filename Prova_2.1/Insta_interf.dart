import 'package:flutter/material.dart';
import 'dart:ui'; // Necessário para PointerDeviceKind
void main() => runApp(const InstaApp());

class InstaApp extends StatelessWidget {
  const InstaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Linha pra dar scroll nos stories com mouse; Ativa o ''point e click''
      scrollBehavior: const MaterialScrollBehavior().copyWith( // Essa
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}, // Essa
      ),// E essa;
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      home: const HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Instagram'), <- Só escrita
        title: SizedBox(
          height: 50,
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/3840px-Instagram_logo.svg.png', // Aqui da pra alterar a imagem da logo do instagram
            fit: BoxFit.contain,
            
            color: Colors.black, 
          ),
        ),
        actions: [
          IconButton( // Icon do mais na caixa
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () {},
          ),
          IconButton( // Icon do coração
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          // InkWell para stackar o Icon de raio e de mensagem
          InkWell(
            onTap: () => debugPrint('Chat aberto'), 
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.messenger_outline_rounded, // Da pra colocar algum ícone melhor, se tiver algum que tenha o balão redondo/circular
                      size: 32, color: Colors.black),
                  Transform.translate(
                    offset: Offset(0, -2),
                    
                    child: Transform.rotate(
                      angle: 180.0, // Rotaciona o raio
                      child: Transform.flip(
                        flipX: true,
                        child: const Icon(Icons.bolt_rounded, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        //padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
     
            const Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: const Text(
                'Stories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),

            // Seção de Stories com Scroll Horizontal
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildYourStoryItem('Seu Story', 'https://pravatar.cc'), // Os links não estão funcionando pelo DartPad, pelo menos não alguns deles
                  _buildStoryItem('Luiz', 'https://pravatar.cc'), // https://dicebear.com
                  _buildStoryItem('Marcos', 'https://pravatar.cc'),
                  _buildStoryItem('Maria', 'https://pravatar.cc'),
                  _buildStoryItem('João', 'https://pravatar.cc'),
                  _buildStoryItem('Bianca', 'https://pravatar.cc'),
                  _buildStoryItem('Alberto', 'https://pravatar.cc'),
                  _buildStoryItem('Francisca', 'https://pravatar.cc'),
                  _buildStoryItem('Pedro', 'https://pravatar.cc'),
                  _buildStoryItem('Juliana', 'https://pravatar.cc'),
                ],
              ),
            ),
                
              
            // Parte da postagem
            // Da para colocar esta parte seguinte dentro de uma classe
            //const SizedBox(height: 20),
            //const Divider(), // Linha 
            //const SizedBox(height: 10),
            
            const PostWidget(
              username: 'Matheus Carlos', // Nome do autor do post
              userImage: 'https://pravatar.cc', // Imagem/avatar do autor
              postImage: 'https://png.pngtree.com/thumb_back/fh260/background/20240723/pngtree-thai-beach-landscape-blue-sky-beautiful-blue-ocean-sea-scape-island-image_15911321.jpg', // Imagem do post
              likedBy: 'marcos', // Quem curtiu
              date: '20 de Fevereiro', // Data da postagem
            ),
  
            const PostWidget(
              username: 'Glorpenio Zorpler',
              userImage: 'https://pravatar.cc',
              postImage: 'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/5367/production/_99315312_nasa.jpg.webp',
              likedBy: 'ana_silva',
              date: '21 de Fevereiro',
            ),
            
            //const Divider(),
            
          // Fim da column que começou nos stories  
          ],
          
          
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar (
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Índice do item selecionado
        onTap: (index) {
          // Lógica para mudar de tela
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '',),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: '',),
        BottomNavigationBarItem(icon: Icon(Icons.slideshow), label: '',),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '',),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: '',),
      ],
      ),
    );
    
  }

  // Widget para os Stories
  Widget _buildStoryItem(String nome, String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(40),
              child: Container(
                padding: const EdgeInsets.all(2), // Espaço para a borda
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.pink, Colors.purple],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: CircleAvatar(
                  radius: 35, // Primeiro círculo, que é a borda branca
                  backgroundColor: Colors.white,
                  child: CircleAvatar( 
                    radius: 32, // Segundo círculo, pro avatar
                    backgroundImage: NetworkImage(url),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(nome, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
  
  // Mesma coisa que em cima, mas para o seu story
  Widget _buildYourStoryItem(String nome, String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(32),
              child: Container(
                padding: const EdgeInsets.all(2), // Espaço para a borda
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(url),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: CircleAvatar( 
                          radius: 8, // Segundo círculo, pro avatar
                          backgroundColor: Colors.lightBlue,
                          child: Icon(
                            Icons.add,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(nome, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// Uma classe para o post
class PostWidget extends StatelessWidget {
  final String username;
  final String userImage;
  final String postImage;
  final String likedBy;
  final String date;

  const PostWidget({ // Construtor
    super.key,
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.likedBy,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(), // Divide os posts
        // Cabeçalho do post 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            children: [
              CircleAvatar( // Esse aqui é para o autor do post
                radius: 20,
                backgroundImage: NetworkImage(userImage),
              ),
              const SizedBox(width: 12),
              Text(
                username,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              IconButton( // Icone no final
                icon: const Icon(Icons.more_horiz, color: Colors.grey),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
        // Imagem do post
        Image.network(
          postImage,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        // Botões de ação na parte de baixo do post
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: [
              IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
              IconButton(icon: const Icon(Icons.mode_comment_outlined), onPressed: () {}), // Seria bom se tivesse um icone redondo de chat
              Transform.rotate(
                angle: -1.0,
                child: IconButton(icon: const Icon(Icons.send_outlined), onPressed: () {}),
              ), // Esse ícone pode ser alterado por um melhor
              const Spacer(),
              IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
            ],
          ),
        ),
        // Usuários que curtiram o post (ficam empilhados)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              _buildStackedAvatares(), // Chama o widget
              const SizedBox(width: 35),
              Text.rich( // Descrição
                TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    const TextSpan(text: "Curtido por "),
                    TextSpan(text: likedBy, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: " e "),
                    const TextSpan(text: "outros", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Data
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Text(
            date,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }

  // Widget pra auxiliar quando empilha cada usuário que curtiu
  Widget _buildStackedAvatares() {
  return SizedBox(
    width: 50, // Largura para os 3 avatares dos usuários
    height: 24, 
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        // Usuário 1
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 10,
            backgroundImage: NetworkImage('https://pravatar.cc'),
          ),
        ),
        // Usuário 2
        Positioned(
          left: 14,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage('https://pravatar.cc'),
            ),
          ),
        ),
        // Usuário 3
        Positioned(
          left: 28,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage('https://pravatar.cc'),
            ),
          ),
        ),
      ],
    ),
  );
}
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse, // Habilita o arrastar com mouse
      };
} 
