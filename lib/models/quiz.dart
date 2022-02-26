import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizModel {
  List<Quiz> get() {
    return [];
  }
}

class Quiz {
  final String? category;
  final String? type;
  final String? difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  Quiz({
    this.category,
    this.type,
    this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  Quiz copyWith({
    String? category,
    String? type,
    String? difficulty,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
  }) {
    return Quiz(
      category: category ?? this.category,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'type': type,
      'difficulty': difficulty,
      'question': question,
      'correctAnswer': correctAnswer,
      'incorrectAnswers': incorrectAnswers,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      category: map['category'] ?? '',
      type: map['type'] ?? '',
      difficulty: map['difficulty'] ?? '',
      question: map['question'] ?? '',
      correctAnswer: map['correct_answer'] ?? '',
      incorrectAnswers: List<String>.from(map['incorrect_answers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quiz(category: $category, type: $type, difficulty: $difficulty, question: $question, correctAnswer: $correctAnswer, incorrectAnswers: $incorrectAnswers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quiz &&
        other.category == category &&
        other.type == type &&
        other.difficulty == difficulty &&
        other.question == question &&
        other.correctAnswer == correctAnswer &&
        listEquals(other.incorrectAnswers, incorrectAnswers);
  }

  @override
  int get hashCode {
    return category.hashCode ^
        type.hashCode ^
        difficulty.hashCode ^
        question.hashCode ^
        correctAnswer.hashCode ^
        incorrectAnswers.hashCode;
  }
}
