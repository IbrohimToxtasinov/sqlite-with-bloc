abstract class SingleAddContactEvent {}

class UpdateContact extends SingleAddContactEvent {
  UpdateContact({
    required this.name,
    required this.phoneNumber,
    required this.createdAt,
  });

  final String name;
  final String phoneNumber;
  final String createdAt;
}

class AddContact extends SingleAddContactEvent {}
