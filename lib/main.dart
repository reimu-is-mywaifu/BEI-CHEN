import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const BeiChenShaoBingApp());

class BeiChenShaoBingApp extends StatelessWidget {
  const BeiChenShaoBingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '北辰燒餅',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC4412F)),
        scaffoldBackgroundColor: const Color(0xFFF6EFE4),
        fontFamily: 'Noto Sans TC',
        useMaterial3: true,
      ),
      home: const BeiChenHomePage(),
    );
  }
}

class BeiChenHomePage extends StatelessWidget {
  const BeiChenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFE4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 98,
            toolbarHeight: 88,
            backgroundColor: const Color(0xFFF6EFE4),
            foregroundColor: const Color(0xFF1C1C19),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            title: GestureDetector(
              onTap: () => _openUrl('https://example.com'),
              child: Row(
                children: const [
                  SizedBox(
                    width: 34,
                    height: 34,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(color: Color(0xFF1C1C19), width: 1)),
                      ),
                      child: Center(child: Text('北', style: TextStyle(fontFamily: 'serif', fontSize: 20))),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('北辰燒餅', style: TextStyle(fontFamily: 'serif', fontWeight: FontWeight.w800, fontSize: 20)),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => _scrollTo('story'), child: const Text('關於我們', style: TextStyle(color: Color(0xFF1C1C19), fontSize: 12, fontWeight: FontWeight.w700))),
              TextButton(onPressed: () => _scrollTo('visit'), child: const Text('來店資訊', style: TextStyle(color: Color(0xFF1C1C19), fontSize: 12, fontWeight: FontWeight.w700))),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ElevatedButton(
                  onPressed: () => launchUrl(Uri.parse('tel:0937530910')),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFC4412F), foregroundColor: Colors.white),
                  child: const Text('打電話詢問', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const HeroSection(),
              const TickerStrip(),
              const StorySection(),
              const MenuSection(),
              const VisitSection(),
              const PressSection(),
              const Footer(),
            ]),
          ),
        ],
      ),
    );
  }

  void _scrollTo(String target) {}
  void _openUrl(String url) {}
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 28, 32, 90),
      color: const Color(0xFFF6EFE4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _heroCopy()),
                    const SizedBox(width: 56),
                    Expanded(child: _heroVisual()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _heroCopy(),
                    const SizedBox(height: 32),
                    _heroVisual(),
                  ],
                );
        },
      ),
    );
  }

  Widget _heroCopy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('永和・民享街 19 號', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFFC4412F), letterSpacing: 0.16)),
        const SizedBox(height: 16),
        const Text('一口咬下，\n酥香有聲。', style: TextStyle(fontFamily: 'serif', fontSize: 54, height: 1.2, fontWeight: FontWeight.w800, color: Color(0xFF1C1C19))),
        const SizedBox(height: 20),
        const Text('每天午後，把麵香和熱氣留在街角。來北辰，帶一份剛出爐的燒餅回家。', style: TextStyle(fontSize: 16, color: Color(0xFF706B61))),
        const SizedBox(height: 30),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () => launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=新北市永和區民享街19號')),
              icon: const Icon(Icons.location_on_outlined),
              label: const Text('導航到店 ↗'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFC4412F), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12)),
            ),
            const SizedBox(width: 20),
            TextButton(onPressed: () => launchUrl(Uri.parse('https://example.com')), child: const Text('認識北辰 ↓', style: TextStyle(color: Color(0xFF1C1C19), fontWeight: FontWeight.w700))),
          ],
        ),
      ],
    );
  }

  Widget _heroVisual() {
    return SizedBox(
      height: 420,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 20,
            child: Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFD79C3C)),
              child: const Center(
                child: Text('下午\n15—19\n現烤出爐', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF1C1C19), fontWeight: FontWeight.w700, fontSize: 14)),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=1200&q=85',
              fit: BoxFit.cover,
              height: 420,
              width: 420,
            ),
          ),
          Positioned(
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: const Color(0xFFF6EFE4),
              child: const Text('脆皮、熱氣，還有剛剛好的香。', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF1C1C19))),
            ),
          ),
        ],
      ),
    );
  }
}

class TickerStrip extends StatelessWidget {
  const TickerStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C1C19),
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: const Center(
        child: Text(
          '手工揉製 ✳ 午後現烤 ✳ 永和在地 ✳ 手工揉製 ✳ 午後現烤 ✳',
          style: TextStyle(color: Color(0xFFF6EFE4), fontSize: 12, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 54, 32, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('01 / 北辰的日常', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFFC4412F), letterSpacing: 0.16)),
          const SizedBox(height: 22),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('從麵香開始的午後', style: TextStyle(color: Color(0xFFC4412F), fontSize: 12, fontWeight: FontWeight.w700)),
                SizedBox(height: 12),
                Text('烤箱一熱，\n街坊就知道了。', style: TextStyle(fontFamily: 'serif', fontSize: 42, height: 1.3, fontWeight: FontWeight.w800)),
              ])),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('北辰燒餅藏在永和民享街。午後三點，麵團進爐，外皮慢慢鼓起、變得金黃酥脆。這裡沒有複雜的距離，只有一份剛好適合帶在手上的熱呼呼。', style: TextStyle(fontSize: 16, color: Color(0xFF706B61))),
                const SizedBox(height: 16),
                const Text('第一次來，跟著香味走；熟客來，總知道要趁熱。', style: TextStyle(fontSize: 16, color: Color(0xFF706B61))),
                const SizedBox(height: 16),
                TextButton(onPressed: () => launchUrl(Uri.parse('https://www.facebook.com/p/%E5%8C%97%E8%BE%B0%E7%87%92%E9%A4%85-100063653932083/?locale=zh_TW')), child: const Text('在 Facebook 看最新消息 ↗', style: TextStyle(color: Color(0xFFC4412F), fontWeight: FontWeight.w700))),
              ])),
            ],
          ),
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network('https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=1600&q=85', height: 260, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = [
      _MenuCard(title: '現烤燒餅', desc: '一層一層的酥皮，剛出爐時最迷人。', tag: '招牌推薦', color: const Color(0xFFF6EFE4)),
      _MenuCard(title: '槓子頭', desc: '外脆內空，越嚼越有麥香的經典滋味。', tag: '街坊熟客愛吃', color: const Color(0xFFEFDDBA)),
      _MenuCard(title: '今日出爐', desc: '每週二至週日，下午三點開始供應。', tag: '售完為止', color: const Color(0xFF1C1C19), textColor: Colors.white),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(32, 54, 32, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('02 / 今天吃什麼', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFFC4412F), letterSpacing: 0.16)),
          const SizedBox(height: 28),
          Row(
            children: [
              const Expanded(child: Text('把喜歡的，\n趁熱帶走。', style: TextStyle(fontFamily: 'serif', fontSize: 40, fontWeight: FontWeight.w800, color: Color(0xFF1C1C19)))),
              Expanded(child: Text('品項依現場供應為準。想確認今日出爐狀況，歡迎先打電話詢問。', style: TextStyle(fontSize: 15, color: Color(0xFF706B61)))),
            ],
          ),
          const SizedBox(height: 30),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.35,
            children: styles
                .map((card) => card)
                .toList(),
          ),
          const SizedBox(height: 18),
          const Text('平均每人消費約 $1–200', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFFC4412F))),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String title;
  final String desc;
  final String tag;
  final Color color;
  final Color textColor;

  const _MenuCard({required this.title, required this.desc, required this.tag, required this.color, this.textColor = const Color(0xFF1C1C19)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('0${title == '現烤燒餅' ? 1 : title == '槓子頭' ? 2 : 3}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: textColor)),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(fontFamily: 'serif', fontSize: 30, fontWeight: FontWeight.w800, color: textColor)),
          const SizedBox(height: 8),
          Text(desc, style: TextStyle(fontSize: 14, color: textColor)),
          const SizedBox(height: 14),
          Text(tag, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: textColor)),
        ],
      ),
    );
  }
}

