import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/models/facke_data.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_component.dart';

import '../my_strings.dart';

class MyCats extends StatefulWidget {
  const MyCats({
    super.key,
  });

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            SvgPicture.asset(
              'assets/image/svgTech.svg',
              height: 100,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(Strings.seccfull,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: SolidColor.primeryColor,
                    )),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "نام و نام خانوادگی",
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(Strings.chooseCast,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: SolidColor.primeryColor,
                    )),
            //tagList
            Padding(
              padding:
                  EdgeInsets.only(top: 32, left: bodyMargin, right: bodyMargin),
              child: SizedBox(
                height: 100,
                width: double.maxFinite,
                child: GridView.builder(
                  itemCount: tagList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.3),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            if (!selectedTags.contains(tagList[index])) {
                              selectedTags.add(tagList[index]);
                            } else {
                              debugPrint('${tagList[index].titel} is exste');
                            }
                          });
                        },
                        child: TagListView(size: size, index: index));
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),
            Image.asset(
              'assets/icons/fash.png',
              height: 80,
            ),
            const SizedBox(height: 32),
            //selectedTags
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: selectedTags.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: SolidColor.surface,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedTags[index].titel,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTags.removeAt(index);
                                  });
                                },
                                child: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    )));
  }
}
