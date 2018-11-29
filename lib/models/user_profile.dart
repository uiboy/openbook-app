class UserProfile {
  final int id;
  final String name;
  final DateTime birthDate;
  final String avatar;
  final String cover;
  final String bio;
  final String url;
  final String location;
  final bool followersCountVisible;

  UserProfile(
      {this.id,
      this.name,
      this.birthDate,
      this.avatar,
      this.cover,
      this.bio,
      this.url,
      this.location,
      this.followersCountVisible});

  factory UserProfile.fromJSON(Map<String, dynamic> parsedJson) {
    var birthDateData = parsedJson['birth_date'];
    var birthDate;
    if (birthDateData != null)
      birthDate = DateTime.parse(birthDateData);

    return UserProfile(
        id: parsedJson['id'],
        name: parsedJson['name'],
        birthDate: birthDate,
        avatar: parsedJson['avatar'],
        cover: parsedJson['cover'],
        bio: parsedJson['bio'],
        url: parsedJson['url'],
        location: parsedJson['location'],
        followersCountVisible: parsedJson['followers_count_visible']);
  }

  bool hasLocation() {
    return location != null;
  }

  bool hasUrl() {
    return url != null;
  }
}