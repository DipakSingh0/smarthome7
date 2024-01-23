import 'package:flutter/material.dart';
// import 'package:new_app/rooms/diningroom.dart';

class KitchenRoom extends StatelessWidget {
  const KitchenRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Kitchen'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                SwitchButton1(),

                SizedBox(width: 20.0), // Adjust the spacing between buttons
                
                SwitchButton2(),

                
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                FanButton(),
                
                SizedBox(width: 20.0),

                FridgeButton(),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchButton1 extends StatefulWidget {
  const SwitchButton1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton1> {
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
              'Smart LightA',
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


class SwitchButton2 extends StatefulWidget {
  const SwitchButton2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SwitchButton2State createState() => _SwitchButton2State();
}

class _SwitchButton2State extends State<SwitchButton2> {
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
              'Smart LightB',
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


class FanButton extends StatefulWidget {
  const FanButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FanButtonState createState() => _FanButtonState();
}

class _FanButtonState extends State<FanButton> {
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
                  Icons.wind_power,
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
              'Ventilator',
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



class FridgeButton extends StatefulWidget {
  const FridgeButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FridgeButtonState createState() => _FridgeButtonState();
}

class _FridgeButtonState extends State<FridgeButton> {
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
                  Icons.add_box,
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
              'Fridge',
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