class VisitSection extends StatelessWidget {
  const VisitSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 50, 32, 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container(
            height: 330,
            decoration: BoxDecoration(
              color: const Color(0xFFE8D4A2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1C1C19)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(child: Icon(Icons.location_pin, size: 80, color: Color(0xFFC4412F))),
                const Positioned(child: Text('北辰\n燒餅', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'serif', fontSize: 24, fontWeight: FontWeight.w800))),
                Positioned(bottom: 16, child: Text('Yonghe, New Taipei', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700))),
              ],
            ),
          )),
          const SizedBox(width: 36),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('03 / 找到北辰', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFFC4412F), letterSpacing: 0.16)),
            const SizedBox(height: 16),
            const Text('今天午後，\n民享街見。', style: TextStyle(fontFamily: 'serif', fontSize: 42, fontWeight: FontWeight.w800)),
            const SizedBox(height: 24),
            const Text('地址\n234 新北市永和區\n智光里民享街 19 號', style: TextStyle(fontSize: 16, height: 1.8, color: Color(0xFF1C1C19))),
            const SizedBox(height: 16),
            const Text('營業時間\n週二–週日　15:00–19:00\n週一公休', style: TextStyle(fontSize: 16, height: 1.8, color: Color(0xFF1C1C19))),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton.icon(onPressed: () => launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=新北市永和區民享街19號')), icon: const Icon(Icons.map_outlined), label: const Text('開啟地圖 ↗'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1C1C19), foregroundColor: Colors.white)),
                const SizedBox(width: 16),
                TextButton(onPressed: () => launchUrl(Uri.parse('tel:0937530910')), child: const Text('0937 530 910', style: TextStyle(color: Color(0xFFC4412F), fontWeight: FontWeight.w700))),
              ],
            ),
          ])),
        ],
      ),
    );
  }
}

class PressSection extends StatelessWidget {
  const PressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 50, 32, 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('04 / 大家怎麼說', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFFC4412F), letterSpacing: 0.16)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text('有人專程來，\n也有人吃過就記住。', style: TextStyle(fontFamily: 'serif', fontSize: 40, fontWeight: FontWeight.w800, color: Color(0xFF1C1C19)))),
              Expanded(child: Text('看看大家筆下的北辰燒餅。', style: TextStyle(fontSize: 16, color: Color(0xFF706B61)))),
            ],
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _LinkPill(label: '水晶安蹄', url: 'https://auntie.tw/20260408/'),
              _LinkPill(label: 'Wisely 的食旅生活', url: 'https://wisely.tw/read-32547.html'),
              _LinkPill(label: 'Threads 食記', url: 'https://www.threads.com/@b.akelike/post/DWSxFBxAZy2/'),
            ],
          ),
        ],
      ),
    );
  }
}

class _LinkPill extends StatelessWidget {
  final String label;
  final String url;
  const _LinkPill({required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF1C1C19)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF1C1C19))),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 40, 32, 50),
      color: const Color(0xFF1C1C19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              SizedBox(width: 34, height: 34, child: DecoratedBox(decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Color(0xFFF6EFE4), width: 1))), child: Center(child: Text('北', style: TextStyle(fontFamily: 'serif', fontSize: 20, color: Color(0xFFF6EFE4))))),
              SizedBox(width: 12),
              Text('北辰燒餅', style: TextStyle(fontFamily: 'serif', fontSize: 20, color: Color(0xFFF6EFE4))),
            ],
          ),
          const SizedBox(height: 16),
          const Text('午後三點，民享街見。', style: TextStyle(fontSize: 16, color: Color(0xFFF6EFE4))),
          const SizedBox(height: 30),
          Row(
            children: [
              const Text('© 2026 BEI CHEN SHAO BING', style: TextStyle(color: Color(0xFFF6EFE4), fontSize: 12)),
              const Spacer(),
              TextButton(onPressed: () => launchUrl(Uri.parse('https://www.facebook.com/p/%E5%8C%97%E8%BE%B0%E7%87%92%E9%A4%85-100063653932083/?locale=zh_TW')), child: const Text('Facebook', style: TextStyle(color: Color(0xFFF6EFE4), fontWeight: FontWeight.w700))),
              TextButton(onPressed: () => launchUrl(Uri.parse('https://www.threads.com/@b.akelike/post/DWSxFBxAZy2/')), child: const Text('Threads', style: TextStyle(color: Color(0xFFF6EFE4), fontWeight: FontWeight.w700))),
            ],
          ),
        ],
      ),
    );
  }
}
