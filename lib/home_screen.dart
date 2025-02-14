// import 'package:flutter/material.dart';
 
// class HomeScreen extends StatefulWidget{
//   /* const _HomeScreen({super.key});*/
//   @override
//   State<StatefulWidget> createState() {
//     return _HomeScreen();
//   }
 
// }
// class _HomeScreen extends State<HomeScreen>{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('SHOP', style: TextStyle(letterSpacing: 0.5),
//           ),
//           backgroundColor: Colors.white,
//           actions: [
//             Container(
//               margin: EdgeInsets.only(right: 18),
//               child: (Icon.person_2_outlined),
//             ),
//           ] 
//           ),
//           body: Container(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'shoes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedTabIndex = 0;

  final List<String> _tabs = ['WOMEN', 'MEN', 'KIDS'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SHOP',
          style: TextStyle(letterSpacing: 5.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              // จัดการการกดปุ่ม profile
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find products...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    ),
                  ),
                ),

                // Tabs
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      _tabs.length,
                      (index) => InkWell(
                        onTap: () => _onTabTapped(index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: _selectedTabIndex == index
                                    ? Colors.black
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Text(
                            _tabs[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: _selectedTabIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Banner Image (Responsive)
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/promotions.jpg',
                      fit: BoxFit.cover,
                      height: constraints.maxWidth * 0.5,
                      width: double.infinity,
                    ),
                  ),
                ),

                // List Items
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildListTile('SHOES', 'assets/icons/shoes.png'),
                    const Divider(height: 1),
                    _buildListTile('CLOTHING', 'assets/icons/polo-shirt.png'),
                    const Divider(height: 1),
                    _buildListTile('ACCESSORIES', 'assets/icons/hat.png'),
                    const Divider(height: 1),

                    // Additional buttons
                    Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      crossAxisCount: 2, // จำนวนคอลัมน์
                      childAspectRatio: 2.5, // อัตราส่วนของแต่ละ GridTile
                      shrinkWrap: true, // ทำให้ GridView มีขนาดตามเนื้อหา
                      physics: const NeverScrollableScrollPhysics(), // ป้องกันการ scroll ซ้อน
                      children: [
                        _buildMenuButton('SALE', Icons.percent),
                        _buildMenuButton('SPORT', Icons.run_circle),
                        _buildMenuButton('NEW & TRENDING', Icons.trending_up),
                        _buildMenuButton('GIFT CARDS', Icons.card_giftcard),
                      ],
                    ),
                  ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [ // เปลี่ยนจาก const เป็น List ธรรมดา
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/logo.png', // เปลี่ยน icon เป็นรูป logo.png
              width: 24, // ปรับขนาดตามต้องการ
              height: 24,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
          BottomNavigationBarItem( 
            icon: Image.asset(
              'assets/icons/adiclub.png',
              width: 35,
              height: 35,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, String iconPath) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        width: 24,
        height: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        if (title == 'SHOES') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShoesScreen()),
          );
        } else {
          // จัดการการกดรายการอื่นๆ
        }
      },
    );
  }

  Widget _buildIconButton(String label, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            // จัดการการกดปุ่ม
          },
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

    Widget _buildMenuButton(String label, IconData icon) {
      return InkWell(
        onTap: () {
          // จัดการการกดปุ่ม
        },
        child: Card( // เพิ่ม Card เพื่อให้ดูเป็นสี่เหลี่ยม
          child: Center( // จัดเนื้อหาให้อยู่ตรงกลาง Card
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // จัดเนื้อหาให้อยู่ตรงกลางแนวตั้ง
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Colors.black,
                ),
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );
    }
}
