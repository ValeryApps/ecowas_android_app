import 'package:flutter/material.dart';

class Subject {
  final int id;
  final String title;
  final List<Question> questions;

  Subject({
    this.id,
    this.title,
    this.questions,
  });
}

class Score {
  double points = 0;
}

class Question {
  final int id;
  final String question;
  Answer answerData;
  final int subjectId;

  Question({
    this.id,
    this.answerData,
    this.question,
    this.subjectId,
  });
}

class Answer {
  final int id;
  final List<Option> options;
  final int questionId;

  Answer({
    this.id,
    this.options,
    this.questionId,
  });
}

class Option {
  final String id;
  final String answer;
  final bool isCorrect;
  final Color color;

  Option({
    this.id,
    this.answer,
    this.isCorrect,
    this.color,
  });
}

List<Subject> subjects = [
  Subject(
    id: 1,
    title: "English",
    questions: questions.where((element) => element.subjectId == 1).toList(),
  ),
  Subject(
    id: 2,
    title: "Maths",
    questions: questions.where((element) => element.subjectId == 2).toList(),
  ),
  Subject(
    id: 3,
    title: "Physics",
    questions: questions.where((element) => element.subjectId == 3).toList(),
  ),
  Subject(
    id: 4,
    title: "Social Studies",
    questions: questions.where((element) => element.subjectId == 4).toList(),
  ),
  Subject(
    id: 5,
    title: "Science",
    questions: questions.where((element) => element.subjectId == 5).toList(),
  ),
  Subject(
    id: 6,
    title: "History",
    questions: questions.where((element) => element.subjectId == 6).toList(),
  ),
];

List<Question> questions = [
  Question(
    id: 1,
    question: "What is the name of your father",
    answerData: Answer(
      id: 1,
      questionId: 1,
      options: [
        Option(
          id: "A",
          answer: "His name is John",
          isCorrect: false,
          color: Colors.red,
        ),
        Option(
          id: "B",
          answer: "His name is Peter",
          isCorrect: true,
          color: Colors.green,
        ),
        Option(
          id: "C",
          answer: "His name is Therry",
          isCorrect: false,
          color: Colors.red,
        ),
      ],
    ),
    subjectId: 1,
  ),
  Question(
    id: 2,
    question: "What is the largest african country ?",
    answerData: Answer(
      id: 2,
      questionId: 2,
      options: [
        Option(
          id: "A",
          answer: "The largest african country is Nigeria ",
          isCorrect: false,
          color: Colors.red,
        ),
        Option(
          id: "B",
          answer: "The largest african country is South Africa",
          isCorrect: false,
          color: Colors.red,
        ),
        Option(
          id: "C",
          answer: "The largest african country is Algeria",
          isCorrect: true,
          color: Colors.green,
        ),
      ],
    ),
    subjectId: 1,
  ),
  Question(
    id: 3,
    question: "What is the fastest animal",
    answerData: Answer(
      id: 3,
      questionId: 3,
      options: [
        Option(
          id: "A",
          answer: "The fastest animal is the jaguar",
          isCorrect: true,
          color: Colors.green,
        ),
        Option(
          id: "B",
          answer: "The fastest animal is the python",
          isCorrect: false,
          color: Colors.red,
        ),
        Option(
          id: "C",
          answer: "The fastest animal is the lion",
          isCorrect: false,
          color: Colors.red,
        ),
      ],
    ),
    subjectId: 1,
  ),
  Question(
    id: 4,
    question: "What is the capital city of Liberia",
    answerData: Answer(
      id: 4,
      questionId: 4,
      options: [
        Option(
          id: "A",
          answer: "The capital city of liberia is Montserrado",
          isCorrect: false,
          color: Colors.red,
        ),
        Option(
          id: "B",
          answer: "The capital city of liberia is Monrovia",
          isCorrect: true,
          color: Colors.green,
        ),
        Option(
          id: "C",
          answer: "The capital city of liberia is Gbarnga",
          isCorrect: false,
          color: Colors.red,
        ),
      ],
    ),
    subjectId: 1,
  ),
  Question(
    id: 5,
    question: "What is the longest river of Africa",
    answerData: Answer(
      id: 5,
      questionId: 5,
      options: [
        Option(
          id: "A",
          answer: "The longest river of Africa is Nile River",
          isCorrect: true,
          color: Colors.green,
        ),
        Option(
          id: "B",
          answer: "The longest river of Africa is Niger River ",
          isCorrect: false,
          color: Colors.red,
        ),
        Option(
          id: "C",
          answer: "The longest river of Africa is Congo River",
          isCorrect: false,
          color: Colors.red,
        ),
      ],
    ),
    subjectId: 1,
  ),
];
