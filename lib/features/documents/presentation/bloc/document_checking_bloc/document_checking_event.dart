part of 'document_checking_bloc.dart';

@immutable
sealed class DocumentCheckingEvent {}

class DocumentChecking extends DocumentCheckingEvent {}

class DocumentUpload extends DocumentCheckingEvent {
  final XFile proofOfIdentityFront;
  final XFile proofOfIdentityBack;

  final XFile drivingLicense;
  final XFile vehicleLicense;
  final XFile operatingCard;
  final XFile transferDocument;
  final XFile ?commercialRegister;

  DocumentUpload(
      {required this.proofOfIdentityFront,
        required this.proofOfIdentityBack,

        required this.drivingLicense,
        required this.vehicleLicense,
        required this.commercialRegister,
        required this.operatingCard,
        required this.transferDocument});
}