abstract class Father {
    var FatherTitle="Islam";

    FatherAsset() {
        print("Total Amount: \$ 50M");
    }
}

class Son extends Father {
    SonAsset() {
        print(FatherTitle);
    }

    FatherAsset() {
        print("Total Amount: \$ 100M");
    }
}

void main () {
    /// OOP : Abstract Class

    var son = new Son();
    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    son.FatherAsset();
    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    // import 'directory/file.dart'
}
