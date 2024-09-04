// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:gomltak/core/api/api_serves.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/errors/failures.dart';
import 'package:gomltak/features/auth_feature/data/models/checkout_orders_model/checkout_orders_model.dart';
import 'package:gomltak/features/auth_feature/data/models/governorate_model/governorate_model.dart';
import 'package:gomltak/features/auth_feature/data/models/login_model/login_model.dart';
import 'package:gomltak/features/auth_feature/data/models/register/register.dart';
import 'package:gomltak/features/auth_feature/data/models/reset_password/forget_password.dart';
import 'package:gomltak/features/auth_feature/data/repositories/register_repo.dart';

class AuthRepoImpel implements AuthRepo {
  final ApiServes apiServes;
  AuthRepoImpel({
    required this.apiServes,
  });

  @override
  Future<Either<Failure, LoginModel>> accountLogin({
    required String email,
    required String password,
  }) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'login',
        data: {
          'email': email,
          'password': password,
        },
        lang: CachHelper.getData('lang').toString(),
      );
      if (resposn['status'] == 1) {
        return right(LoginModel.fromJson(resposn));
      } else {
        return left(ServerFailure(resposn['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, Register>> accountRegisterion({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String userName,
    required int governorateId,
  }) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'register',
        data: {
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'user_name': userName,
          'governorate_id': governorateId,
        },
        lang: CachHelper.getData('lang').toString(),
      );

      if (resposn['status'] == 1) {
        return right(Register.fromJson(resposn));
      } else {
        return left(ServerFailure(resposn['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, ForgetPassword>> accountForgetPassword(
      {required String email}) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'forget-password',
        data: {
          'email': email,
        },
        lang: CachHelper.getData('lang').toString(),
      );
      if (resposn['status'] == 1) {
        return right(ForgetPassword.fromJson(resposn));
      } else {
        return left(ServerFailure(resposn['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, ForgetPassword>> resetPassword({
    required int pinCode,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'reset-password',
        data: {
          'pin_code': pinCode,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
        lang: CachHelper.getData('lang').toString(),
      );
      if (resposn['status'] == 1) {
        return right(ForgetPassword.fromJson(resposn));
      } else {
        return left(ServerFailure(resposn['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }

  @override
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
  }) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'create-order',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'company_name': companyName,
          'governorate_id': governorateId,
          'address': streetAddress,
          'city': townCity,
          'townCity': townCity,
          'country_state': townCity,
          'post_code': postCode,
          'phone': phoneNumber,
          'notes': notesAbout,
          'email': emailAddress,
        },
        token: CachHelper.getData('token').toString(),
        lang: CachHelper.getData('lang').toString(),
      );
      if (resposn['status'] == 1) {
        return right(CheckoutOrdersModel.fromJson(resposn));
      } else {
        return left(ServerFailure(resposn['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, GovernorateModel>> getGovernorate() async {
    try {
      final resposn = await apiServes.get(
        endpoint: 'gover',
        lang: CachHelper.getData('lang').toString(),
      );
      if (resposn['status'] == 1) {
        return right(GovernorateModel.fromJson(resposn));
      } else {
        return left(ServerFailure(resposn['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, ForgetPassword>> editProfile({
    required String userName,
    required String email,
    required String oldPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    try {
      final resposn = await apiServes.post(
        endpoint: 'update-profile',
        data: {
          'user_name': userName,
          'email': email,
          "old_password": oldPassword,
          'new_password': newPassword,
          'new_password_confirmation': newPasswordConfirmation,
        },
        lang: CachHelper.getData('lang').toString(),
        token: CachHelper.getData('token').toString(),
      );
      if (resposn['status'] == 1) {
        return right(ForgetPassword.fromJson(resposn));
      } else {
        return left(ServerFailure(resposn['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure.fromDioError(failure));
      }
      return left(ServerFailure(failure.toString()));
    }
  }
}
