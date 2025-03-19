import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum UserAvatarStatus {
  accepted,
  pending,
  declined,
  none;

  @override
  String toString() {
    switch (this) {
      case UserAvatarStatus.accepted:
        return 'Accepted';
      case UserAvatarStatus.pending:
        return 'Pending';
      case UserAvatarStatus.declined:
        return 'Declined';
      default:
        return 'None';
    }
  }

  Color get statusColor {
    switch (this) {
      case UserAvatarStatus.accepted:
        return Colors.green;
      case UserAvatarStatus.pending:
        return Colors.orange;
      case UserAvatarStatus.declined:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }
}

class UserImageOrLetter extends StatelessWidget {
  const UserImageOrLetter({
    super.key,
    this.padding = const EdgeInsets.only(),
    this.radius = 12,
    this.imageUrl,
    this.name,
    this.status = UserAvatarStatus.none,
  });

  final String? imageUrl;
  final String? name;
  final EdgeInsetsGeometry padding;
  final double radius;
  final UserAvatarStatus status;

  Color get statusColor {
    switch (status) {
      case UserAvatarStatus.accepted:
        return Colors.green;
      case UserAvatarStatus.pending:
        return Colors.orange;
      case UserAvatarStatus.declined:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: status == UserAvatarStatus.none
              ? null
              : Border.all(
                  color: statusColor,
                  width: 1,
                ),
        ),
        child: Padding(
          padding: status == UserAvatarStatus.none
              ? const EdgeInsets.all(0)
              : const EdgeInsets.all(2),
          child: CircleAvatar(
            radius: radius,
            backgroundImage:
                imageUrl != null ? CachedNetworkImageProvider(imageUrl!) : null,
            child: imageUrl == null
                ? SizedBox(
                    width: radius * 2,
                    height: radius * 2,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        name != null && name!.isNotEmpty
                            ? name![0].toUpperCase()
                            : '',
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
