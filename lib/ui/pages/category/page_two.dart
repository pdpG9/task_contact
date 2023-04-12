import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_contact/ui/pages/category/category_provider.dart';
import 'package:task_contact/utils/colors.dart';

import '../../../utils/text_view.dart';

class PageTwo extends StatelessWidget {
  final _controller = TextEditingController();
   PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<CategoryModel>().status==Status.loading?const Center(child: CircularProgressIndicator(),):Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: TextView(text: 'Спам', fonSize: 16, fontWeight: FontWeight.w600),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 16.0),
              child: TextView(text: 'Отправьте жалобу, если пользователь рассылает рекламные сообщения, комментарии или другим способом распространяет рекламу в непредназначенных для этого местах.', fonSize: 12, fontWeight: FontWeight.w400),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 8.0),
              child: TextView(text: 'Комментарий (необязательно)', fonSize: 12, fontWeight: FontWeight.w400,textColor: Color(0xFF808C9A)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                height: 112,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: const Color(0xFFE6E8EB),borderRadius: BorderRadius.circular(4)),
                child: TextField(
                  maxLines: 4,
                  controller: _controller,
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w400,fontSize: 12),
                decoration: InputDecoration(hintText: 'Опишите причину жалоб',hintStyle: GoogleFonts.nunito(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xFF808C9A)),border: InputBorder.none,),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
               context.read<CategoryModel>().sendToMessage(_controller.text??'');
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(color: selectedMenuItemColor,borderRadius: BorderRadius.circular(4)),
                child: const Center(child: TextView( text: 'Отправить жалобу',fontWeight: FontWeight.w600,fonSize: 12,textColor: Colors.white)),
              ),
            )


          ],
        ),
      ),
    );
  }
}
