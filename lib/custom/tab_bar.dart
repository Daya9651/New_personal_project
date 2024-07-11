import 'package:flutter/material.dart';
import 'package:likhit/custom/TabBar/acativeTab.dart';
import 'package:likhit/custom/TabBar/allTab.dart';
import 'package:likhit/custom/TabBar/deletedTab.dart';
import 'package:likhit/custom/TabBar/pendingTab.dart';
import 'package:likhit/custom/TabBar/rejectedTab.dart';


class CompanyReportPage extends StatefulWidget {
  const CompanyReportPage({super.key});

  @override
  State<CompanyReportPage> createState() => _CompanyReportPageState();
}

class _CompanyReportPageState extends State<CompanyReportPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Container(
            child: Row(
              children: [
                Text("Recent Contracts",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(width: 25,),

              ],
            ),
          ),
          bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.blue,
              controller: tabController,
              isScrollable: true,
              tabs: const [
                Tab(text: "All",),
                Tab(text: "Active",),
                Tab(text: "Pending",),
                Tab(text: "Rejected",),
                Tab(text: "Deleted",),
              ]),

        ),
        body: TabBarView(
          controller: tabController,
          children: const [
           TabAll(),
            TabActive(),
            TabPending(),
            TabRejected(),
            TabDeleted(),
          ],
        )
    );
  }
}