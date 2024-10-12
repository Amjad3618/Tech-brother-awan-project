
import 'package:flutter/material.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _bubbleController;
  late Animation<double> _bubbleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _controller2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward(from: 0.3);
    _controller3 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward(from: 0.6);

    // Animation for the "bubble" effect on the large container
    _bubbleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    // Define bubble animation (for moving up and down a little continuously)
    _bubbleAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _bubbleController,
        curve: Curves.easeInOut,
      ),
    );

    // Repeat the animation (moving up and down continuously)
    _bubbleController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _bubbleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
                child: const Center(
                  child: Text(
                    "Logo",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const Text(
                "bubblemaps",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.menu))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 700,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 12, 75, 126),
                Colors.purple,
             
                Color.fromARGB(255, 182, 36, 104),
              ])),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Innovative Visuals For \n Blockchain Data ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Transparent, Effective, Playful ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.blue,
                                        backgroundColor: Colors.transparent,
                                        side: const BorderSide(
                                            color: Colors.blue, width: 2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                      ),
                                      child: const Text("GET PREMIUM"),
                                    ),
                                    const SizedBox(width: 20),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 12),
                                      ),
                                      onPressed: () {},
                                      child: const Text("LAUNCH APP"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 400,
                                width: 300,
                                child: Stack(
                                  children: [
                                    _buildAnimatedContainer(_controller1, 0, 0, 0.6),
                                    _buildAnimatedContainer(_controller2, 100, 50, 0.8),
                                    _buildBubbleContainer(_controller3, 200, 100, 1.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 1, 29, 53),
              ),
              child: const Column(
                children: [
                  Text(
                    "Trusted by",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                    child: SizedBox(
                      width: 400,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Industry leading projects use Bubblemaps to follow holders behavior, get actionable market insights, and showcase transparency to the community.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the animated bubble container (now for the large container)
  Widget _buildBubbleContainer(
      AnimationController controller, double top, double left, double scale) {
    return AnimatedBuilder(
      animation: _bubbleAnimation,
      builder: (context, child) {
        return Positioned(
          top: top + _bubbleAnimation.value,
          left: left,
          child: Transform.scale(
            scale: controller.value * scale,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }

  // Function to build animated containers for the background (small and medium)
  Widget _buildAnimatedContainer(
      AnimationController controller, double top, double left, double scale) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
          top: top,
          left: left,
          child: Transform.scale(
            scale: controller.value * scale,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';


// class MobileWebBody extends StatefulWidget {
//   const MobileWebBody({Key? key}) : super(key: key);

//   @override
//   State<MobileWebBody> createState() => _MobileWebBodyState();
// }

// class _MobileWebBodyState extends State<MobileWebBody>
//     with TickerProviderStateMixin {
//   late List<AnimationController> _controllers;
//   late AnimationController _bubbleController;
//   late Animation<double> _bubbleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controllers = List.generate(
//       3,
//       (index) => AnimationController(
//         duration: const Duration(seconds: 2),
//         vsync: this,
//       )..forward(from: index * 0.3),
//     );

//     _bubbleController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);

//     _bubbleAnimation = Tween<double>(begin: 0, end: 20).animate(
//       CurvedAnimation(
//         parent: _bubbleController,
//         curve: Curves.easeInOut,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     _bubbleController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 50,
//                 width: 50,
//                 decoration: const BoxDecoration(
//                     color: Colors.orange, shape: BoxShape.circle),
//                 child: const Center(
//                   child: Text(
//                     "LOGO",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w300,
//                         fontSize: 14),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 20),
//             const Text(
//               "bubblemaps",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           ),
//         ),
//       ),
//       drawer: _buildDrawer(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 600,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 12, 75, 126),
//                     Colors.purple,
//                     Color.fromARGB(255, 110, 104, 104),
//                     Color.fromARGB(255, 182, 36, 104),
//                   ],
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 40.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     _buildTextContent(),
//                     const SizedBox(height: 40),
//                     _buildAnimatedContainers(),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: 400,
//               width: double.infinity,
//               decoration:
//                   const BoxDecoration(color: Color.fromARGB(255, 1, 29, 53)),
//               child: const Column(
//                 children: [
//                   Text(
//                     "Trusted by",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 15),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       "Industry leading projects use Bubblemaps to follow holders behavior, get actionable market insights, and showcase transparency to the community.",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconRowWidget(
//                         icons: [
//                           Icons.face,
//                           Icons.grid_3x3_outlined,
//                           Icons.abc,
//                           Icons.man,
//                           Icons.arrow_upward,
//                           Icons.ac_unit
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       IconRowWidget(
//                         icons: [
//                           Icons.charging_station_rounded,
//                           Icons.wordpress_outlined,
//                           Icons.airplanemode_active_outlined,
//                           Icons.home,
//                           Icons.track_changes_outlined,
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.purple,
//             ),
//             child: Text(
//               'bubblemaps',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           _buildDrawerItem('Case Studies', Icons.cases),
//           _buildDrawerItem('Work with us', Icons.work),
//           _buildDrawerItem('Get Premium', Icons.star),
//           _buildDrawerItem('Blog', Icons.article),
//           _buildDrawerItem('Launch App', Icons.launch),
//         ],
//       ),
//     );
//   }

//   Widget _buildDrawerItem(String title, IconData icon) {
//     return ListTile(
//       leading: Icon(icon),
//       title: Text(title),
//       onTap: () {
//         Navigator.pop(context);
//       },
//     );
//   }

//   Widget _buildTextContent() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const Text(
//           "Innovative Visuals For\nBlockchain Data",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 16),
//         const Text(
//           "Transparent, Effective, Playful",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Color.fromARGB(255, 199, 191, 191),
//             fontSize: 18,
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//         const SizedBox(height: 24),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildButton("GET PREMIUM", Colors.blue, Colors.transparent),
//             const SizedBox(width: 16),
//             _buildButton("LAUNCH APP", Colors.white, Colors.pink),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildButton(String text, Color textColor, Color bgColor) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         foregroundColor: textColor,
//         backgroundColor: bgColor,
//         side:
//             bgColor == Colors.transparent ? BorderSide(color: textColor) : null,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       ),
//       onPressed: () {},
//       child: Text(text),
//     );
//   }

//   Widget _buildAnimatedContainers() {
//     return SizedBox(
//       height: 300,
//       child: Stack(
//         alignment: Alignment.center,
//         children: List.generate(3, (index) {
//           if (index == 2) {
//             return _buildBubbleContainer(
//               _controllers[index],
//               100.0,
//               50.0,
//               0.6,
//             );
//           } else {
//             return _buildAnimatedContainer(
//               _controllers[index],
//               50.0 * index,
//               25.0 * index,
//               1.0 - (index * 0.2),
//             );
//           }
//         }),
//       ),
//     );
//   }

//   Widget _buildAnimatedContainer(
//     AnimationController controller,
//     double topPosition,
//     double leftPosition,
//     double opacity,
//   ) {
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         return Positioned(
//           top: topPosition + (50 * (1 - controller.value)),
//           right: leftPosition,
//           child: Transform.scale(
//             scale: 0.5 + (0.5 * controller.value),
//             child: Opacity(
//               opacity: opacity * controller.value,
//               child: Container(
//                 height: 150,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(opacity),
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1 * controller.value),
//                       blurRadius: 10 * controller.value,
//                       spreadRadius: 5 * controller.value,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildBubbleContainer(
//     AnimationController controller,
//     double topPosition,
//     double leftPosition,
//     double opacity,
//   ) {
//     return AnimatedBuilder(
//       animation: Listenable.merge([controller, _bubbleAnimation]),
//       builder: (context, child) {
//         return Positioned(
//           top: topPosition + (50 * (1 - controller.value)) + _bubbleAnimation.value,
//           right: leftPosition,
//           child: Transform.scale(
//             scale: 0.5 + (0.5 * controller.value),
//             child: Opacity(
//               opacity: opacity * controller.value,
//               child: Container(
//                 height: 150,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(opacity),
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1 * controller.value),
//                       blurRadius: 10 * controller.value,
//                       spreadRadius: 5 * controller.value,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class IconRowWidget extends StatelessWidget {
//   final List<IconData> icons;

//   const IconRowWidget({Key? key, required this.icons}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: icons.map((icon) {
//           return Container(
//             margin: const EdgeInsets.symmetric(horizontal: 4.0),
//             height: 50,
//             width: 50,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//             child: Center(
//               child: Icon(icon),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }