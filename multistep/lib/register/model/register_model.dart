// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModel {
  final String? name;
  final String? email;
  final String? site;
  RegisterModel({
    this.name,
    this.email,
    this.site,
  });

  RegisterModel copyWith({
    String? name,
    String? email,
    String? site,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      site: site ?? this.site,
    );
  }

  @override
  String toString() => 'RegisterModel(name: $name, email: $email, site: $site)';
}
