part of 'document_checking_bloc.dart';

@immutable
sealed class DocumentCheckingState {}

final class DocumentCheckingInitial extends DocumentCheckingState {}

final class DocumentCheckingLoading extends DocumentCheckingState {
  DocumentCheckingLoading(this.loading, this.title, this.desc, this.img);

  final bool loading;
  final String title;
  final String desc;
  final String img;
}

final class DocumentCheckingSuccess extends DocumentCheckingState {
  DocumentCheckingSuccess(this.loading, this.title, this.desc, this.img);

  final bool loading;
  final String title;
  final String desc;
  final String img;
}

final class DocumentUploading extends DocumentCheckingState {}

final class DocumentUploadFailed extends DocumentCheckingState {}
