import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_app/navigationbar/alexa.dart';
import 'package:new_app/navigationbar/devices.dart';
import 'package:new_app/pages/about.dart';
import 'package:new_app/pages/streetlight.dart';
import 'package:new_app/rooms/farm.dart';
// import 'package:new_app/statusbuttons_dashboard/ac.dart';
// import 'package:new_app/statusbuttons_dashboard/doorstatus.dart';
import 'package:new_app/navigationbar/logout.dart';
import 'package:new_app/pages/myinfo.dart';
import 'package:new_app/navigationbar/notifications.dart';
import 'package:new_app/navigationbar/profile.dart';
import 'package:new_app/rooms/livingroom.dart';
import 'package:new_app/rooms/diningroom.dart';
import 'package:new_app/rooms/hall.dart';
import 'package:new_app/rooms/kitchen.dart';
import 'package:new_app/navigationbar/settings.dart';
import 'package:new_app/navigationbar/statistics.dart';
// import 'package:new_app/statusbuttons_dashboard/streetlights.dart';
import 'package:new_app/widget/weather_widget.dart';

// import 'package:flutter_analog_clock/flutter_analog_clock.dart';
// import 'package:pretty_gauge/pretty_gauge.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 2; // Index of the selected tab

  static const List<Widget> _pages = [
    DevicesPage(),
    Alexa(),
    DashboardWidget(),
    Statistics(),
    Settings(),
    Notifications(),
    About(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartHome'),
        backgroundColor: Colors.blue.shade500,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.notifications),
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const MyNotification()));
          //   },
          // ),

          // ADMIN incon
          IconButton(
            onPressed: () {
              // Navigate to MyInfo page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyInfo(),
                ),
              );
            },
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'lib/images/avisek.jpg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 50.0,
        items: const <Widget>[
          Icon(Icons.devices, size: 30),
          Icon(Icons.keyboard_voice, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.bar_chart, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.blue.shade500,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          handleNavigation(index);
        },
      ),
    );
  }

  void handleNavigation(int index) {
    switch (index) {
      case 0:
        // Handle Home tab tap

        break;
      case 1:
        // Handle Devices tab tap

        break;
      case 2:
        // Handle Alexa tab tap
        break;
      case 3:
        // Handle Statistic tab tap

        break;
      case 4:
        // Handle settings tab tap

        break;
    }
  }
}

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),

        //profile
        ListTile(
          title: const Text('Profile'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyProfile(),
              ),
            );
          },
        ),

        //devises
        ListTile(
          title: const Text('Conected Devices'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DevicesPage(),
              ),
            );
          },
        ),

        //notifications
        ListTile(
          title: const Text('Notifications'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Notifications(),
              ),
            );
          },
        ),

        //logout
        ListTile(
          title: const Text('LogOut'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LogOut(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class DashboardWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DashboardWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // INSERTING WEATHER CONTENT HERE SO SPACING GIVEN HERE

      child: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                // mainAxisAlignment: MainAxisAlignment.center,
                border: Border.all(
                    color: Colors.black), // Customize the border color
                borderRadius:
                    BorderRadius.circular(30.0), // Customize the border radius
                color: Colors.blue[400], // Customize the background color
              ),
              child: const WeatherDisplay(
                  apiKey: 'YOUR_API_KEY', cityName: 'London'),
            ),
          ),
          const Divider(thickness: 1.5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                const Divider(thickness: 1.5),
                // const SizedBox(
                //   width: 200,
                //   height: 200,
                //   child: AnalogClockWidget(),
                // ),

                // Text(
                //   formattedTime,
                //   style: const TextStyle(
                //     fontSize: 18,
                //     color: Colors.lightBlue,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                // const Text(
                //   // formattedDate,
                //   // DateFormat.ABBR_MONTH_DAY,
                //   DateFormat.ABBR_MONTH_WEEKDAY_DAY,
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                //  const SizedBox(height: 20),

                const SizedBox(),
                // 2 rows, each containing two buttons

                //Living room
                SizedBox(
                  width: 135,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LivingRoom(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: Colors.blue.shade400,
                      shadowColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text('LivingRoom',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),

                const SizedBox(width: 12),

                //Dining room
                SizedBox(
                  width: 135,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DiningRoom(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0), // Button size
                      backgroundColor: Colors.blue.shade400,
                      shadowColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'DiningRoom',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                //Hall
                SizedBox(
                  width: 135,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HallRoom(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: Colors.blue.shade400,
                      shadowColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Hall',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                //kitchen
                SizedBox(
                  width: 135,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KitchenRoom(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: Colors.blue.shade400,
                      shadowColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Kitchen',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                //Animal farm
                SizedBox(
                  width: 135,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Farm(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: Colors.blue.shade400,
                      shadowColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Farm',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                //analog clock
                //  SizedBox(
                //   width: 175,
                //   height: 200,
                //   child: AnalogClock(
                //     dateTime: DateTime.now(),
                //     isKeepTime: false,
                //     hourHandColor: Colors.black,
                //     minuteHandColor: Colors.black,
                //     secondHandColor: Colors.red,
                //     hourNumberColor: Colors.black,
                //     dialBorderColor: Colors.lightGreen,
                //     dialColor: Colors.lightBlue,
                //     centerPointColor: Colors.lightBlue,
                //   ),

                // child: SizedBox(
                //   child: PrettyGauge(
                //       gaugeSize: 200,
                //       segments: [
                //           GaugeSegment('Low', 20, Colors.red),
                //           GaugeSegment('Medium', 40, Colors.orange),
                //           GaugeSegment('High', 40, Colors.green),
                //       ],
                //       currentValue: 46,
                //       displayWidget: const Text('Fuel in tank', style: TextStyle(fontSize: 12)),
                //   ),
                // ),
                // ),

                // const SizedBox(height: 20),

                const SizedBox(height: 20),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     PrettyGauge(
                //       gaugeSize: 150,
                //       segments: [
                //         GaugeSegment('Low', 20, Colors.red),
                //         GaugeSegment('Medium', 40, Colors.orange),
                //         GaugeSegment('High', 40, Colors.green),
                //       ],
                //       currentValue: 46,
                //       displayWidget: const Text('Humidite of room',
                //           style: TextStyle(fontSize: 11.0)),
                //     ),

                //     const SizedBox(width: 20),

                //     PrettyGauge(
                //       gaugeSize: 150,
                //       segments: [
                //         GaugeSegment('Cold', 30, Colors.lightGreen),
                //         GaugeSegment('Normal', 30, Colors.blue),
                //         GaugeSegment('Hot', 40, Colors.red),
                //       ],
                //       currentValue: 25,
                //       displayWidget:
                //           const Text('Temperature', style: TextStyle(fontSize: 12)),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          const Divider(thickness: 1.5),
          const SizedBox(height: 30),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
              //doorstatus
              // SizedBox(
              //   width: 150, // Set the desired width
              //   height: 80, // Set the desired height
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const DoorStatus(),
              //         ),
              //       );
              //     },
              //     style: ElevatedButton.styleFrom(
              //       padding:
              //           const EdgeInsets.all(25.0), // Padding inside the button

              //       backgroundColor: Colors.blue,
              //       shadowColor: Colors.lightGreen,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(16.0),
              //       ),
              //     ),
              //     child: const Text(
              //       'DoorStatus',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),

              // const SizedBox(height: 30, width: 30),

              //aricondition
              // SizedBox(
              //   width: 150,
              //   height: 80,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const AirConditioner(),
              //           // builder: (context) => const AddDevices(),
              //         ),
              //       );
              //     },
              //     style: ElevatedButton.styleFrom(
              //       padding: const EdgeInsets.all(25.0),
              //       backgroundColor: Colors.blue,
              //       shadowColor: Colors.lightGreen,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(16.0),
              //       ),
              //     ),
              //     child: const Text(
              //       'Air Conditioner',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
          //   ],
          // ),
          // const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: MySwitchButton(),
              ),

              // mainAxisAlignment: MainAxisAlignment.center,
              // children: [
              //   //street lighsts
              //   SizedBox(
              //     width: 150,
              //     height: 80,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const StreetLights(),
              //           ),
              //         );
              //       },
              //       style: ElevatedButton.styleFrom(
              //         padding: const EdgeInsets.all(25.0),
              //         backgroundColor: Colors.blue,
              //         shadowColor: Colors.lightGreen,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(16.0),
              //         ),
              //       ),
              //       child: const Text(
              //         'StreetLights',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ),

              SizedBox(height: 30, width: 30),

              SizedBox(
                child: WashingMachineButton(),
              ),

              //wifirouter
              // SizedBox(
              //   width: 150,
              //   height: 80,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const WifiRouter(),
              //         ),
              //       );
              //     },
              //     style: ElevatedButton.styleFrom(
              //       padding: const EdgeInsets.all(25.0),
              //       backgroundColor: Colors.blue,
              //       shadowColor: Colors.lightGreen,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(16.0),
              //       ),
              //     ),
              //     child: const Text(
              //       'WifiRouter',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
            ],
          ),
            
            const   SizedBox(height: 30),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                child: CctvButton(),
              ),

              SizedBox(height: 30, width: 30),
              
              SizedBox(
                child: SpeakerButton(),
              ),

              SizedBox(height: 30),

            ],
          ),
            const   SizedBox(height: 30),


           const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
               child: FrontDoorButton(),

              ),

              SizedBox(height: 30, width: 30),
              
              SizedBox(
                child: BackDoorButton(),
                
              ),

              SizedBox(height: 30),

            ],
          ),
        ],
      ),
    );
  }
}

