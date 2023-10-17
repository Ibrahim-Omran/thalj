part of 'document_checking_bloc.dart';

@immutable
sealed class DocumentCheckingEvent {}

class DocumentChecking extends DocumentCheckingEvent {}

class DocumentUpload extends DocumentCheckingEvent {
  final String proofOfIdentityFront;
  final String proofOfIdentityBack;
  final String residenceCardFront;
  final String residenceCardBack;
  final String drivingLicense;
  final String vehicleLicense;
  final String operatingCard;
  final String transferDocument;

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
