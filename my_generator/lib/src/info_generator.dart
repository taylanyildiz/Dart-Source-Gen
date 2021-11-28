import 'dart:async';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:analyzer/dart/element/element.dart';

class InfoGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    return _generate(library);
  }

  String _generate(LibraryReader library) {
    final buffer = StringBuffer();
    final element = library.element;

    /// Annotations for class.
    buffer.writeln(""
        '/// This class for example.'
        "");

    buffer.writeln(""
        'class ModelExample{'
        "");

    buffer.writeln(""
        '}'
        "");

    library.allElements.whereType().forEach((element) {
      buffer.writeln('/* ${element.kind.displayName} */');
    });

    for (var element in library.allElements) {
      buffer.writeln('/*');
      buffer.writeln(element.displayName + '\n' + element.name!);
      buffer.writeln('\n' + element.source!.fullName);
      buffer.writeln('*/');
    }

    return buffer.toString();
  }
}
