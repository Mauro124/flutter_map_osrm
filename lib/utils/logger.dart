import 'package:logger/logger.dart';

var logger = Logger(
  level: Level.info,
  printer: PrettyPrinter(
    methodCount: 1, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 180,
    colors: true,
    printEmojis: true,
  ),
);
