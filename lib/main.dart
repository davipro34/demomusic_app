import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hero Animation Music Demo',
      home: TabsPage(),
    );
  }
}

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Search library',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.list,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: GridSection(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio),
            label: 'Radio',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.deepPurple.shade700,
        onTap: _onItemTapped,
      ),
    );
  }
}

class GridSection extends StatelessWidget {
  const GridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const ResponsiveGridList(
        minSpacing: 10,
        desiredItemWidth: 150, 
        children: [
          SizedBox(height: 10),
          SizedBox(height: 10),
          AlbumCover(
          albumUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRr4Q776RctXur78Z4NaMRrdh7-_2CZ7wDdBg&usqp=CAU',
          albumName: 'Starboy',
          albumArtist: 'The WeekEnd',
          ),
          AlbumCover(
            albumUrl:
              'https://i.pinimg.com/236x/26/eb/e9/26ebe9788b358c734a2851048d05b12c--pop-albums-music-albums.jpg',
            albumName: 'Born to die',
            albumArtist: 'Lana Del Rey',
          ),
          AlbumCover(
            albumUrl:
              'https://i.pinimg.com/originals/6a/65/a1/6a65a167095e5f930b5569b276818213.jpg',
            albumName: 'Overexposed',
            albumArtist: 'Maroon 5'
          ),
          AlbumCover(
            albumUrl:
              'https://images-na.ssl-images-amazon.com/images/I/31tZr4Nr5vL._AC_SY450_.jpg',
            albumName: 'Dark Side',
            albumArtist: 'Pink Floyd'
          ),
          AlbumCover(
            albumUrl:
              'https://static.billboard.com/files/media/Taylor-Swift-1989-album-covers-billboard-1000x1000-compressed.jpg',
            albumName: '1989',
            albumArtist: 'Taylor Swift',
          ),
          AlbumCover(
            albumUrl:
              'https://img.huffingtonpost.com/asset/5badb5be200000e500ff1775.jpeg?ops=scalefit_630_noupscale',
            albumName: 'Thriller',
            albumArtist: 'Michael Jackson',
          ),
          SizedBox(height: 10),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class AlbumCover extends StatelessWidget {
  final String albumUrl;
  final String albumName;
  final String albumArtist;

  const AlbumCover({super.key, required this.albumUrl, required this.albumName, required this.albumArtist});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.3),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumPage(
                  albumUrl: albumUrl,
                  albumTag: albumName,
                  albumName: albumName,
                  albumArtist: albumArtist,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: albumName,
                child: Image.network(albumUrl),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      albumName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      albumArtist,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlbumPage extends StatelessWidget {
  final String albumUrl;
  final String albumTag;
  final String albumArtist;
  final String albumName;
  const AlbumPage({super.key, required this.albumUrl, required this.albumTag, required this.albumArtist, required this.albumName});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black.withOpacity(0.4),
      ),
      body: Hero(
        tag: albumTag,
        child: Image.network(albumUrl),
      ),
    );
  }
}
