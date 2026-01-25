import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/view/components/home/merchants_details/custom_checkbox_row.dart';
import 'package:web_project2/view/components/home/merchants_details/custom_row_item.dart';

class MerchantDetailsScreen extends StatelessWidget {
  const MerchantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'merchant_details'.tr,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const CustomRowItem(label1: 'name', value1: 'Fidaahamd', label2: 'english_name', value2: 'Enter English Name'),
            const SizedBox(height: 10),
            const CustomRowItem(label1: 'entity_type', value1: 'Trader Person', label2: 'merchant_status', value2: 'Active'),
            const SizedBox(height: 10),
            const CustomRowItem(label1: 'national_id', value1: '123456789', label2: 'commission_rate', value2: '5.00'),
            const SizedBox(height: 10),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 120),
                SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomCheckBoxRow(title: 'active', value: false,color: Colors.black,),
                      ),
                      Expanded(
                        child: CustomCheckBoxRow(title: 'is_licensed', value: false , color: Colors.red,)
                      ),
                      Expanded(
                        child: CustomCheckBoxRow(title: 'self_declaration_accepted', value: false , color: Colors.black,)
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const CustomRowItem(label1: 'subscription_fee', value1: '100.00', label2: 'arab_bank_ref', value2: 'f1c7aa40-af18-40d9-86f5-8a252e42c669'),
            const SizedBox(height: 10),
            const CustomRowItem(label1: 'public_code', value1: '222222', label2: 'iban', value2: 'PS11ARAB12345678901234567890'),
            const SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    'assigned_users'.tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: const Text('Fidaahmed',style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: const Text('1234567890',style:TextStyle(fontSize: 16)),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: const Text('Fidaahmed5@gmail.com',style: TextStyle(fontSize: 16),),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF32C5D2), // Button background color
                    foregroundColor: Colors.white, // Text & icon color
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  onPressed: () {},
                  child:  Row(
                    children: [
                      const Icon(Icons.lock, size: 15,),
                      const SizedBox(width: 5,),
                      Text('user_permission'.tr , style: const TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('assign_new_user'.tr,style:const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(width: 22,),
                SizedBox(
                  width: 500,
                  child: DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: '1', child: Text('Select')),
                    ],
                    onChanged: null, // disabled
                    decoration:  InputDecoration(
                      labelText: 'select'.tr,
                      border: const OutlineInputBorder(),
                      isDense: true, // makes it smaller
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), // vertically center icon
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: null, // 🚫 disabled
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),

                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return const Color(0xFF32C5D2).withOpacity(0.8); // 🟢 light green
                        }
                        return const Color(0xFF32C5D2); // 🟢 active
                      },
                    ),

                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.white.withOpacity(0.7);
                        }
                        return Colors.white;
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      const Icon(Icons.add, size: 15),
                      const SizedBox(width: 5),
                      Text('assign'.tr, style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 130), // ⬅ same label width
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    //elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child:  Text('cancel'.tr, style: const TextStyle(fontSize: 15)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}



