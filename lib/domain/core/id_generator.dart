import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// generate a unique id
String generateId() {
  return _uuid.v4();
}
