class Person {
    String name;
    int age;

    // Constructor
    Person(this.name, this.age);

    // Method
    void greet() {
        print('Hello, my name is $name and I am $age years old.');
    }
}

class MyClass {
    var myName = "Rabbil Hasan"; // Property
    int addTwoNumber (var a, var b) { // Method
        return a + b;
    }
    static int add (int a, int b) {
        return a + b;
    }
    MyClass () {
        print("Constructor: ${this.myName}");
    }
}

void main () {
    /// OOP : Class, Constructor, Properties, Methods
    Person person = Person('Alice', 30);
    person.greet();

    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    var obj = new MyClass();
    print(obj.myName);
    print(obj.addTwoNumber(5,10));
    print(MyClass.add(15,10));

    print('\x1B[38;5;159mfrom Recording\x1B[0m');
}
