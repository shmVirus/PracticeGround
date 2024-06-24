import 'dart:io';
import 'ClassMedia.dart';

class Song extends Media {
    String artist;

    Song(this.artist);

    @override
    void play() {
        stdout.write("Playing song by ${artist}...\n");
    }
}
