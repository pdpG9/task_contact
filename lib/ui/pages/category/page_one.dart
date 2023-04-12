
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_contact/ui/pages/category/category_provider.dart';
import 'package:task_contact/utils/text_view.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: TextView(text: 'Что на странице Контантина кажется вам недопустимым?', fonSize: 16, fontWeight: FontWeight.w600),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 12.0),
            child: InkWell(onTap: () => context.read<CategoryModel>().moveToNextPage(),child: TextView(text: 'Спам', fonSize: 12, fontWeight: FontWeight.w400)),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 12.0),
            child: TextView(text: 'Мошенничество', fonSize: 12, fontWeight: FontWeight.w400),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 12.0),
            child: TextView(text: 'Оскорбления', fonSize: 12, fontWeight: FontWeight.w400),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 12.0),
            child: TextView(text: 'Откровенное изображение', fonSize: 12, fontWeight: FontWeight.w400),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 12.0),
            child: TextView(text: 'Проблема с профилем', fonSize: 12, fontWeight: FontWeight.w400),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 12.0),
            child: TextView(text: 'Нарушение интеллектуальных прав', fonSize: 12, fontWeight: FontWeight.w400),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 12.0),
            child: TextView(text: 'Прочее', fonSize: 12, fontWeight: FontWeight.w400),
          ),

        ],
      ),
    );
  }
}
