void main () {
    /// Sets
    Set<int> numbers = {1, 2, 3}; // collection of unique items

    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    var names = <String>{"James", "Ricky", "Devansh", "Adnan"};
    names.add("Jonathan");
    print(names);
    names = <String>{"James", "Ricky", "Devansh", "Adnan"};
    names.addAll({"A", "B"});
    print(names);
    names = <String>{"James", "Ricky", "Devansh", "Adnan"};
    var x = names.elementAt(3);
    print(x);
    names.clear();
    print(names);
    
    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    var myCitySet = <String> {'Dhaka', 'Barisal', 'CoxBazar', 'Dhaka'};
    myCitySet.add('Khulna');
    myCitySet.addAll({'Rangpur', 'Rajshahi'});
    print(myCitySet);
    print(myCitySet.elementAt(2));
    print(myCitySet.first);
    print(myCitySet.last);
    print(myCitySet.length);
    print(myCitySet.isEmpty);
    print(myCitySet.isNotEmpty);
    //print(myCitySet.single); // works when a set has only one element
    myCitySet.clear();
    print(myCitySet);
}
