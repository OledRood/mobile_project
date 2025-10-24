// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mobile_study/ui/widgets/custom_text_field.dart';

// import '../../core/utils/validators.dart';

// class AddItemScreen extends ConsumerStatefulWidget {
//   const AddItemScreen({super.key});

//   @override
//   ConsumerState<AddItemScreen> createState() => _AddItemScreenState();
// }

// class _AddItemScreenState extends ConsumerState<AddItemScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();

//   DateTime? _startDate;
//   DateTime? _endDate;
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     _priceController.dispose();
//     _locationController.dispose();
//     super.dispose();
//   }

//   Future<void> _selectStartDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _startDate ?? DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//     );
//     if (picked != null && picked != _startDate) {
//       setState(() {
//         _startDate = picked;
//       });
//     }
//   }

//   Future<void> _selectEndDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _endDate ?? _startDate ?? DateTime.now(),
//       firstDate: _startDate ?? DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//     );
//     if (picked != null && picked != _endDate) {
//       setState(() {
//         _endDate = picked;
//       });
//     }
//   }

//   Future<void> _saveItem() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         await Future.delayed(const Duration(seconds: 1));

//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Item saved successfully!')),
//           );
//           Navigator.of(context).pop();
//         }
//       } catch (e) {
//         if (mounted) {
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text('Error saving item: $e')));
//         }
//       } finally {
//         if (mounted) {
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add New Item'),
//         actions: [
//           TextButton(
//             onPressed: _isLoading ? null : _saveItem,
//             child: Text(
//               'Save',
//               style: TextStyle(color: _isLoading ? Colors.grey : Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               CustomTextField(
//                 label: 'Title',
//                 hint: 'Enter item title',
//                 controller: _titleController,
//                 validator: (value) =>
//                     Validators.validateRequired(value, 'Title'),
//               ),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 label: 'Description',
//                 hint: 'Enter item description',
//                 controller: _descriptionController,
//                 validator: (value) =>
//                     Validators.validateRequired(value, 'Description'),
//               ),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 label: 'Price',
//                 hint: 'Enter price',
//                 controller: _priceController,
//                 validator: Validators.validatePrice,
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 label: 'Location',
//                 hint: 'Enter location',
//                 controller: _locationController,
//                 validator: (value) =>
//                     Validators.validateRequired(value, 'Location'),
//               ),
//               const SizedBox(height: 20),
//               ListTile(
//                 title: const Text('Start Date'),
//                 subtitle: Text(
//                   _startDate != null
//                       ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
//                       : 'Select start date',
//                 ),
//                 trailing: const Icon(Icons.calendar_today),
//                 onTap: () => _selectStartDate(context),
//               ),
//               ListTile(
//                 title: const Text('End Date'),
//                 subtitle: Text(
//                   _endDate != null
//                       ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
//                       : 'Select end date',
//                 ),
//                 trailing: const Icon(Icons.calendar_today),
//                 onTap: () => _selectEndDate(context),
//               ),
//               const SizedBox(height: 40),
//               CustomButton(
//                 text: 'Add Item',
//                 onPressed: _saveItem,
//                 isLoading: _isLoading,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
