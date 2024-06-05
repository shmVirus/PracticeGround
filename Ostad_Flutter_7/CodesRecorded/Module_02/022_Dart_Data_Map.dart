void main () {
    /// Maps
    Map<String, int> phoneBook = {
        'Rafat': 987654321,
        'Rabbil': 123456789,
    }; // collection of key-value pairs

    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    var student = {'name': 'Tux', 'age': 25, 'branch': 'CS'};
    student['course'] = 'B.Sc';
    print(student);
    var student2 = new Map();
    student2['name'] = 'Tom';
    student2['age'] = 23;
    student2['course'] = 'B.Sc';
    student2['branch'] = 'CS';
    print(student2);
    Map student3 = {'name': 'Tux', 'age': 25};
    print(student3);
    student3.addAll({'dept':'CS','mail':'hello@tux.io'});
    print(student3);
    student3.remove('age');
    print(student3);
    student3.clear();
    print(student3);
    
    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    var person = {
        'name': 'Rabbil',
        'age': 33,
        'city': 'Dhaka',
    };
    person['country'] = 'Bangladesh';
    print(person);
    print(person.keys);
    print(person.values);
    print(person.length);
    print(person.isEmpty);
    print(person.isNotEmpty);
    person.remove('age');
    print(person);
}
