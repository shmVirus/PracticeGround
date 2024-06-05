int myFunc (int a, int b) {
    return a + b;
}
addTwoNumbers () {
    var x = 2;
    var y = 3;
    print(x+y);
}
void greet(String name, [String prefix = '']) {	// optional parameters
  print('Hello, $prefix $name');
}
void anotherGreet({required String name, String prefix = ''}) { // optional named parameters
  print('Hello, $prefix $name');
}
int multiply(int a, int b) => a * b; // arrow function - contains single expression

void main () {
    /// Functions
    greet('Alice');
    greet('Alice', 'Ms.');
    anotherGreet(name : 'Alice');
    anotherGreet(name : 'Alice', prefix : 'Ms. ');
    print(multiply(3, 4));

    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    print(myFunc(10,15));
    
    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    addTwoNumbers();
}
