import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_demo/constants.dart';
import 'package:profile_demo/core/app_icons.dart';
import 'package:profile_demo/screens/main/components/area_info_text.dart';
import 'package:profile_demo/screens/main/components/knowledges.dart';
import 'package:profile_demo/screens/main/components/my_info.dart';
import 'package:profile_demo/screens/main/components/skills.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          MyInfo(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  AreaInfoText(
                    title: "Residência",
                    text: "Brasil",
                  ),
                  AreaInfoText(
                    title: "Cidade",
                    text: "Fortaleza",
                  ),
                  AreaInfoText(
                    title: "Era",
                    text: "18",
                  ),
                  Skills(),
                  SizedBox(height: defaultPadding),
                  Knowledges(),
                  Divider(),
                  SizedBox(height: defaultPadding / 2),
                  TextButton(
                    onPressed: () async {
                      final _url =
                          'https://drive.google.com/file/d/1gY05JoeEtzmDWGdvsnfZKzlDj-D3hOsj/view?usp=sharing';
                      if (await canLaunch(_url)) {
                        await launch(_url);
                      } else {
                        print('Something went wrong');
                      }
                    },
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text("DOWNLOAD CV",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              )),
                          SizedBox(width: defaultPadding / 2),
                          SvgPicture.asset(
                            AppIcons.downloadIcon,
                            width: 16.0,
                            height: 16.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: defaultPadding / 2),
                    color: Color(0xFF24242E),
                    child: Row(
                      children: [
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              launch(
                                  'https://www.linkedin.com/in/italo-santos-dev/');
                            },
                            icon: SvgPicture.asset(
                              AppIcons.linkedinIcon,
                              width: 18.0,
                              height: 18.0,
                            )),
                        IconButton(
                            onPressed: () {
                              launch('https://github.com/dev-italosantos');
                            },
                            icon: SvgPicture.asset(AppIcons.githubIcon)),
                        IconButton(
                          onPressed: () async {
                            final Uri params = Uri(
                              scheme: 'mailto',
                              path: 'isantos.worldtec@gmail.com',
                              query:
                                  'subject=Reportar&body=Olá [Primeiro nome], \n\nObrigado por entrar em contato. Eu sinto muito! Entendo completamente sua frustração com [o problema.]  \nAbri um ticket para o time responsável e nossa equipe está priorizando seu problema e fará todo o possível para corrigi-lo o mais rápido possível. Entrarei em contato com você assim que tiver mais informações. \n\nAtenciosamente, [Nome]',
                            );

                            String url = params.toString();

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              print('Could not launch $url');
                            }
                          },
                          icon: SvgPicture.asset(
                            AppIcons.emailIcon,
                            width: 20.0,
                            height: 20.0,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
