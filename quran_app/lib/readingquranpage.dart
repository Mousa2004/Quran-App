import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/buttonavigationpage.dart';

class Readingquranpage extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  const Readingquranpage({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  @override
  State<Readingquranpage> createState() => _ReadingquranpageState();
}

class _ReadingquranpageState extends State<Readingquranpage> {
  List ayahs = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlayingAll = false;
  bool isRepeating = false;
  String selectedReciterKey = 'ناصر القطامي';

  final Map<String, String> reciters = {
    'ناصر القطامي': 'https://server6.mp3quran.net/qtm',
    'العفاسي': 'https://server8.mp3quran.net/afs',
  };

  @override
  void initState() {
    fetchAyahs();
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> fetchAyahs() async {
    final url =
        'https://api.alquran.cloud/v1/surah/${widget.surahNumber}/ar.uthmani';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        ayahs = data['data']['ayahs'];
      });
    } else {
      throw Exception('Failed to load verses');
    }
  }

  String getAudioUrl(int surahNumber) {
    final serverUrl = reciters[selectedReciterKey]!;
    final surahNumberStr = surahNumber.toString().padLeft(3, '0');
    return '$serverUrl/$surahNumberStr.mp3';
  }

  Future<void> playSurah() async {
    try {
      final audioUrl = getAudioUrl(widget.surahNumber);
      await _audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(audioUrl)),
        preload: true,
      );
      await _audioPlayer.play();
      setState(() {
        isPlayingAll = true;
      });

      _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          if (isRepeating) {
            playSurah();
          } else {
            setState(() {
              isPlayingAll = false;
            });
          }
        }
      });
    } catch (e) {
      print("Error while playing: $e");
    }
  }

  void stopRecitation() {
    _audioPlayer.stop();
    setState(() {
      isPlayingAll = false;
    });
  }

  void pauseRecitation() {
    _audioPlayer.pause();
    setState(() {
      isPlayingAll = false;
    });
  }

  void resumeRecitation() {
    _audioPlayer.play();
    setState(() {
      isPlayingAll = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0FA),
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.only(left: 40),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => Buttonavigationpage(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: Image.asset("images/back.png", height: 35, width: 35),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Quran",
                    style: TextStyle(
                      color: Color(0xFF300759),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 90),
                Container(
                  padding: const EdgeInsets.only(left: 65),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1BEE7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 35,
                  width: 110,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xFF300759),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.surahName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7B15BF),
                        ),
                      ),
                      Text(
                        'Verse ${ayahs.length}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          isPlayingAll
                              ? Icons.pause_circle
                              : Icons.play_circle_fill,
                          color: const Color(0xFF7B15BF),
                          size: 34,
                        ),
                        tooltip: isPlayingAll ? "Pause" : "Play audio",
                        onPressed: () {
                          if (isPlayingAll) {
                            pauseRecitation();
                          } else {
                            playSurah();
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.green,
                          size: 28,
                        ),
                        tooltip: "Resume",
                        onPressed: resumeRecitation,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.stop_circle,
                          color: Colors.red,
                          size: 30,
                        ),
                        tooltip: "Stop",
                        onPressed: stopRecitation,
                      ),
                      IconButton(
                        icon: Icon(
                          isRepeating ? Icons.repeat_on : Icons.repeat,
                          color: isRepeating ? Colors.deepPurple : Colors.grey,
                        ),
                        tooltip: "Reapet",
                        onPressed: () {
                          setState(() {
                            isRepeating = !isRepeating;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedReciterKey,
                icon: const Icon(Icons.arrow_drop_down),
                items:
                    reciters.keys.map((key) {
                      return DropdownMenuItem<String>(
                        value: key,
                        child: Text(key),
                      );
                    }).toList(),
                onChanged: (newKey) {
                  setState(() {
                    selectedReciterKey = newKey!;
                  });
                },
              ),
            ),
            Expanded(
              child:
                  ayahs.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: ayahs.length,
                        itemBuilder: (context, index) {
                          final ayah = ayahs[index];
                          return Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              title: Text(
                                '${ayah['text']}',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                'الآية رقم ${ayah['numberInSurah']}',
                                textAlign: TextAlign.right,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
