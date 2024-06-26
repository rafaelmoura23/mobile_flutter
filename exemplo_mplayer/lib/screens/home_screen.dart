import 'package:exemplo_mplayer/screens/music_player_screen.dart';
import 'package:flutter/material.dart';
import '../services/music_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MusicService _service = MusicService();

  Future<void> _getList() async {
    try {
      await _service.fetchList();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
              child: Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                      future: _getList(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (_service.list.isEmpty) {
                          return const Center(
                              child: Text('Não há músicas cadastradas'));
                        } else {
                          return ListView.builder(
                              itemCount: _service.list.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(_service.list[index].title),
                                  subtitle: Text(_service.list[index].artist),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MusicPlayerScreen(
                                                  music: _service
                                                      .list[index])),
                                    );
                                  },
                                );
                              });
                        }
                      }))
            ],
          )),
        ));
  }
}
