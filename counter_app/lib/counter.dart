import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int countE = 0;
  int countI = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF0B1F3A),
        title: const Text("Match Score Board", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/cup.png"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "EGYPT",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1E293B),),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/egypt.png"),
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("$countE", style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0xFF0F172A),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          countE++;
                        });
                      },
                      child: const Text("Add goal"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 220,
                  child: VerticalDivider(
                    color: Color(0xFF94A3B8),
                    thickness: 2,
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "IRAN",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1E293B),),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/iran.png"),
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "$countI",
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16A34A),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          countI++;
                        });
                      },
                      child: const Text("Add goal"),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              onPressed: () {
                setState(() {
                  countE = 0;
                  countI = 0;
                });
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}