void main () {
    /// Loops : for-loop
    for (int i = 0; i < 5; i++) {
        print('Iteration $i');
    }

    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    for (int i = 0; i < 5; i++) {
        print(i);
    }
    var list = [1, 3, 5];
    for (var i in list) {
        print(i);
    }
    
    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    for (int i = 0; i < 5; i++) {
        print("Dart"+i.toString());
    }
    var chars = ['A', 'B', 'C'];
    for (var i in chars) {
        print(i);
    }
    var json = [
        {'name' : 'soup', 'price' : 50},
        {'name' : 'milk', 'price' : 100},
        {'name' : 'fish', 'price' : 500},
    ];
    for (var i in json) {
        print(i);
    }
}
