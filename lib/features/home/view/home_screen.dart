import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common/ui/constant.dart';
import 'package:mobile/common/ui/widgets.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _ScaffoldWidget();
  }
}

class _ScaffoldWidget extends StatelessWidget {
  const _ScaffoldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LogoWidget,
        leadingWidth: 85,
        actions: [_MessagesButton()],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            margin: kCommonPageMargin,
            child: Divider(
              color: kButtonColor,
              height: 1.0,
            ),
          ),
        ),
      ),
      body: _BodyContainerWidget(),
    );
  }
}

class _MessagesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // todo bloc event add
      },
      child: Container(
        margin: kCommonPageMargin,
        width: 29,
        height: 29,
        child: SvgPicture.asset('assets/icons/messages.svg'),
      ),
    );
  }
}

class _BodyContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kCommonPageMargin,
      child: Column(
        children: [
          _DraftRowWidget(),
          _MainTextFieldWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _CameraButtonWidget(),
              _PencilButtonWidget(),
              _ColorButtonWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorButtonWidget extends StatelessWidget {
  const _ColorButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // todo add bloc event
      },
      child: Container(
        width: 75,
        height: 76,
        decoration: BoxDecoration(color: Color.fromRGBO(224, 224, 224, 1)),
        child: SvgPicture.asset('assets/icons/color.svg',
            width: 47, height: 43, fit: BoxFit.scaleDown),
      ),
    );
  }
}

class _PencilButtonWidget extends StatelessWidget {
  const _PencilButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // todo add bloc event
      },
      child: Container(
        width: 100,
        height: 106,
        decoration: BoxDecoration(color: Color.fromRGBO(56, 56, 56, 1)),
        child: SvgPicture.asset('assets/icons/pencil.svg',
            width: 57, height: 57, fit: BoxFit.scaleDown),
      ),
    );
  }
}

class _CameraButtonWidget extends StatelessWidget {
  const _CameraButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // todo add bloc event
      },
      child: Container(
        width: 75,
        height: 76,
        decoration: BoxDecoration(color: Color.fromRGBO(224, 224, 224, 1)),
        child: SvgPicture.asset('assets/icons/camera.svg',
            width: 43, height: 43, fit: BoxFit.scaleDown),
      ),
    );
  }
}

class _MainTextFieldWidget extends StatelessWidget {
  const _MainTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 176, minWidth: 340, maxWidth: 460),
      child: Center(
        child: AutoSizeTextField(
          controller: TextEditingController(),
          showCursor: false,
          minFontSize: 20,
          fullwidth: true,
          cursorColor: Color.fromRGBO(56, 56, 56, 1),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              counterText: "",
              hintText: "Write text log here",
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: TextStyle(
                color: Color.fromRGBO(172, 172, 172, 1),
                fontFamily: 'inter',
                fontWeight: FontWeight.normal,
                fontSize: 36,
              )),
          style: TextStyle(
            color: Color.fromRGBO(56, 56, 56, 1),
            fontFamily: 'inter',
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}

class _DraftRowWidget extends StatelessWidget {
  const _DraftRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 170,
            minWidth: 150,
          ),
          margin: EdgeInsets.only(right: 18),
          height: 87,
          color: Color.fromRGBO(224, 224, 224, 1),
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: 170,
            minWidth: 150,
          ),
          margin: EdgeInsets.only(left: 18),
          height: 87,
          color: Color.fromRGBO(224, 224, 224, 1),
        )
      ],
    );
  }
}
