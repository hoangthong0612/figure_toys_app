import 'package:figure_toys/controllers/sale_order/sale_order_cubit.dart';
import 'package:figure_toys/models/sale_order.dart';
import 'package:figure_toys/views/components/load_data_builder.dart';
import 'package:flutter/material.dart';

class SaleOrderPage extends StatefulWidget {
  const SaleOrderPage({super.key});

  @override
  State<SaleOrderPage> createState() => _SaleOrderPageState();
}

class _SaleOrderPageState extends State<SaleOrderPage> {
  final _cubit = SaleOrderCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoadDataBuilder<SaleOrderCubit, SaleOrderState>(
      builder: (state) {
        final List<SaleOrder> saleOrders = state.data ?? [];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Danh sách đơn hàng"),
            SizedBox(height: 12,),
            Expanded(
              child: ListView.builder(
                itemCount: saleOrders.length,
                itemBuilder: (context, index) {
                  final SaleOrder saleOrder = saleOrders[index];
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 1,
                              offset: Offset(1, 2), // Shadow position
                            ),

                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white
                        ),
                        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                        child: Row(
                          children: [
                            Text(saleOrder.name ?? ''),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,)
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
      cubit: _cubit,
      state: _cubit.getSaleOrder(),
    );
  }
}
