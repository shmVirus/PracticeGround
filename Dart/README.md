```dart
//  Author: Sabbir <sabbir@disroot.org>
//  Title: Dart Notes - Basics and Concepts


/// Importing
//  Importing core libraries
import 'dart:async';
import 'dart:collection';
import 'dart:io';
//  Importing libraries from external packages
// import 'package:http/http.dart' as http;
//  Importing custom files
// import 'path/to/my_other_file.dart';

/// In Dart, Everything is an Object
/// Every declaration of an object is an Instance of Null and Null is also an object

/// Comments
//  Single-line comment
/*
    Multi-line comment
*/
/// Single-line documentation comment
/**
 *  Multi-line documentation comment
 *  Dartdoc treats these comments as MarkDown
 */

 /// Naming Conventions
 // camelCase - for variables and functions/methods
 // PascalCase - for classes and enums
 // snake_case - for filenames
 // SCREAMING_SNAKE_CASE - for constants
 // kebab-case - unknown

/// Main Function: entry point of the Dart application
void main() {
    /// Writing Statements
    // print - writes to stdout implicitly, adds newline, nothing required
    // stdout.writeln - writes to stdout explicitly, adds newline, requires dart:io
    // stdout.write - writes to stdout explicitly, skips newline, requires dart:io
    // stderr.write - writes errors or warnings to stderr, skips newline, requires dart:io
    // stderr.writeln - writes errors or warnings to stderr, adds newline, requires dart:io

    /// Variable Declarations
    print('\x1B[38;5;43mVariable Declarations\x1B[0m');
    // dynamic - can hold any data type
    dynamic variable = 42;
    stdout.writeln('Dynamic Variable (initially an integer): $variable, Type: ${variable.runtimeType}');
    variable = 'Hello Linux'; // no error, can hold anything
    stdout.writeln('Dynamic Variable (now a string): $variable, Type: ${variable.runtimeType}');
    // var - sets data type based on the assigned value
    var inferredTypeVariable = 'Inferred String';
    stdout.writeln('Var Inferred type Variable: $inferredTypeVariable, Type: ${inferredTypeVariable.runtimeType}');
    // inferredTypeVariable = 23; // compile-time error, as it is inferred as String
    // const - compile-time constants
    const PI_VALUE = 3.14159;
    stdout.writeln('Const PI: $PI_VALUE, Type: ${PI_VALUE.runtimeType}');
    // final - run-time constants
    final currentTime = DateTime.now();
    stdout.writeln('Final currentTime: $currentTime, Type: ${currentTime.runtimeType}');
    // late - for late initialization, non-nullable
    late String lateVariable;
    lateVariable = 'Late Variable';
    stdout.writeln('Late Initialized Variable: $lateVariable');
    stdout.writeln();

    /// Primitive Data Types
    print('\x1B[38;5;43mPrimitive Data Types\x1B[0m');
    int uptime = 1024; // Integer
    double kernelVersion = 5.11; // Double
    bool isOpenSource = true; // Boolean
    String distro = 'Arch'; // String
    num memoryUsage = 150.5; // Num: can hold both int and double

    /// Strings
    // single quoute - 'String'
    // double quoute - "String"
    // triple single quoute - '''String''', can have newlines
    // triple double quoute - """String""", can have newlines
    // String Interpolation - 'Hello, $name', may have ambiguity
    // String Interpolation - 'Hello, ${name}', removes ambiguity

    /// Null Safety
    int nonNullableNumber = 10; // non-nullable integer
    // nonNullableNumber = null; // compile-time error
    int? nullableNumber = null; // nullable integer
    // int anotherNumber = nullableNumber!; // runtime error if nullableNumber is null
    nullableNumber = 20;
    int anotherNumber = nullableNumber!; // null-assertion/soft-wrap, assures not null
    int number = nullableNumber ?? 5; // null-aware/soft-unwrap, replaces with 5 when null

    /// Reading Statements
    // readLineSync - reads the entire input line as a string, requires dart:io
    // uptime = int.parse(stdin.readLineSync()!); // reading integer
    // kernelVersion = double.parse(stdin.readLineSync()!); // reading double
    // isOpenSource = stdin.readLineSync()!.toLowerCase() == 'true';
    // distro = stdin.readLineSync()!; // reading string
    // memoryUsage = num.parse(stdin.readLineSync()!); // reading num
    stdout.writeln("Uptime: $uptime hours, Kernel Version: $kernelVersion, Open-Source: $isOpenSource, Distro: $distro, Memory Usage: $memoryUsage");
    stdout.writeln();

    /// Conditions
    print('\x1B[38;5;43mConditions\x1B[0m');
    // if-else
    stdout.write("Using If-Else: $number is a ");
    if (number > 0) {
        stdout.writeln('Positive Number');
    } else {
        stdout.writeln('Non-Positive Number');
    }
    // ternary
    String sign = number > 0 ? 'Positive' : 'Non-Positive';
    stdout.writeln('Using Ternary: $number is $sign');
    // switch-case
    stdout.write('Using Switch-Case: ');
    switch (number) {
        case 0:
            print('$number is zero');
            break;
        case 1:
            print('$number is one');
            break;
        default:
            print('$number is neither zero nor one');
    }
    stdout.writeln();

    /// Enums: custom data type with a limited set of possible values
    print('\x1B[38;5;43mEnums\x1B[0m');
    stdout.writeln("Enums: ${Status.values}");
    var status = Status.approved;
    stdout.writeln('The Status is: $status\n');

    /// Labels - marks a location of code, can jump using break and continue
    print('\x1B[38;5;43mLabels\x1B[0m');
    myLabel: {
        stdout.writeln('This is inside the Labeled Block\n');
        // simulating an early exit from the block
        break myLabel; // continue can be only used with loop
        // this line will never be executed
        stdout.writeln('This line Will not be Printed\n');
    }

    /// Regular Expressions
    print('\x1B[38;5;43mRegular Expressions\x1B[0m');
    var pattern = RegExp(r'\d+');
    var str = 'There are 123 Apples';
    var match = pattern.hasMatch(str);
    var matches = pattern.allMatches(str);
    stdout.writeln('Contains Numbers: $match');
    for (var m in matches) {
        stdout.writeln('Match Found: ${m.group(0)}');
    }
    var newStr = str.replaceAll(pattern, 'many');
    stdout.writeln('Replaced: $newStr\n');

    /// Iterable Data Types
    print('\x1B[38;5;43mIterable Data Types\x1B[0m');
    // List: an ordered collection of items
    List<int> pids = [1, 101, 202, 303, 404];
    stdout.writeln("List of PIDs: $pids");
    // Set: an unordered collection of unique items
    Set<String> windowManagers = {'i3', 'bspwm', 'awesome'};
    stdout.writeln("Set of Window Managers: $windowManagers");
    // Map: a collection of key-value pairs
    Map<String, String> commands = {
        'ls': 'list directory contents',
        'cd': 'change directory'
    };
    stdout.writeln("Map of Commands: $commands");
    // Queue: an ordered collection of items
    Queue<int> queue = Queue();
    queue.addAll([1, 2, 3, 4, 5]);
    stdout.writeln("Queue of Numbers: $queue");
    // Runes: for Unicode characters
    Runes input = Runes('I \u2764 Linux');
    String unicodeString = String.fromCharCodes(input);
    stdout.writeln("Unicode String: $unicodeString");
    // Symbol: used to refer to identifiers
    Symbol symbol = #linuxSymbol;
    stdout.writeln("Symbol: $symbol\n");

    /// Loops
    print('\x1B[38;5;43mLoops\x1B[0m');
    // For Loop
    stdout.writeln('For Loop:');
    List<String> wmList = windowManagers.toList(); // Set does not support indexing with []
    for (int i = 0; i < wmList.length; i++) {
        stdout.writeln(wmList[i]);
    }
    // For-In Loop
    stdout.writeln('For-In Loop');
    for (var wm in windowManagers) {
        stdout.writeln(wm);
    }
    // For Each Loop
    stdout.writeln('For-Each Loop:');
    windowManagers.forEach((wm) {
        stdout.writeln(wm);
    });
    // While Loop
    stdout.writeln('While Loop:');
    int index = 0;
    while (index < wmList.length) {
        stdout.writeln(wmList[index]);
        index++;
    }
    // Do-While Loop
    stdout.writeln('Do-While Loop:');
    int doWhileIndex = 0;
    do {
        stdout.writeln(wmList[doWhileIndex]);
        doWhileIndex++;
    } while (doWhileIndex < wmList.length);

    /// Common Collection Properties/Methods
    print('\x1B[38;5;43mCommon Collection Properties/Methods\x1B[0m');
    // List common methods/properties
    print('\x1B[38;5;159mOriginal list: $pids\x1B[0m');
    pids.add(505); // Adding an element
    pids.remove(202); // Removing an element
    pids.sort(); // Sorting the list
    stdout.writeln("Modified list after adding, removing and sorting: $pids");
    stdout.writeln("First element: ${pids.first}");
    stdout.writeln("Last element: ${pids.last}");
    stdout.writeln("Length of list: ${pids.length}");
    stdout.writeln("Reversed list: ${pids.reversed.toList()}");

    // Set common methods/properties
    print('\x1B[38;5;159mOriginal set: $windowManagers\x1B[0m');
    windowManagers.add('xmonad'); // Adding an element
    windowManagers.remove('bspwm'); // Removing an element
    stdout.writeln("Modified set: $windowManagers");
    stdout.writeln("Contains 'i3': ${windowManagers.contains('i3')}");
    stdout.writeln("Length of set: ${windowManagers.length}");

    // Map common methods/properties
    print('\x1B[38;5;159mOriginal map: $commands\x1B[0m');
    commands['mv'] = 'move or rename files'; // Adding a key-value pair
    commands.remove('cd'); // Removing a key-value pair
    stdout.writeln("Modified map: $commands");
    stdout.writeln("Keys: ${commands.keys}");
    stdout.writeln("Values: ${commands.values}");
    stdout.writeln("Contains key 'ls': ${commands.containsKey('ls')}");
    stdout.writeln("Contains value 'list directory contents': ${commands.containsValue('list directory contents')}");

    // Queue common methods/properties
    print('\x1B[38;5;159mOriginal queue: $queue\x1B[0m');
    queue.add(6); // Adding an element to the end
    queue.addFirst(0); // Adding an element to the front
    queue.removeFirst(); // Removing the first element
    queue.removeLast(); // Removing the last element
    stdout.writeln("Modified queue: $queue");
    stdout.writeln("First element: ${queue.first}");
    stdout.writeln("Last element: ${queue.last}");
    stdout.writeln("Length of queue: ${queue.length}\n");

    /// Functions
    print('\x1B[38;5;43mFunction Types\x1B[0m');
    // Normal Function
    stdout.writeln("Addition with Normal Function: ${add(2, 3)}");
    // Nested Function
    stdout.writeln("Addition with Nested Function: ${outerNested(15)}");
    // Optional Parameters
    stdout.writeln("Addition with Optional Parameter: ${optionalParams(2, 3)}");
    // Named Parameters
    stdout.writeln("Addition with Named Parameters: ${namedParams(x: 2, y: 3)}");
    // Anonymous - function without a name, often used as an argument in higher-order functions
    stdout.writeln("Anonymous Function to Print Items:");
    windowManagers.forEach((item) {
        stdout.writeln(item);
    });
    // Arrow - concise function definition using `=>` for single expressions
    var doubled = windowManagers.map((item) => item + ' doubled');
    stdout.writeln("Arrow Function to Double list Items:\n$doubled\n");
    // Exit
    // exit(0); // exits the program

    /// Exception Handling
    print('\x1B[38;5;43mException Handling\x1B[0m');
    divide(10, 2);
    divide(10, 0);
    stdout.writeln();

    /// OOP Concepts
    stdout.writeln('\x1B[38;5;43mOOP Examples\x1B[0m');
    // Object: Instance of a class
    var penguin = LinuxUser(username: 'Tux', uptime: 2048);
    penguin.greet();
    stdout.writeln("Username from Getter: ${penguin.username}"); // accessing private variable using getter
    // Accessing static propterties/methods
    stdout.writeln('Static method Result: ${LinuxUser.calculateUptime(1995)}'); // calls a static method of LinuxUser
    // Using a Mixin and Polymorphism
    List<LinuxUser> users = [
        LinuxUser(username: 'Tux', uptime: 2048),
        AdvancedLinuxUser(username: 'AdvancedTux', uptime: 4096)
    ];
    stdout.writeln("Polymorphism Example:");
    for (var user in users) {
        user.greet(); // polymorphism: behaves differently based on the object
    }
    // Abstract class
    var myComputer = LinuxComputer();
    myComputer.turnOn(); // calls the implemented abstract method
    myComputer.turnOff(); // calls the implemented abstract method
    // Interface
    var diskCleanup = AdvancedDiskCleanup();
    diskCleanup.cleanDisk(); // calls the method from the interface implementation
    // Callable class
    var callableInstance = CallableClass();
    stdout.writeln("Callable class Result: ${callableInstance(3, 4)}"); // Demonstrates callable class
    // Generic class
    var genericString = GenericClass<String>('Hello, Linux!');
    genericString.showType(); // demonstrates generic class with String type
    var genericInt = GenericClass<int>(42);
    genericInt.showType(); // demonstrates generic class with int type
    // Singleton class
    var singleton1 = LinuxSingleton.getInstance();
    var singleton2 = LinuxSingleton();
    stdout.writeln('Singleton instances are the same: ${singleton1 == singleton2}');
    // Builder pattern
    var myLaptop = LinuxLaptopBuilder()
        .setBrand('ThinkPad X1 Yoga')
        .setRam(16)
        .setStorage(512)
        .build();
    stdout.writeln("Built Laptop: ${myLaptop.details()}"); // uses the builder pattern to create an object
    stdout.writeln();

    /// Asynchronus Programming and Threading
    // Asynchronus Programming
    print('\x1B[38;5;43mAsynchronus Programming and Threading\x1B[0m');
    // async - used to define an asynchronous function, allows to use await
    // await - used to pause the execution of an async function
    fetchData();
    /// Threading
    stdout.writeln('Thread: Starting long running task...');
    Future<void> longRunningTask = Future.delayed(Duration(seconds: 3), () {
        stdout.writeln('Thread: Task complete!');
    });
    longRunningTask.then((_) => stdout.writeln('Thread: Done waiting!'));
    stdout.writeln('Thread: This line prints first');
}

// Enums custom data type with a limited set of possible values
enum Status { approved, rejected, pending }

// Normal Function: collections of statements, can be nested
int add(int x, int y) {
    return x + y;
}
// Nested Function: functions defined within other functions
int outerNested (int x) {
    int innerNested (int x) {
        return x + 10;
    }
    return innerNested(x);
}
// Optional Parameters: parameters that may or may not be provided
int optionalParams(int x, [int? y]) {
    return x + (y ?? 0);
}
// Named Parameters: parameters identified by name; by default optional, requires required for mandatory paramters
int namedParams({required int x, required int y}) {
    return x + y;
}

// Exception Handling: process of catching and managing runtime errors to prevent program crashes
void divide(int a, int b) {
    try {
        if (b == 0) {
            throw Exception('Cannot divide by Zero');
        } else {
            print('Result: ${a / b}');
        }
    } catch (e) {
        print('Error: $e');
    }
}

// Class: blueprint for creating objects with properties and methods, encapsulating data and behavior
class LinuxUser {
    // Instance Properties
    String _username; // Private variable: accessible only within this class
    int uptime; // Public variable: accessible from outside of class
    // Instance Methods
    void greet() {
        stdout.writeln('Hello, my name is $_username and my system uptime is $uptime hours');
    }

    // Constructor: initializes an instance of the class
    // Factory Constructors: creates instances with custom logic, may return existing instances
    // Const Constructors: creates compile-time constant, immutable instances
    // Private Constructors: prevents instantiation from outside the library using an underscore (_)
    LinuxUser({required String username, required this.uptime})
        // Initializer List: used to initialize instance variables before running constructor
        : _username = username {
        // constructor body
        stdout.writeln('Creating a LinuxUser instance with username: $_username and uptime: $uptime');
    }

    // Encapsulation: hides internal state and requires interaction through methods
    // Getter: provides read access to private properties
    String get username => _username;
    // Setter: provides write access to private properties
    set username(String username) {
        _username = username;
    }

    // Static Property: belongs to the class, not instances
    static String species = 'Penguin'; // can be accessed with class
    // Static Method: belongs to the class, not instances
    static int calculateUptime(int birthYear) {
        return DateTime.now().year - birthYear;
    }
}

// Mixin: reusable code that can be mixed into multiple classes
mixin AdvancedFeatures {
    void showAdvancedInfo() {
        stdout.writeln('Using Advanced Linux features');
    }
}

/// Association: relationship between two classes
// Aggregation: child can exist independently of the parent
// Composition: child cannot exist independently of the parent
// Dependency: one class depends on another for a specific purpose
// Delegation: an object handles a request by passing it to a second object

/// Association Keywords
// extends: inherits properties and methods from a superclass
// with: mixes properties and methods from a mixin to a class
// implements: enforces the implementation of an interface's methods and properties

// Example of Mixins and Polymorphism
class AdvancedLinuxUser extends LinuxUser with AdvancedFeatures {
    AdvancedLinuxUser({required String username, required int uptime})
        // Inheritance: subclass inherits properties and methods from superclass
        : super(username: username, uptime: uptime);

    // Polymorphism: same method call on different objects, each responds uniquely
    // Method Overloading: multiple methods with the same name but different parameters in one class (Not Supported in Dart)
    // Operator Overloading: custom implementation for standard operators
    @override
    void greet() {
        // Method Overriding: subclass implements a method defined in its superclass
        stdout.writeln('Hello, my name is $username, an advanced user, and my system uptime is $uptime hours');
    }
}

// Abstract Class: cannot be instantiated; must be subclassed
abstract class LinuxDevice {
    // Abstraction: hides complex implementation, shows only essential features
    void turnOn(); // abstract method
    void turnOff(); // abstract method
}
// Implementation of an Abstract class
class LinuxComputer extends LinuxDevice {
    @override
    void turnOn() {
        stdout.writeln('Linux computer is now ON');
    }

    @override
    void turnOff() {
        stdout.writeln('Linux computer is now OFF');
    }
}

// Interface: contract specifying methods and properties a class must implement
class DiskCleanup {
    void cleanDisk() {
        stdout.writeln('Cleaning up disk space...');
    }
}
// Implementation of an Interface
class AdvancedDiskCleanup implements DiskCleanup {
    @override
    void cleanDisk() {
        stdout.writeln('Advanced disk cleanup in progress...');
    }
}

// Callable Class: allows an instance to be called as a function
class CallableClass {
    int call(int a, int b) => a + b;
}

// Generic Class: allows classes to operate on different data types
class GenericClass<T> {
    T value;
    GenericClass(this.value);
    void showType() {
        stdout.writeln('The Type of Value is ${value.runtimeType}');
    }
}

// Singleton: ensures a class has only one instance and provides a global access point
class LinuxSingleton {
    static final LinuxSingleton _instance = LinuxSingleton._internal();
    // factory - defines a constructor that can return an instance
    factory LinuxSingleton() {
        return _instance;
    }
    LinuxSingleton._internal();
    static LinuxSingleton getInstance() {
        return _instance;
    }
}

// Product Class: represents complex object that is being built
class LinuxLaptop {
    final String brand;
    final int ram;
    final int storage;
    LinuxLaptop(this.brand, this.ram, this.storage);
    String details() {
        return 'Brand: $brand, RAM: ${ram}GB, Storage: ${storage}GB';
    }
}
// Builder Class: class used to construct instances of product class
class LinuxLaptopBuilder {
    String? _brand;
    int? _ram;
    int? _storage;
    LinuxLaptopBuilder setBrand(String brand) {
        _brand = brand;
        return this;
    }
    LinuxLaptopBuilder setRam(int ram) {
        _ram = ram;
        return this;
    }
    LinuxLaptopBuilder setStorage(int storage) {
        _storage = storage;
        return this;
    }
    LinuxLaptop build() {
        return LinuxLaptop(_brand ?? 'Unknown', _ram ?? 0, _storage ?? 0);
    }
}

// Async and Await
Future<void> fetchData() async {
    print('Async: Fetching data...');
    await Future.delayed(Duration(seconds: 2));
    print('Async: Data fetched');
}
```
