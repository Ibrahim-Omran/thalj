part of 'document_checking_bloc.dart';

@immutable
sealed class DocumentCheckingEvent {}

class DocumentChecking extends DocumentCheckingEvent {}

class DocumentUpload extends DocumentCheckingEvent {
  final XFile proofOfIdentityFront;
  final XFile proofOfIdentityBack;
  final XFile residenceCardFront;
  final XFile residenceCardBack;
  final XFile drivingLicense;
  final XFile vehicleLicense;
  final XFile operatingCard;
  final XFile transferDocument;

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