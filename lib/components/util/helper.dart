// matching various patterns for kinds of data
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class Validator {
  Validator();

  String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.email'.tr;
    } else {
      return null;
    }
  }

  bool? isValidEmail(String value) {
    final bool isEmailValid = EmailValidator.validate(value);
    if (!isEmailValid) {
      return false;
    }
    final domain = value.split('@').last;
    final domainParts = domain.split('.');
    if (domainParts.length > 2) {
      return false;
    }
    return true;
  }

  String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Format email tidak sesuai';
    } else {
      return null;
    }
  }

  String? name(String? value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.name'.tr;
    } else {
      return null;
    }
  }

  String? number(String? value) {
    String pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Nomor tidak valid';
    } else {
      return null;
    }
  }

  String? amount(String? value) {
    String pattern = r'^\d+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.amount'.tr;
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    if (value?.isEmpty == true) {
      return 'Data tidak boleh kosong';
    } else {
      return null;
    }
  }
}
