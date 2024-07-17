Here's the Dart code for the school and subject selection process:
import 'dart:math';

void main() {
  print('Welcome to the School Registration System!');
  chooseSchool();
}

void chooseSchool() {
  print('Select a school:');
  print('1. School of Arts');
  print('2. School of Science');

  int choice = int.parse(readLine());

  if (choice == 1 || choice == 2) {
    chooseClass(choice);
  } else {
    print('Error: Invalid school choice.');
    chooseSchool();
  }
}

void chooseClass(int school) {
  print('Select your class:');
  print('1. Form 1');
  print('2. Form 2');
  print('3. Form 3');
  print('4. Form 4');
  print('5. Form 5');
  print('6. Lower Sixth Arts');
  print('7. Lower Sixth Science');
  print('8. Upper Sixth Arts');
  print('9. Upper Sixth Science');

  int choice = int.parse(readLine());

  if (choice >= 1 && choice <= 9) {
    chooseSubjects(school, choice);
  } else {
    print('Error: Invalid class choice.');
    chooseClass(school);
  }
}

void chooseSubjects(int school, int class) {
  List<String> subjects = getSubjects(class);
  int minSubjects = getMinSubjects(class);
  int maxSubjects = getMaxSubjects(class);

  print('Select your subjects (choose minimum $minSubjects, maximum $maxSubjects):');
  for (int i = 0; i < subjects.length; i++) {
    print('${i + 1}. ${subjects[i]}');
  }

  List<int> choices = [];
  int count = 0;

  while (count < minSubjects) {
    int choice = int.parse(readLine());
    if (choices.contains(choice)) {
      print('Error: Subject already chosen.');
    } else if (choice > 0 && choice <= subjects.length) {
      choices.add(choice);
      count++;
    } else {
      print('Error: Invalid subject choice.');
    }
  }

  if (count < maxSubjects) {
    print('Do you want to choose additional subjects (y/n)?');
    String answer = readLine();
    if (answer.toLowerCase() == 'y') {
      chooseAdditionalSubjects(choices, subjects);
    }
  }

  print('Registration successful!');
}

List<String> getSubjects(int class) {
  switch (class) {
    case 1:
    case 2:
      return [
        'French',
        'English',
        'Maths',
        'Religious Studies',
        'Biology',
        'Geography',
        'Computer Science',
        'History',
        'Citizenship',
        'Chemistry',
        'Physics',
        'Literature',
        'Food/Nutrition'
      ];
    case 3:
      return [
        'French',
        'English',
        'Maths',
        'Religious Studies',
        'Biology',
        'Geography',
        'Computer Science',
        'History',
        'Citizenship',
        'Chemistry',
        'Physics',
        'Literature',
        'Food/Nutrition',
        'Economics'
      ];
    case 4:
    case 5:
      return [
        'Maths',
        'English',
        'French',
        'Biology',
        'Geography',
        'Religious Studies',
        'Economics',
        'Computer Science',
        'History',
        'Citizenship',
        'Chemistry',
        'Physics',
        'Human Biology',
        'Add Maths',
        'Logic',
        'Literature',
        'Food/Nutrition',
        'Geology'
      ];
    case 6:
    case 8:
      return [
        'Literature',
        'History',
        'Geography',
        'Economics',
        'ICT',
        'Philosophy',
        'French',
        'Religious Studies',
        'Maths (Statistics)'
      ];
    case 7:
    case 9:
      return [
        'Biology',
        'Chemistry',
        'Physics',
        'Maths',
        'Further Maths',
        'Computer Science

  default:
    return [];
  }
}

int getMinSubjects(int class) {
  if (class <= 3) return 12;
  return 7;
}

int getMaxSubjects(int class) {
  if (class <= 3) return 12;
  return 11;
}

void chooseAdditionalSubjects(List<int> choices, List<String> subjects) {
  int maxChoices = getMaxSubjects(choices.length) - choices.length;
  print('Select additional subjects (choose maximum $maxChoices):');
  for (int i = 0; i < subjects.length; i++) {
    if (!choices.contains(i + 1)) {
      print('${i + 1}. ${subjects[i]}');
    }
  }

  while (maxChoices > 0) {
    int choice = int.parse(readLine());
    if (choices.contains(choice)) {
      print('Error: Subject already chosen.');
    } else if (choice > 0 && choice <= subjects.length && !choices.contains(choice)) {
      choices.add(choice);
      maxChoices--;
    } else {
      print('Error: Invalid subject choice.');
    }
  }
}

// Simulates reading user input (replace with actual input methods)
String readLine() {
  return stdin.readLineSync()!;
}

