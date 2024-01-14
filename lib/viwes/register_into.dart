import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/viwes/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterInto extends StatelessWidget {
  const RegisterInto({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/image/svgTech.svg',
              height: 100,
            ),
            const SizedBox(height: 16),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: Strings.welcome,
                  style: Theme.of(context).textTheme.titleSmall,
                )),
            const SizedBox(height: 80),
            SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  showEmailBottomSheet(context);
                },
                child: const Text('بزن بریم'),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> showEmailBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 350,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.inpotEmail,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                      onChanged: (value) {
                        print(value + 'is Email =' + isEmail(value).toString());
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'techblog@gmail.com',
                      )),
                ),
                SizedBox(
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showActivitiCodeBottomSheet(context);
                        }, child: const Text('ادامه')))
              ],
            ),
          ),
        );
      },
    );
  }
  
  Future<dynamic> showActivitiCodeBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 350,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.activeCode,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                      onChanged: (value) {
                        //print(value + 'is Email =' + isNumeric(value).toString());
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '*****',
                      )),
                ),
                SizedBox(
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MyCats(),));
                        }, child: const Text('ادامه')))
              ],
            ),
          ),
        );
      },
    );
  }
}
