import 'package:cabelin_v2/pages/estableshiment/components/informations/informations.dart';
import 'package:cabelin_v2/pages/estableshiment/components/portfolio/portfolio.dart';
import 'package:cabelin_v2/pages/estableshiment/components/services_offer/services_offer.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EstlableshimentPage extends StatelessWidget {
  const EstlableshimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                leading: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                    size: 52,
                    color: Colors.white,
                  )
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.5323gYZjoqFwr0zrN28KPAHaE8%26pid%3DApi&f=1&ipt=96d6cb3c800087f979dcfed334aaa919f198619cfcf66cec8e9bfe1f65920957&ipo=images",
                    fit: BoxFit.cover,
                  )
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget("Salão Mallonzete"),
                      TextWidget(
                        "Av Plinio Valério",
                        customFontsize: 13,
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  
                  const TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "Serviços"),
                      Tab(text: "Portfólio"),
                      Tab(text: "Informações"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: const Padding(
            padding:  EdgeInsets.only(left: 16, right: 16),
            child: TabBarView(
              children: [
                ServicesOfferPage(),
                Portfolio(),
                Informations()
              ]
            ),
          )
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  Container(
      color: Colors.white,
      child: _tabBar
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
