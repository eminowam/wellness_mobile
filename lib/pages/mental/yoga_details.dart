import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/data/models/article/mental_model.dart';

import '../../widgets/app_scaffold/app_scaffold.dart';
import '../../widgets/utils/custom_button.dart';

class YogaDetails extends StatefulWidget {
  const YogaDetails({super.key, required this.results, this.meditationId});

  final MeditationModel results;
  final String? meditationId;

  @override
  State<YogaDetails> createState() => _YogaDetailsState();
}

class _YogaDetailsState extends State<YogaDetails> {
  final player = AudioPlayer();

  late AudioPlayer _audioPlayer;
  late String _audioUrl;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    // _fetchAudioUrl();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: widget.results.title,
        icon2: Icons.arrow_back,
        onPressed2: () {
          Navigator.pop(context);
        },
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 190,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  widget.results.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 23, right: 23, left: 23, bottom: 43),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.results.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "${widget.results.duration} min ",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          widget.results.description,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.55),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                            width: 350,
                            height: 48,
                            child: CustomButton(
                              title: 'Start',
                              onPressed: () {
                                // player.play(Source(widget.results.audio));
                              },
                            )),
                      ]),
                ))
          ]),
        ));
  }
}
