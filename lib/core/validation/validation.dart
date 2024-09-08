import 'package:gomltak/core/utils/app_string.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return AppString.validatorEnterEmail;
    }
    if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
      return null;
    }
    return AppString.validatorValidEmail;
  }

  static String? validatePassword(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value == null) {
      return AppString.validatorPassword;
    } else {
      if (!regex.hasMatch(value)) {
        return AppString.validatorPasswordContent;
      }
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return AppString.enterUsername;
    }
    return null;
  }
  // static String? validateReview(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your user Review';
  //   }
  //   return null;
  // }

  // static String? validateLastName(value) {
  //   if (value.isEmpty) {
  //     return 'Please enter your last name';
  //   }
  //   if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
  //     return 'Please enter a valid last name';
  //   }
  //   return null;
  // }

  // static String? validateCompanyName(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your user name';
  //   }
  //   return null;
  // }

  // static String? validateCountry(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your user name';
  //   }
  //   return null;
  // }

  // static String? validateStreetAddress(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your user name';
  //   }
  //   return null;
  // }

  // static String? validateCity(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your user name';
  //   }
  //   return null;
  // }

  // static String? validatePostCode(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your user name';
  //   }
  //   return null;
  // }

  static String? validateToRequired(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.validatorFormIsEmpty;
    }
    return null;
  }
}

// class Validators {
//   static String? validateString(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'يرجى إدخال قيمة';
//     } else if (value.length < 6) {
//       return 'يجب أن تتكون السلسلة من 6 أحرف على الأقل';
//     } else {
//       return null;
//     }
//   }
// }
