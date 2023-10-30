class EditInfoState {
  final String name;
  final String phone;
  final String email;
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  EditInfoState({
    this.name = '',
    this.phone = '',
    this.email = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });

  EditInfoState copyWith({
    String? name,
    String? email,
    String? phone,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
  }) {
    return EditInfoState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}
