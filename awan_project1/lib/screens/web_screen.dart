import 'package:flutter/material.dart';

class WebBody extends StatefulWidget {
  const WebBody({Key? key}) : super(key: key);

  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> with TickerProviderStateMixin {
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
          const Text(
            "case studies",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
          ),
          const SizedBox(width: 20),
          const Text(
            "Work with us",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
          ),
          const SizedBox(width: 20),
          const Text(
            "Get premium",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
          ),
          const SizedBox(width: 20),
          const Text(
            "Blog",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 70, 127),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "LAUNCH APP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
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
                      Row(
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