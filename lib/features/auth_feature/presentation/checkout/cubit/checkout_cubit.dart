import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/features/auth_feature/data/repositories_impel/auth_repos_impel.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.authRepoImpel) : super(CheckoutInitial());
  AuthRepoImpel authRepoImpel;
  static CheckoutCubit get(context) => BlocProvider.of(context);

  Future<void> checkOutOrder({
    required String firstName,
    required String lastName,
    required String companyName,
    required String countryRagion,
    required String streetAddress,
    required String townCity,
    required String postCode,
    required String phoneNumber,
    required int governorateId,
    required String emailAddress,
    required String notesAbout,
  }) async {
    emit(CheckoutOrderLoding());
    authRepoImpel
        .checkOut(
      firstName: firstName,
      lastName: lastName,
      companyName: companyName,
      countryRagion: countryRagion,
      streetAddress: streetAddress,
      townCity: townCity,
      postCode: postCode,
      phoneNumber: phoneNumber,
      governorateId: governorateId,
      emailAddress: emailAddress,
      notesAbout: notesAbout,
    )
        .then(
      (resposne) {
        resposne.fold(
            (faliure) => {emit(CheckoutOrderError())},
            (success) => {
                  emit(CheckoutOrderSuccess()),
                });
      },
    );
  }
}
