import 'dart:io';

/// File reader for testing purposes
String fixture(String name) => File('/home/hachiman69/Flutter/wordie/test/fixtures/$name').readAsStringSync();
