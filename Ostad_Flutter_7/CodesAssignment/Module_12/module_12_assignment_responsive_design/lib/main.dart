import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        breakpoints: [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false
    );
  }
}

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ResponsiveWrapper.of(context).isLargerThan(TABLET)
            ? Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HUMMING',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'BIRD .',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : ResponsiveWrapper.of(context).isTablet
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'HUMMING',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'BIRD .',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'HUMMING',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 18,
                            // Adjust font size for mobile
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'BIRD.',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 18,
                            // Adjust font size for mobile
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
        actions: _buildActions(context),
        leading: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
            ? IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              )
            : null,
      ),
      drawer: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'SKILL UP NOW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'TAP HERE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.movie, color: Colors.black),
                    title:
                        Text('Episodes', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Handle the tap here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.black),
                    title: Text('About', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Handle the tap here
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ResponsiveWrapper.of(context).isLargerThan(TABLET)
              ? DesktopLayout()
              : ResponsiveWrapper.of(context).isLargerThan(MOBILE)
                  ? TabletLayout()
                  : MobileLayout(),
        ),
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return [];
    } else {
      return [
        TextButton(
          onPressed: () {},
          child: Text('Episodes', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {},
          child: Text('About', style: TextStyle(color: Colors.black)),
        ),
      ];
    }
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'FLUTTER WEB.\nTHE BASICS',
                style: GoogleFonts.roboto(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'In this course we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, Modals and more.',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              child: Text(
                'Join course',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabletLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'FLUTTER WEB.\nTHE BASICS',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'In this course we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, Modals and more.',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 24,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: Text(
            'Join course',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'FLUTTER WEB.\nTHE BASICS',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'In this course we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, Modals and more.',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            minimumSize: Size(150, 50), // Adjust button size for mobile
          ),
          child: Text(
            'Join course',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
