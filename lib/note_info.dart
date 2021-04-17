import 'package:object_detection/note.dart';

final lc = Note(
    id: 0,
    name: 'lc',
    displayName: 'C4 Crotchet',
    imagePath: 'c.png',
    description:
        'A C4 crotchet note, also known as middle C. It is the first note of the C major scale, and the fourth note of the Guidonian hand. In solfege, it is referred to as "Do". On a standard piano, it is located immediately to the left of the two black keys.');

final d = Note(
    id: 1,
    name: 'd',
    displayName: 'D4 Crotchet',
    imagePath: 'd.png',
    description:
        'A D4 crotchet note. It is a whole tone above the note C and is referred to as "Re" in the solfege system. On a standard piano it is located between the two black keys (C# and D#).');

final e = Note(
    id: 2,
    name: 'e',
    displayName: 'E4 Crotchet',
    imagePath: 'e.png',
    description:
        'An E4 crotchet note. E is the third note of the C major scale and referred to as "mi" in fixed-do solfege. On a standard piano it is located to the right of the two black keys.');

final f = Note(
    id: 3,
    name: 'f',
    displayName: 'F4 Crotchet',
    imagePath: 'f.png',
    description:
        'An F4 crotchet note. F is the fourth note above C and known as "fa" in fixed-do solfege.');

final g = Note(
    id: 4,
    name: 'g',
    displayName: 'G4 Crotchet',
    imagePath: 'g.png',
    description:
        'A G4 crotchet note. G is the fifth note of the C major scale and therefore the dominant. It sits a perfect fifth above C and a perfect fourth below. It is referred to as "so" or "sol" in fixed-do solfege.');

final a = Note(
    id: 5,
    name: 'a',
    displayName: 'A4 Crotchet',
    imagePath: 'a.png',
    description:
        'An A4 crotchet note. A is the sixth note of the C major scale and the fixed-do solfege in which it is referred to as "la". In an orchestra, an A is played by the oboe to start tuning.');

final b = Note(
    id: 6,
    name: 'b',
    displayName: 'B4 Crotchet',
    imagePath: 'b.png',
    description:
        'A B4 crotchet note. B is the seventh note of the C major scale and the fixed-do solfege in which it is called "ti". In some European countries it is referred to as H. On a standard piano it is located to the right of the three black keys.');

final hc = Note(
    id: 7,
    name: 'hc',
    displayName: 'C5 Crotchet',
    imagePath: 'c.png',
    description:
        'A C5 crotchet note. It is the first note of the C major scale, the third note of the A minor scale and the fourth note of the Guidonian hand. In solfege, it is referred to as "Do". On a standard piano, it is located immediately to the left of the two black keys.');

final noteList = List<Note>.of([lc, d, e, f, g, a, b, hc]);
