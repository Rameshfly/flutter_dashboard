import 'package:dashboard_or_admin_panel/controllers/MenuController2.dart';
import 'package:dashboard_or_admin_panel/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(!Responsive.isDesktop(context))
        IconButton(
          onPressed: context.read<MenuController2>().controlMenu,
          icon: Icon(Icons.menu)
        ),
        if(!Responsive.isMobile(context))
        Text(
          "DashBoard",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if(!Responsive.isMobile(context))
        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          child: SearchField(),
        ),
        ProfileCard(),
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
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white10
        )
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if(!Responsive.isMobile(context))
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding / 2
            ),
            child: Text(
              "Angelina Joli"
            ),
          ),
          Icon(Icons.keyboard_arrow_down)
        ]
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: InkWell(
          onTap: () {
            
          },
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(
              horizontal: defaultPadding / 2
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
