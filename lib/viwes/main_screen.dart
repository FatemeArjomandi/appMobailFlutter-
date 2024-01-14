import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/viwes/porofil_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    // List<Widget> listPageBody = [
    //   HomeScreen(size: size),
    //   PorofilScreen(size: size),
    // ];
    return SafeArea(
        child: Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: SolidColor.scafoldBg,
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Image.asset(Assets.image.logo.path, scale: 3)),
              ListTile(
                title: Text('پروفایل کاربری',
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {},
              ),
              const Divider(color: Colors.grey),
              ListTile(
                title: Text('درباره تک‌ بلاگ',
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {},
              ),
              const Divider(color: Colors.grey),
              ListTile(
                title: Text('اشتراک گذاری تک بلاگ',
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {},
              ),
              const Divider(color: Colors.grey),
              ListTile(
                title: Text('تک‌ بلاگ در گیت هاب',
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {},
              ),
              const Divider(color: Colors.grey),
            ],
          ),
        ),
      ),
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: SolidColor.scafoldBg,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            Image(
              image: Assets.image.logo.provider(),
              height: size.height / 13.6,
            ),
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        changeBodyMain: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomeScreen(size: size),
          PorofilScreen(size: size),
        ],
      ),
    ));
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key, required this.changeBodyMain});
  final Function(int) changeBodyMain;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: GradiantColor.buttomNavBakgrand)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          UnconstrainedBox(
            child: Container(
              height: 60,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient:
                      const LinearGradient(colors: GradiantColor.buttomNav)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => changeBodyMain(0),
                      icon: ImageIcon(
                        Assets.icons.home.provider(),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        Assets.icons.write.provider(),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () => changeBodyMain(1),
                      icon: ImageIcon(
                        Assets.icons.user.provider(),
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
