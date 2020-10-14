import 'dart:io';

/// File reader for testing purposes
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
