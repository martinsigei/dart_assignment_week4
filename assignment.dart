import 'dart:io';


void main() {
  // Step 1: Perform string manipulation on user input
  print("Enter a string: ");
  String userInput = stdin.readLineSync() ?? "";

  // String Manipulation Functions
  String concatenatedString = concatenateStrings(userInput, " - Dart String Example");
  String interpolatedString = interpolateString(userInput);
  String substring = extractSubstring(userInput, 0, 5);
  String uppercase = userInput.toUpperCase();
  String lowercase = userInput.toLowerCase();
  String reversedString = reverseString(userInput);
  int lengthOfString = userInput.length;

  print("Concatenated String: $concatenatedString");
  print("Interpolated String: $interpolatedString");
  print("Substring (0-5): $substring");
  print("Uppercase: $uppercase");
  print("Lowercase: $lowercase");
  print("Reversed String: $reversedString");
  print("Length of String: $lengthOfString");

  // Step 2: Store results in a collection
  List<String> operationsList = [];
  operationsList.add("Original String: $userInput");
  operationsList.add("Concatenated String: $concatenatedString");
  operationsList.add("Interpolated String: $interpolatedString");
  operationsList.add("Substring: $substring");
  operationsList.add("Uppercase: $uppercase");
  operationsList.add("Lowercase: $lowercase");
  operationsList.add("Reversed String: $reversedString");
  operationsList.add("Length of String: $lengthOfString");

  // Step 3: File Handling - Write results to a file and handle errors
  try {
    File file = File('output.txt');
    file.writeAsStringSync("String Manipulation Operations:\n");
    for (var operation in operationsList) {
      file.writeAsStringSync("$operation\n", mode: FileMode.append);
    }
    print("Data written to output.txt successfully.");
  } catch (e) {
    print("An error occurred while writing to the file: $e");
  }

   // Step 4: Use Date and Time Utilities
  DateTime now = DateTime.now();
  String formattedDate = formatDate(now);
  
  // Use the File object you created earlier
  File file = File('output.txt');
  file.writeAsStringSync("Entry logged on: $formattedDate\n", mode: FileMode.append);

  // Example of adding/subtracting days and calculating difference
  DateTime futureDate = now.add(Duration(days: 10));
  DateTime pastDate = now.subtract(Duration(days: 5));
  print("Future date (10 days from now): $futureDate");
  print("Past date (5 days ago): $pastDate");

  Duration difference = futureDate.difference(now);
  print("Difference between future date and now: ${difference.inDays} days");
}

/////////////////////////////////////
// String Manipulation Functions
/////////////////////////////////////

// String Concatenation
String concatenateStrings(String str1, String str2) {
  return str1 + str2;
}

// String Interpolation
String interpolateString(String input) {
  return "The provided string is: $input";
}

// Extracting Substring
String extractSubstring(String input, int start, int end) {
  return input.substring(start, end);
}

// Reversing a String
String reverseString(String input) {
  return input.split('').reversed.join('');
}

/////////////////////////////////////
// Date and Time Utilities
/////////////////////////////////////

// Formatting Date
String formatDate(DateTime date) {
  return "${date.day}-${date.month}-${date.year} ${date.hour}:${date.minute}:${date.second}";
}

/////////////////////////////////////
// File Handling Functions
/////////////////////////////////////

// Read from a file (optional function if you want to add reading from a file)
String readFromFile(String fileName) {
  try {
    File file = File(fileName);
    String content = file.readAsStringSync();
    return content;
  } catch (e) {
    print("An error occurred while reading the file: $e");
    return "";
  }
}
