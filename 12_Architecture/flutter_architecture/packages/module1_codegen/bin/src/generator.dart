import 'dart:io';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as path;

const localizationPath = 'packages/module1_codegen';

class Generator {
  static const _kOutput = 'env_variables.g.dart';
  final _prologue = """
// DO NOT EDIT. This code generated via code generator

class EnvironmentVariables {

""";
  final _epilogue = '  }';

  String _getProperty(String value, String propertyName) => """
  String get $propertyName => '$value';
  """;

  void run({required int varNumber}) {
    // ignore: avoid_print
    print('Generation is started');

    final outputFile = path.join(Directory.current.path, 'lib/$_kOutput');

    final output = StringBuffer();
    output.writeln(_prologue);

    for(final entry in Platform.environment.entries.take(varNumber)){
      output.writeln(_getProperty(entry.value, entry.key.toLowerCase()));
    }

    output.writeln(_epilogue);

    final formattedCode = DartFormatter().format(output.toString());

    File(outputFile).writeAsStringSync(formattedCode);
    // ignore: avoid_print
    print('Generation is finished');
  }

}