// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../ui/widgets/widgets.dart';
// import 'search_view_model.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SearchViewModel(),
//       child: Consumer<SearchViewModel>(
//         builder: (context, viewModel, child) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Search'),
//             ),
//             body: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: TextField(
//                     controller: viewModel.searchController,
//                     decoration: InputDecoration(
//                       hintText: 'Search for places...',
//                       prefixIcon: const Icon(Icons.search),
//                       suffixIcon: viewModel.searchController.text.isNotEmpty
//                           ? IconButton(
//                               icon: const Icon(Icons.clear),
//                               onPressed: viewModel.clearSearch,
//                             )
//                           : null,
//                     ),
//                     onChanged: viewModel.onSearchChanged,
//                   ),
//                 ),
//                 Expanded(
//                   child: viewModel.isLoading
//                       ? const LoadingWidget(message: 'Searching...')
//                       : viewModel.searchResults.isEmpty
//                           ? const Center(
//                               child: Text('No results found'),
//                             )
//                           : ListView.builder(
//                               itemCount: viewModel.searchResults.length,
//                               itemBuilder: (context, index) {
//                                 final booking = viewModel.searchResults[index];
//                                 return ListTile(
//                                   leading: booking.imageUrl != null
//                                       ? CircleAvatar(
//                                           backgroundImage: NetworkImage(booking.imageUrl!),
//                                         )
//                                       : const CircleAvatar(
//                                           child: Icon(Icons.place),
//                                         ),
//                                   title: Text(booking.title),
//                                   subtitle: Text(booking.description),
//                                   trailing: Text('\$${booking.price.toStringAsFixed(2)}'),
//                                   onTap: () => viewModel.selectBooking(booking),
//                                 );
//                               },
//                             ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }