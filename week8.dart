import 'dart:io';

int? inputPin;
int attempts = 0;
int correctPin = 1234;

int? getPin() {
  stdout.write('Enter PIN: ');
  String? stringInput = stdin.readLineSync();
  try{
    if (stringInput != null && int.tryParse(stringInput) == null) {
      throw FormatException('Input is not a valid integer.');
    }
  }
  catch (e) {
    print('Error: $e');
  }
  return stringInput != null ? int.tryParse(stringInput) : null;
}

bool isPinCorrect(int pin) {
  attempts++;
  return pin == correctPin;
}

void main(){
  while (attempts < 3){
    inputPin = getPin();
    if (inputPin == null) {
      print('Invalid input. Please enter a numeric PIN.');
      continue;
    }

    if (isPinCorrect(inputPin!)) {
      print('Access granted.');
      break;
    } else {
      print('Incorrect PIN. Attempts left: ${3 - attempts}');
    }
  }
}
// OUTPUT:
// 
// Enter PIN: 0303
// Incorrect PIN. Attempts left: 2
// Enter PIN: 0000
// Incorrect PIN. Attempts left: 1
// Enter PIN: dsdsdf
// Error: FormatException: Input is not a valid integer.
// Invalid input. Please enter a numeric PIN.
// Enter PIN: 1234
// Access granted.