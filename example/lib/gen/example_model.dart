part 'example_model.g.dart';

class ExampleModel {
  ExampleModel({
    this.className,
    this.age,
  });
  final String? className;
  final int? age;

  @override
  String toString() {
    return details();
  }

  @override
  bool operator ==(Object other) {
    return (other is ExampleModel) &&
        className == other.className &&
        age == other.age;
  }

  @override
  int get hashCode => className.hashCode + age.hashCode;
}
