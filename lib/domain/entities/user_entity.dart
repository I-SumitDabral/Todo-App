import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userID;
  final String userName;
  final String userProfileImage;
  final String userEmail;

  const UserEntity(
      this.userID, this.userName, this.userProfileImage, this.userEmail);
  @override
  List<Object?> get props => [userID];
}
