import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_contact/ui/pages/category/category_provider.dart';
import 'package:task_contact/ui/pages/category/page_one.dart';
import 'package:task_contact/ui/pages/category/page_three.dart';
import 'package:task_contact/ui/pages/category/page_two.dart';
import 'package:task_contact/utils/colors.dart';
import 'package:task_contact/utils/text_view.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: context.watch<CategoryModel>().status == Status.initial
          ? Center(
              child: TextButton(
                  onPressed: () {
                    context.read<CategoryModel>().changeStatus(Status.run);
                  },
                  child: const Text('Run task')),
            )
          : Column(
              children: [
                Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: IconButton(
                        onPressed: () {
                            context.read<CategoryModel>()
                                .changeStatus(Status.initial);},
                        icon: Icon(context.watch<CategoryModel>().index==0?Icons.close:Icons.arrow_back_rounded,color: mainTextColor,)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: const Color(0xFFE6E8EB),
                            ),
                            child: const Center(
                                child: TextView(text: 'К', fonSize: 32, fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const TextView(text: 'Константин Володарский', fonSize: 20, fontWeight: FontWeight.w600)
                        ],
                      )
                    ],
                  ),
                ]),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: unSelectedMenuItemColor,
                  height: 0.5,
                  width: double.infinity,
                ),
                Expanded(
                  flex: 1,
                  child: PageView(
                      pageSnapping: false,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: context.watch<CategoryModel>().controller,
                      children: [
                        const PageOne(),
                        PageTwo(),
                        const PageThree(),
                      ]),
                )
              ],
            ),
    ));
  }
}
