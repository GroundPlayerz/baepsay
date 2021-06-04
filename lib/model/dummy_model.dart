import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/model/nested_comment/nested_comment.dart';
import 'package:golden_balance_flutter/model/post/post.dart';

final Post dummyPost = Post(
  id: -1,
  authorId: -1,
  score: -1,
  profileName: '',
  title: '',
  firstContentText: '',
  secondContentText: '',
  commentCount: -1,
  likeCount: -1,
  viewCount: -1,
  firstContentVoteCount: -1,
  secondContentVoteCount: -1,
  userLikeCount: -1,
  userVoteChoice: -1,
  createdAt: '',
  mediaContentOrders: null,
  mediaTypes: null,
  mediaUrls: null,
);

final Comment dummyComment = Comment(
  id: -1,
  postId: -1,
  userLikeCount: -1,
  profilePhotoUrl: '',
  profileName: '',
  nestedCommentCount: -1,
  likeCount: -1,
  createdAt: '',
  text: '',
);

final NestedComment dummyNestedComment = NestedComment(
  id: -1,
  commentId: -1,
  userLikeCount: -1,
  profilePhotoUrl: '',
  profileName: '',
  likeCount: -1,
  createdAt: '',
  text: '',
);
