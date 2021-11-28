import 'dart:async';

import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

class ExtrasGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    return _generate(library);
  }

  String _generate(LibraryReader library) {
    StringBuffer buffer = StringBuffer();

    for (var classes in library.classes) {
      final name = classes.displayName;
      buffer.writeln(""
          'extension $name on $name{'
          "");

      if (classes.fields.isNotEmpty) {
        buffer.writeln("String details()=>");
        final fieldWithValues = classes.fields
            .where((element) => element.displayName != 'hashCode')
            .map((field) {
          return '${field.displayName}=\$${field.displayName}';
        });
        buffer.writeln("'[$name] ${fieldWithValues.join(', ')}';");
      }
      buffer.writeln("}");
    }

    return buffer.toString();
  }
}
