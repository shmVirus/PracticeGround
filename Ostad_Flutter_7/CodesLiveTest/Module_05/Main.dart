import 'dart:io';
import 'ClassMedia.dart';
import 'ClassSong.dart';

void main() {
    stdout.write("Your Name: ");
    String name = stdin.readLineSync()!;
    name = name.isEmpty ? "Anon" : name;

    Media media = Media();
    media.play();

    Song song = Song(name);
    song.play();
}