class MySwitchButton extends StatefulWidget {
  const MySwitchButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MySwitchButtonState createState() => _MySwitchButtonState();
}

class _MySwitchButtonState extends State<MySwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to another page here
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StreetLightPage(), 
          ),
        );
      },
    
    child: Container(
      height: 155,
      width: 140,
      decoration: BoxDecoration(
        color: isSwitched ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
       
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.light,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue.shade100,
                  inactiveThumbColor: Colors.black,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'StreetLight',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class FrontDoorButton extends StatefulWidget {
  const FrontDoorButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FrontDoorButtonState createState() => _FrontDoorButtonState();
}

class _FrontDoorButtonState extends State<FrontDoorButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: 140,
      decoration: BoxDecoration(
        color: isSwitched ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.door_front_door_outlined,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue.shade100,
                  inactiveThumbColor: Colors.black,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'FrontDoor',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class BackDoorButton extends StatefulWidget {
  const BackDoorButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BackDoorButtonState createState() => _BackDoorButtonState();
}

class _BackDoorButtonState extends State<BackDoorButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: 140,
      decoration: BoxDecoration(
        color: isSwitched ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.door_back_door_outlined,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue.shade100,
                  inactiveThumbColor: Colors.black,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'BackDoor',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CctvButton extends StatefulWidget {
  const CctvButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CctvButtonState createState() => _CctvButtonState();
}

class _CctvButtonState extends State<CctvButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: 140,
      decoration: BoxDecoration(
        color: isSwitched ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.camera,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue.shade100,
                  inactiveThumbColor: Colors.black,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'CCTV',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpeakerButton extends StatefulWidget {
  const SpeakerButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SpeakerButtonState createState() => _SpeakerButtonState();
}

class _SpeakerButtonState extends State<SpeakerButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: 140,
      decoration: BoxDecoration(
        color: isSwitched ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.speaker,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue.shade100,
                  inactiveThumbColor: Colors.black,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'SmartSpeaker',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class WashingMachineButton extends StatefulWidget {
  const WashingMachineButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WashingMachineButtonState createState() => _WashingMachineButtonState();
}

class _WashingMachineButtonState extends State<WashingMachineButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: 140,
      decoration: BoxDecoration(
        color: isSwitched ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.kitchen,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue.shade100,
                  inactiveThumbColor: Colors.black,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'WashinMachine',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
