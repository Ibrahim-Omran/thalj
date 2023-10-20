part of 'document_checking_bloc.dart';

@immutable
sealed class DocumentCheckingEvent {}

class DocumentChecking extends DocumentCheckingEvent {}

class DocumentUpload extends DocumentCheckingEvent {
  final File proofOfIdentityFront;
  final File proofOfIdentityBack;
  final File residenceCardFront;
  final File residenceCardBack;
  final File drivingLicense;
  final File vehicleLicense;
  final File operatingCard;
  final File transferDocument;

  DocumentUpload(
      {required this.proofOfIdentityFront,
      required this.proofOfIdentityBack,
      required this.residenceCardFront,
      required this.residenceCardBack,
      required this.drivingLicense,
      required this.vehicleLicense,
      required this.operatingCard,
      required this.transferDocument});
}
