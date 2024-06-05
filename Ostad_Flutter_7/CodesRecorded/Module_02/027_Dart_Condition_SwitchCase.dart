void main () {
    /// Conditions : switch-case
    String grade = 'A';
    switch (grade) {
        case 'A':
            print('Excellent');
            break;
        case 'B':
            print('Good');
            break;
        case 'C':
            print('Fair');
            break;
        default:
            print('Invalid grade');
    }

    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    var n = 3;
    switch (n) {
        case 1:
            print('Value is 1');
            break;
        case 2:
            print('Value is 2');
            break;
        case 3:
            print('Value is 3');
            break;
    }

    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    var marks = 85;
    switch (marks~/10) {
        case 8:
            print('A+');
            break;
        case 7:
            print('A');
            break;
        case 6:
            print('A-');
            break;
        default:
            print('Fail');
    }
}
