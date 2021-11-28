import 'package:my_generator/src/extras_generator.dart';

import 'src/info_generator.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder infoGeneratorBuilder(BuilderOptions options) {
  return SharedPartBuilder([InfoGenerator()], 'info');
}

Builder extrasGeneratorBuilder(BuilderOptions options) {
  return SharedPartBuilder([ExtrasGenerator()], 'extras');
}
