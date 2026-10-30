/// Abstract base contract defining core behavior for all animals.
abstract class Animal {
  /// Returns a string representation of the animal.
  String toString();

  /// Emits the animal's signature sound.
  void makeSound();
}

/// Concrete implementation representing a generic Duck.
/// Implements [Animal] contract using standard OOP practices.
class Duck implements Animal {
  // Private instance variables for encapsulation
  String _name;
  int _age;

  /// Primary constructor initializing private fields directly.
  Duck(this._name, this._age);

  // Read-only getters to access private members outside this file
  String get name => _name;
  int get age => _age;

  /// Overrides Object's toString to provide detailed object properties.
  @override
  String toString() => 'Duck{name: $_name, age: $_age}';

  /// Implements Animal's sound requirement with duck-specific console output.
  @override
  void makeSound() => print('Quack! My name is $_name and I am $_age years old.');

  /// Specific action unique to ducks.
  void fly() => print('I am flying!');
}

/// Specialized subclass representing ducks living in urban areas.
/// Demonstrates inheritance by extending [Duck].
class CityDuck extends Duck {
  String _city;

  /// Constructor initializing parent properties via super call along with city data.
  CityDuck(String name, int age, this._city) : super(name, age);

  /// Getter for the private city field.
  String get city => _city;

  /// Custom string representation including city location.
  @override
  String toString() => 'CityDuck{name: $_name, age: $_age, city: $_city}';

  /// Custom sound implementation including the city name.
  @override
  void makeSound() => print('Quack! My name is $_name, I am $_age years old and I live in $_city.');
}

/// Specialized subclass for ducks living in rural areas.
/// Uses the [Swimmable] mixin to reuse swimming functionality.
class CountryDuck extends Duck with Swimmable {
  String _country;

  /// Constructor passing name and age to parent class while setting country.
  CountryDuck(String name, int age, this._country) : super(name, age);

  /// Getter for the private country field.
  String get country => _country;

  /// Custom string representation including country location.
  @override
  String toString() => 'CountryDuck{name: $_name, age: $_age, country: $_country}';

  /// Custom sound implementation including country location.
  @override
  void makeSound() => print('Quack! My name is $_name, I am $_age years old and I live in $_country.');
}

/// Mixin providing reusable swimming capabilities across unrelated classes.
mixin Swimmable {
  /// Outputs swimming action to the console.
  void swim() => print('I am swimming!');
}

void main(List<String> args) {
  // Polymorphism: Declaring variables as the interface type 'Animal'
  Animal normalDuck = Duck('Daffy', 3);
  Animal cityDuck = CityDuck('Donald', 5, 'New York');
  
  // Declared as CountryDuck to access both overridden and mixin methods
  CountryDuck countryDuck = CountryDuck('Daisy', 4, 'Canada');

  // Triggering polymorphic behavior
  normalDuck.makeSound();
  cityDuck.makeSound();
  countryDuck.makeSound();

  // Executing mixin behavior
  countryDuck.swim();
}