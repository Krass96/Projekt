class Button {
  // Attribute
  final String text;
  final String color;
  final bool onPressed;

  // Konstruktore
  Button(this.text, this.color, this.onPressed);

  // Methode
  void Pressed() {
    if (onPressed) {
      print('$text button is pressed');
    } else {
      print('$text button is not pressed');
    }
  }

  void showColor() {
    print('Button Color: $color');
  }

  void showText() {
    print('Button Text: $text');
  }

  void showOnPressed() {
    print('On Pressed: $onPressed');
  }

  void showButton() {
    print('Button: $text, $color, $onPressed');
  }
}
