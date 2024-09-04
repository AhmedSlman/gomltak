import 'package:dartz/dartz.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/auth_feature/data/models/checkout_orders_model/checkout_orders_model.dart';
import 'package:gomltak/features/auth_feature/data/models/governorate_model/governorate_model.dart';
import 'package:gomltak/features/auth_feature/data/models/login_model/login_model.dart';
import 'package:gomltak/features/auth_feature/data/models/reset_password/forget_password.dart';

import '../models/register/register.dart';

abstract class AuthRepo {
  Future<Either<Failure, Register>> accountRegisterion({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String userName,
    required int governorateId,
  });
  Future<Either<Failure, LoginModel>> accountLogin({
    required String email,
    required String password,
  });
  Future<Either<Failure, ForgetPassword>> accountForgetPassword({
    required String email,
  });
  Future<Either<Failure, ForgetPassword>> resetPassword({
    required int pinCode,
    required String password,
    required String passwordConfirmation,
  });
  Future<Either<Failure, ForgetPassword>> editProfile({
    required String userName,
    required String email,
    required String oldPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  });
  Future<Either<Failure, CheckoutOrdersModel>> checkOut({
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
  });

  Future<Either<Failure, GovernorateModel>> getGovernorate();
}
