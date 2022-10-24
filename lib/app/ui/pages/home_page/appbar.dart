import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ppa_mobile/app/controllers/home_controller.dart';

import '../../utils/constants/colors.dart';

class AppBarCustom extends GetView<HomeController> {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PRIMARY_COLOR,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      automaticallyImplyLeading: false,
      title: SizedBox(
        width: 100,
        child: SvgPicture.asset(
          'assets/image/logo-damri.svg',
          fit: BoxFit.fitWidth,
        ),
      ),
      flexibleSpace: SafeArea(
        child: Container(
          width: double.infinity,
          height: 131,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            shape: BoxShape.rectangle,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
                child: Image.asset(
                  'assets/image/bg-appbar.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        color: Color(0x323F3D56),
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [Color(0xE6053265), Color(0xE64C99F1)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(1, 0),
                      end: AlignmentDirectional(-1, 0),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 69, 0, 0),
                        child: Text(
                          'Hi, ${controller.getProfile().nmUser}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFFF2F8FF),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 90, 0, 0),
                        child: Text(
                          'Let’s improve your performance every day',
                          style: TextStyle(
                            color: Color(0xFFF2F8FF),
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(277, 60, 0, 0),
                        child: Container(
                          width: 66,
                          height: 51,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(-0.01, -0.8),
                                child: Image.asset(
                                  'assets/image/cloud-weather.png',
                                  width: 66,
                                  height: 37,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Text(
                                '28°C Matraman',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: controller.handleClick,
          itemBuilder: (BuildContext context) {
            return {'Logout', 'Settings'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}
