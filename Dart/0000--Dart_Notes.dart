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
        // Simulating an early exit from the block
        break myLabel;
        // continue can be only used with loop
        // This line will never be executed
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
    // Map: A collection of key-value pairs
    Map<String, String> commands = {
        'ls': 'list directory contents',
        'cd': 'change directory'
    };
    stdout.writeln("Map of Commands: $commands");
    // Queue: An ordered collection of items
    Queue<int> queue = Queue();
    queue.addAll([1, 2, 3, 4, 5]);
    stdout.writeln("Queue of Numbers: $queue");
    // Runes: For Unicode characters
    Runes input = Runes('I \u2764 Linux');
    String unicodeString = String.fromCharCodes(input);
    stdout.writeln("Unicode String: $unicodeString");
    // Symbol: Used to refer to identifiers
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
    stdout.writeln("Addition (Normal function): ${add(2, 3)}");
    // Optional Parameters
    stdout.writeln("Addition with optional parameter: ${optionalParams(2, 3)}");
    // Named Parameters
    stdout.writeln("Addition with named parameters: ${namedParams(x: 2, y: 3)}");
    // Anonymous - function that has no name
    stdout.writeln("Anonymous function to print list items:");
    windowManagers.forEach((item) {
        stdout.writeln(item);
    });
    // Arrow - shorthand syntax for anonymous functions
    var doubled = windowManagers.map((item) => item + ' doubled');
    stdout.writeln("Arrow function to double list items:\n$doubled\n");
    // Exit
    // exit(0); // exits the program

    /// Exception Handling
    print('\x1B[38;5;43mException Handling\x1B[0m');
    divide(10, 2);
    divide(10, 0);
    stdout.writeln();

    /// Asynchronus Programming
    print('\x1B[38;5;43mAsync and Await\x1B[0m');
    // async - used to define an asynchronous function, allows to use await
    // await - used to pause the execution of an async function
    fetchData();
    stdout.writeln();


    /// Threading
    print('\x1B[38;5;43mThreading\x1B[0m');
    stdout.writeln('Starting long running task...');
    Future<void> longRunningTask = Future.delayed(Duration(seconds: 3), () {
        stdout.writeln('Task complete!');
    });
    longRunningTask.then((_) => stdout.writeln('Done waiting!'));
    stdout.writeln('This line prints first');
    stdout.writeln();
}

// Enum
enum Status { approved, rejected, pending }

// Normal Function
int add(int x, int y) {
    return x + y;
}

// Optional Parameters
int optionalParams(int x, [int? y]) {
    return x + (y ?? 0);
}

// Named Parameters
int namedParams({required int x, required int y}) {
    return x + y;
}

// Exception Handling
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

// Async and Await
Future<void> fetchData() async {
    print('Fetching data...');
    await Future.delayed(Duration(seconds: 2));
    print('Data fetched');
}
