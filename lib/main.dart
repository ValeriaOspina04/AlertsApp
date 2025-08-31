
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Lista de sonidos (debes agregar los archivos en assets/audio/)
  final List<Map<String, String>> Sounds = [
    {'label': 'Español🇨🇴', 'file': 'holaespañol.mp3'},
    {'label': 'Ingles🇺🇸', 'file': 'holaIngles.mp3'},
    {'label': 'Frances🇫🇷', 'file': 'holaFrances.mp3'},
    {'label': 'Aleman🇩🇪', 'file': 'holaAleman.mp3'},
    {'label': 'Turco🇹🇷', 'file': 'holaTurco.mp3'},
  ];

  void _playSound(String fileName) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audio/$fileName'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Idiomas',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(108, 230, 142, 1),
                Color.fromRGBO(26, 58, 120, 1),
                ],
              ),
            ),
          ),
        ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Aprende un saludo en distintos idiomas!!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Presiona un botón para reproducir:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ...Sounds.map((sound) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(260, 60),
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    label: Text(sound['label']!),
                    onPressed: () => _playSound(sound['file']!),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
