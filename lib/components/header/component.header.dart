// import 'package:admin/controllers/MenuController.dart';
import 'package:admin/models/route_argument.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'component.search.dart';

class Header extends StatelessWidget {

  final Size size;

  const Header({
    Key? key, required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It's necessary to be a stack in order to place the search box with the panel,
    // otherwise you'll be not able to expand the search filters without increasing
    // this component height what looks hugly
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: primaryColor, 
            // borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "Dashboard Bienestar Estudiantil",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .merge(TextStyle(color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('/UserProfile');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context).focusColor.withOpacity(0.15),
                                blurRadius: 5,
                                offset: Offset(0, 2)),
                          ],
                        ),
                        // color: Colors.white,
                        child: Text(
                          "Perfil estudiante",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .merge(TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // if (!Responsive.isMobile(context))
              // Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
              // Expanded(flex: 3, child: SearchField()),
              ProfileCard()
            ],
          ),
        ),
        
        SearchField(),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      child: Container(
        margin: EdgeInsets.only(left: defaultPadding),
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding / 2,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "assets/images/profile_pic.png",
              height: 38,
            ),
            if (!Responsive.isMobile(context))
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text("Angelina Joli"),
              ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
