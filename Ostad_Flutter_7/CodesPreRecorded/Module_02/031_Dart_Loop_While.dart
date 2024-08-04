void main () {
    /// Loops : while-loop
    int i = 0;
    while (i < 5) {
        print('Iteration While $i');
        i++;
    }
    /// Loops : do-while-loop
    int j = 0;
    do {
        print('Iteration Do-While $j');
        j++;
    } while (j < 5);

    //print('\x1B[38;5;43mfrom Slide\x1B[0m');
    
    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    i = 0;
    while (i < 5) {
        print("Dart While ${i}");
        i++;
    }
    i = 0;
    do {
        print("Dart Do-While ${i}");
        i++;
    } while (i < 5);
}
