import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConst {
  static String appName = "My App";
  static bool isDebuggable = true;
  static String appUrl = "${dotenv.env['API_LINK']!}/api/";

  // icon
  static String iconBack = 'assets/icons/ic_back.svg';
  static String iconChevronLeft = 'assets/icons/ic_chevron_left.svg';
  static String iconClose = 'assets/icons/ic_close.svg';
  static String iconEdit2 = 'assets/icons/ic_edit-02.svg';
  static String iconEditIcon = 'assets/icons/ic_edit.svg';
  static String iconEyeActive = 'assets/icons/ic_eye_active.svg';
  static String iconEyeInactive = 'assets/icons/ic_eye_inactive.svg';
  static String iconLogout = 'assets/icons/ic_logout.svg';
  static String iconPlusButton = 'assets/icons/ic_plus_button.svg';
  static String iconPlusPhoto = 'assets/icons/ic_plus_photo.svg';
  static String iconTimes = 'assets/icons/ic_times.svg';

  // images
  static String imageBackground = 'assets/images/im_background.png';

  // lottie
  static String checklist = 'assets/lottie/checklist.json';
}
