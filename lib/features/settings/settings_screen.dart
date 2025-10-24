// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'settings_view_model.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SettingsViewModel(),
//       child: Consumer<SettingsViewModel>(
//         builder: (context, viewModel, child) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Settings'),
//             ),
//             body: ListView(
//               children: [
//                 ListTile(
//                   leading: const Icon(Icons.person),
//                   title: const Text('Profile'),
//                   trailing: const Icon(Icons.chevron_right),
//                   onTap: viewModel.navigateToProfile,
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.notifications),
//                   title: const Text('Notifications'),
//                   trailing: Switch(
//                     value: viewModel.notificationsEnabled,
//                     onChanged: viewModel.toggleNotifications,
//                   ),
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.dark_mode),
//                   title: const Text('Dark Mode'),
//                   trailing: Switch(
//                     value: viewModel.darkModeEnabled,
//                     onChanged: viewModel.toggleDarkMode,
//                   ),
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.language),
//                   title: const Text('Language'),
//                   subtitle: Text(viewModel.selectedLanguage),
//                   trailing: const Icon(Icons.chevron_right),
//                   onTap: viewModel.selectLanguage,
//                 ),
//                 const Divider(),
//                 ListTile(
//                   leading: const Icon(Icons.help),
//                   title: const Text('Help & Support'),
//                   trailing: const Icon(Icons.chevron_right),
//                   onTap: viewModel.navigateToHelp,
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.info),
//                   title: const Text('About'),
//                   trailing: const Icon(Icons.chevron_right),
//                   onTap: viewModel.navigateToAbout,
//                 ),
//                 const Divider(),
//                 ListTile(
//                   leading: const Icon(Icons.logout, color: Colors.red),
//                   title: const Text('Logout', style: TextStyle(color: Colors.red)),
//                   onTap: viewModel.logout,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
