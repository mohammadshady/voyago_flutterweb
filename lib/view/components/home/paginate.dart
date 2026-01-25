import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/manage_citites_controller.dart';
import '../../../controller/home/paginate_controller.dart';

class PaginationWidget<T extends PaginationController> extends StatelessWidget {
  final  T controller;
  const PaginationWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(builder: (controller){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Showing ${controller.start + 1} to ${controller.end} of ${controller.totalRows} entries'),
          Container(
            color: Colors.grey[100],
            height: 36, // full row height
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // First page
                IconButton(
                  onPressed: (){
                    if(controller.currentPage > 1){
                      controller.changeCurrentPage(1);
                      //controller.fetchPage(1);
                    }

                  },
                  icon: const Icon(Icons.first_page),
                  color: controller.currentPage > 1 ? Colors.blue : Colors.grey,
                  splashRadius: 20,
                  constraints: const BoxConstraints(),
                ),

                Container(width: 1, height: 36, color: Colors.grey[300]),

                // Previous page
                IconButton(
                  onPressed: (){
                    int page = controller.currentPage - 1;
                    if(controller.currentPage > 1){
                      controller.changeCurrentPage(page);
                      //controller.fetchPage(page);
                    }

                  },
                  icon: const Icon(Icons.chevron_left),
                  color: controller.currentPage > 1 ? Colors.blue : Colors.grey,
                  splashRadius: 20,
                  constraints: const BoxConstraints(),
                ),

                Container(width: 1, height: 36, color: Colors.grey[300]),

                // Current page number full height
                Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text(
                    '${controller.currentPage}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

                Container(width: 1, height: 36, color: Colors.grey[300]),

                // Next page
                IconButton(
                  onPressed: (){
                    int page = controller.currentPage + 1;
                    if(controller.currentPage < controller.totalPages){
                      controller.changeCurrentPage(page);
                      //controller.fetchPage(page);
                    }

                  },
                  icon: const Icon(Icons.chevron_right),
                  color: controller.currentPage < controller.totalPages ? Colors.blue : Colors.grey,
                  splashRadius: 20,
                  constraints: const BoxConstraints(),
                ),

                Container(width: 1, height: 36, color: Colors.grey[300]),

                // Last page
                IconButton(
                  onPressed: (){
                    int page = controller.totalPages;
                    if(controller.currentPage < controller.totalPages){
                      controller.changeCurrentPage(page);
                      //controller.fetchPage(page);
                    }
                  },
                  icon: const Icon(Icons.last_page),
                  color: controller.currentPage < controller.totalPages ? Colors.blue : Colors.grey,
                  splashRadius: 20,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          )

        ],
      );
    });

  }
}
