void main () {
    /// Conditions : if-else
    int number = 5;
    if (number > 5) {
        print('Number is greater than 5');
    } else if (number == 5) {
        print('Number is exactly 5');
    } else {
        print('Number is less than 5');
    }
    /// Conditions : ternary
    String result = number > 5 ? 'Number is greater than 5' : 'Number is 5 or less';
    print(result);

    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    var n = 35;
    if (n < 40) {
        print("The number ir smaller than 40");
    }
    var x = 20;
    var y = 30;
    if (x > y) {
        print("x is greater than y");
    } else {
        print("y is greater than x");
    }
    var marks = 74;
    if (marks > 85) {
        print('Excellent');
    } else if (marks > 75) {
        print('Good');
    } else {
        print('Fair');
    }
    n = 3;
    
    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    marks = 80;
    if (marks >= 80) print("A+");
    else if (marks >= 70 && marks < 80) print("A");
    else if (marks >= 60 && marks < 70) print("A-");
    else if (marks >= 40 && marks < 60) print("B");
    else print("Fail");
}
