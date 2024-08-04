import 'dart:io';

void main () {
    /// List Properties

    List<int> numbers = [1, 2, 3, 4, 5];
    print(numbers);
    print('Length: ${numbers.length}'); // Output: Length: 5
    print('Is Empty: ${numbers.isEmpty}'); // Output: Is Empty: false
    print('Is Not Empty: ${numbers.isNotEmpty}'); // Output: Is Not Empty: true
    print('First Element: ${numbers.first}'); // Output: First Element: 1
    print('Last Element: ${numbers.last}'); // Output: Last Element: 5
    print('Reversed List: ${numbers.reversed}'); // Output: Reversed List: (5, 4, 3, 2, 1)
    List<int> singleElementList = [10];
    print('Single Element: ${singleElementList.single}'); // Output: Single Element: 10
    stdout.write('Iterating through the list: ');
    Iterator<int> iterator = numbers.iterator;
    while (iterator.moveNext()) {
        stdout.write('${iterator.current} ');
    }
    stdout.write("\n");

    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    var myList;
    // add
    myList = [1, 3, 5, 7, 9];
    print(myList);
    myList.add(11);
    print(myList);
    // addAll
    myList = [1, 3, 5, 7, 9];
    print(myList);
    myList.addAll([11, 13, 15]);
    print(myList);
    // insert
    myList = [1, 3, 5, 7, 9];
    print(myList);
    myList.insert(2, 10);
    print(myList);
    // insertAll
    myList = [1, 3, 5, 7, 9];
    print(myList);
    myList.insertAll(2, [10, 12, 14]);
    print(myList);
    // update
    myList = [1, 3, 5, 7, 9];
    print(myList);
    myList[2] = 11;
    print(myList);
    // remove
    myList = [1, 3, 5, 7, 9];
    print(myList);
    myList.remove(7);
    print(myList);
    // removeLast
    myList = [1, 3, 5, 7, 9];
    print(myList);
    myList.removeLast();
    print(myList);
    // removeAt
    myList = [1, 3, 5, 7, 9];
    myList.removeAt(2);
    print(myList);

    // print('\x1B[38;5;159mfrom Recording\x1B[0m');
    // similar examples
}
