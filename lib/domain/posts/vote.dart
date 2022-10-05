import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_user/app_user.dart';

class Vote {
  final AppUser user;
  final VoteType type;

  Vote({required this.user, required this.type});
}

@JsonEnum()
enum VoteType { upvote, downvote }
