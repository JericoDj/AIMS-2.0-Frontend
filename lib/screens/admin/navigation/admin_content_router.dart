import 'package:flutter/material.dart';
import '../../Offline/OfflineInventoryPage.dart';
import '../../Offline/OfflineStockMonitoringPage.dart';
import '../../Offline/OfflineTransactionsPage.dart';
import '../admin_state.dart';

// pages
import '../DashboardPage.dart';
import '../InventoryPage.dart';
import '../StockMonitoringPage.dart';
import '../TransactionsPage.dart';
import '../ManageAccountPage.dart';
import '../SettingsPage.dart';

class AdminContentRouter extends StatelessWidget {
  final AdminState state;
  const AdminContentRouter({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (!state.isOfflineMode) {
      switch (state.selectedIndex) {
        case 0:
          return const DashboardPage();
        case 1:
          return const InventoryPage();
        case 2:
          return const StockMonitoringPage();
        case 3:
          return const TransactionsPage();
        case 4:
          return const ManageAccountsPage();
        case 5:
          return const SettingsPage();
      }
    } else {
      switch (state.selectedIndex) {
        case 0:
          return const OfflineInventoryPage();
        case 1:
          return const OfflineStockMonitoringPage();
        case 2:
          return const OfflineTransactionsPage();
        case 3:
          return const SettingsPage();
      }
    }

    return const Center(child: Text("Unknown Page"));
  }
}
