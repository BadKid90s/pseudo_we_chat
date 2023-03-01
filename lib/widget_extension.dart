import 'package:flutter/cupertino.dart';
import 'package:styled_widget/styled_widget.dart';

extension StyledX on Widget {
  //将widget变成styled widget,在方法名冲突的时候适用
  Widget get styled => Styled.widget(child: this);
}
