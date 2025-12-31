class QuestionModel {
  final String id;
  final String category;
  final String categoryId;
  final String categorySlug;
  final String question;
  final List<String> options;
  final String answer;
  final int correctIndex;
  final List<String> tags;
  final String hint;
  final bool isAnswered;
  final String info;
  final String difficulty;
  final String type;
  final List<String> images;
  final String weeklyDay;
  final String weeklyBonus;
  final bool recreate;
  final bool goodToKnow;
  final String questionWithImage;
  final String slug;
  final int v;
  final Author author;
  final List<dynamic> reviews;

  QuestionModel({
    required this.id,
    required this.category,
    required this.categoryId,
    required this.categorySlug,
    required this.question,
    required this.options,
    required this.answer,
    required this.correctIndex,
    required this.tags,
    required this.hint,
    required this.isAnswered,
    required this.info,
    required this.difficulty,
    required this.type,
    required this.images,
    required this.weeklyDay,
    required this.weeklyBonus,
    required this.recreate,
    required this.goodToKnow,
    required this.questionWithImage,
    required this.slug,
    required this.v,
    required this.author,
    required this.reviews,
  });

  QuestionModel copyWith({
    String? id,
    String? category,
    String? categoryId,
    String? categorySlug,
    String? question,
    List<String>? options,
    String? answer,
    int? correctIndex,
    List<String>? tags,
    String? hint,
    bool? isAnswered,
    String? info,
    String? difficulty,
    String? type,
    List<String>? images,
    String? weeklyDay,
    String? weeklyBonus,
    bool? recreate,
    bool? goodToKnow,
    String? questionWithImage,
    String? slug,
    int? v,
    Author? author,
    List<dynamic>? reviews,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      categorySlug: categorySlug ?? this.categorySlug,
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      correctIndex: correctIndex ?? this.correctIndex,
      tags: tags ?? this.tags,
      hint: hint ?? this.hint,
      isAnswered: isAnswered ?? this.isAnswered,
      info: info ?? this.info,
      difficulty: difficulty ?? this.difficulty,
      type: type ?? this.type,
      images: images ?? this.images,
      weeklyDay: weeklyDay ?? this.weeklyDay,
      weeklyBonus: weeklyBonus ?? this.weeklyBonus,
      recreate: recreate ?? this.recreate,
      goodToKnow: goodToKnow ?? this.goodToKnow,
      questionWithImage: questionWithImage ?? this.questionWithImage,
      slug: slug ?? this.slug,
      v: v ?? this.v,
      author: author ?? this.author,
      reviews: reviews ?? this.reviews,
    );
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] ?? json['_id'],
      category: json['category'],
      categoryId: json['categoryId'],
      categorySlug: json['categorySlug'],
      question: json['question'],
      options: List<String>.from(json['options'] ?? []),
      answer: json['answer'],
      correctIndex: json['correctIndex'],
      tags: List<String>.from(json['tags'] ?? []),
      hint: json['hint'],
      isAnswered: json['isAnswered'],
      info: json['info'],
      difficulty: json['difficulty'],
      type: json['type'],
      images: List<String>.from(json['images'] ?? []),
      weeklyDay: json['weeklyDay'],
      weeklyBonus: json['weeklyBonus'],
      recreate: json['recreate'],
      goodToKnow: json['goodToKnow'],
      questionWithImage: json['questionWithImage'],
      slug: json['slug'],
      v: json['__v'],
      author: Author.fromJson(json['author']),
      reviews: List<dynamic>.from(json['reviews'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'category': category,
      'categoryId': categoryId,
      'categorySlug': categorySlug,
      'question': question,
      'options': options,
      'answer': answer,
      'correctIndex': correctIndex,
      'tags': tags,
      'hint': hint,
      'isAnswered': isAnswered,
      'info': info,
      'difficulty': difficulty,
      'type': type,
      'images': images,
      'weeklyDay': weeklyDay,
      'weeklyBonus': weeklyBonus,
      'recreate': recreate,
      'goodToKnow': goodToKnow,
      'questionWithImage': questionWithImage,
      'slug': slug,
      '__v': v,
      'author': author.toJson(),
      'reviews': reviews,
    };
  }
}

class Author {
  final String id;
  final String name;
  final String profileName;

  Author({required this.id, required this.name, required this.profileName});

  Author copyWith({String? id, String? name, String? profileName}) {
    return Author(id: id ?? this.id, name: name ?? this.name, profileName: profileName ?? this.profileName);
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(id: json['_id'], name: json['name'], profileName: json['profileName']);
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'profileName': profileName};
  }
}
