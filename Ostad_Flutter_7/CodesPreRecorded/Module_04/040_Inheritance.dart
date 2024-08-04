class Father {
    var FatherTitle="Islam";

    FatherAsset() {
        print("Total Amount: \$ 50M");
    }
}

class Son extends Father {
    SonAsset() {
        print(FatherTitle);
    }
}

void main () {
    /// OOP : Inheritance

    var son = new Son();
    print('\x1B[38;5;43mfrom Slide\x1B[0m');
    son.SonAsset();
    print('\x1B[38;5;159mfrom Recording\x1B[0m');
    son.FatherAsset();
}
