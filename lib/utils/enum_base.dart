enum TransitionEnum {
  leftToRight,
  rightToLeft,
  upToDown,
  downToUp,
  centerTwoTurn, // hiển thị ở giữa rồi xoay 2 vòng
  centerTurnToBig, // hiển thị ở giữa rồi xoay 1 vòng và to ra
  centerForSide, //hiển thị ở giữa rồi lan ra 4 góc
  centerToUpDown, // hiển thị ở giữa rồi lan ra 2 cạnh trên và dưới
  lightUp, // từ mờ và sáng lên
  defaultPage,
}

enum SaveButtonEnum { typeCircle, typeSquare, typeDefault }

enum TextFieldIconEnum { typePassword, typeDefault }

enum TextFieldBorderEnum {
  typeBorder, // quanh viền
  typeDefault, // mặc định chỉ có 1 line dưới
  // typeUnderline,  //mặc định chỉ có 1 line dưới
  typeCustom,
  typeNone, // không có line
}

enum BackgroundTypeEnum { typePhone, typeOtp }

enum AnimationIndexEnum { fade, slide }

enum TypeColorTabBar { typeDefault, origin, blue }
