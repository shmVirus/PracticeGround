void main () {
    /// Constants
    const double gravity = 9.8; // compile-time constants
    print('Gravity: $gravity');
    final DateTime startTime = DateTime.now(); // runtime constants
    print('Start Time: $startTime');
  
    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    const a = 10;
    print(a);
    final b = 15;
    print(b);

    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    const thisYear = 2025;
    print(thisYear);
    final DateTime today = DateTime.now();
    print(today);
}
