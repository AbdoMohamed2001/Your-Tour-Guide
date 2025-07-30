class ProfileViewEntity {
  final String text;
  final String icon;
  final String nextPageName;
  ProfileViewEntity({
    required this.text,
    required this.icon,
    this.nextPageName = '',
  });
}
