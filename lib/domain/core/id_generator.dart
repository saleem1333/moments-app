import 'package:uuid/uuid.dart';

const _uuid = Uuid();
const _empty = "";

/// generate a unique id
String generateId() {
  return _uuid.v4();
}

// sometimes in some domains (such as AppUser) it is not neccessary for
// the client to supply an id because it gets overwritten at later point
// we don't want to make the id optional because ultimetly every AppUser
// must have an id. so this method is helpful to indicate that we don't
// care about the generated id because it'll get overwritten at later stage
String generateBlankId() {
  return _empty;
}
