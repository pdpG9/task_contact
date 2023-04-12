import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_contact/ui/pages/category/category_provider.dart';
import 'package:task_contact/utils/text_view.dart';

import '../../../utils/colors.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Image.asset(
            'assets/icons/check_success.png',
            height: 64,
            width: 64,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: TextView(
              text: 'Спасибо!', fonSize: 16, fontWeight: FontWeight.w600),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: TextView(text: 'Модераторы скоро рассмотрят вашу жалобу.',fonSize: 12,fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              context.read<CategoryModel>().closeTask();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(color: selectedMenuItemColor,borderRadius: BorderRadius.circular(4)),
              child: const Center(child: TextView( text: 'Закрыть',fontWeight: FontWeight.w600,fonSize: 12,textColor: Colors.white)),
            ),
          ),
        )
      ],
    );
  }
}
