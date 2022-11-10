import 'dart:convert';

class UserModel {
  final String name;
  final int age;
  final String email;
  final String gender;
  UserModel({
    required this.name,
    required this.age,
    required this.email,
    required this.gender,
  });

  UserModel copyWith({
    String? name,
    int? age,
    String? email,
    String? gender,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'email': email,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      age: map['age'].toInt() as int,
      email: map['email'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, age: $age, email: $email, gender: $gender)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.age == age &&
      other.email == email &&
      other.gender == gender;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      age.hashCode ^
      email.hashCode ^
      gender.hashCode;
  }
}