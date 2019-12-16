import 'dart:async';
import 'dart:io';

var getName = (FileSystemEntity x) => x
    .toString()
    .substring(x.toString().lastIndexOf("/") + 1, x.toString().length - 1);

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var stream = dir.list(recursive: false);
  stream.listen((file) => files.add(file),
      onDone: () => completer.complete(files));
  return completer.future;
}
