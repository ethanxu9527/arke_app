import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app/theme/tokens.dart';
import '../features/home/home_page.dart';
import '../features/items/items_page.dart';
import '../features/repair/repair_page.dart';
import '../features/profile/profile_page.dart';

/// 应用外壳：深色底 + 发丝线 + 中央 FAB（PRD 视觉 v1.5）
class ArkShell extends ConsumerStatefulWidget {
  const ArkShell({super.key});

  @override
  ConsumerState<ArkShell> createState() => _ArkShellState();
}

class _ArkShellState extends ConsumerState<ArkShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return Scaffold(
      body: IndexedStack(index: _index, children: const [HomePage(), ItemsPage(), RepairPage(), ProfilePage()]),
      floatingActionButton: SizedBox(
        width: 58,
        height: 58,
        child: FloatingActionButton(
          backgroundColor: ArkColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {
            // TODO(W3)：跳转建档流程 add_flow（PRD FR2 四步：分类→拍照→AI 确认→完成）
          },
          child: const Icon(Icons.add, size: 30),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: p.surface, border: Border(top: BorderSide(color: p.divider))),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.inventory_2_outlined), activeIcon: Icon(Icons.inventory_2), label: '商品'),
            BottomNavigationBarItem(icon: Icon(Icons.build_outlined), activeIcon: Icon(Icons.build), label: '维修'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: '我的'),
          ],
        ),
      ),
    );
  }
}
