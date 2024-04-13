import 'dart:io';
import 'package:args/args.dart';

class MyFlutterCli {
  // Function to parse arguments and generate Flutter boilerplate code
  void generate(List<String> arguments) {
    final parser = ArgParser()
      ..addOption('name', abbr: 'n', help: 'Name of the project')
      ..addFlag('help', abbr: 'h', help: 'Display help information', negatable: false);

    final argResults = parser.parse(arguments);

    if (argResults['help'] as bool) {
      print('Usage: my_flutter_cli --name <project_name>');
      print(parser.usage);
      return;
    }

    final projectName = argResults['name'] as String?;

    if (projectName == null) {
      print('Error: --name option is required');
      print(parser.usage);
      exit(1);
    }

    generateFlutterBoilerplate(projectName);
  }

  // Function to generate Flutter boilerplate code
  void generateFlutterBoilerplate(String projectName) {
    // Create a new directory for the project
    final projectDirectory = Directory(projectName);
    projectDirectory.createSync();

    // Create main.dart file with a simple Flutter app boilerplate
    final mainFile = File('${projectDirectory.path}/main.dart');
    mainFile.writeAsStringSync('''
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('$projectName')),
        body: Center(child: Text('Welcome to $projectName!')),
      ),
    );
  }
}
''');

    print('Flutter boilerplate code generated for project: $projectName');
  }
}
