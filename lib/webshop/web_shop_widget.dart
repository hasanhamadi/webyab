import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webyab/webshop/bloc/webshop_bloc.dart';
import 'package:webyab/webshop/bloc/webshop_state.dart';
import 'package:webyab/webshop/web_shop_card.dart';

class WebShopWidget extends StatelessWidget {
  const WebShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Row(
                children: [
                  Text(
                    'سایت های فروشگاهی',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF0D1B2A),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              GestureDetector(
                onTap: () {
                  // TODO
                },
                child: const Text(
                  'مشاهده همه',
                  style: TextStyle(
                    color: Color(0xFF453EFA),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 270,
          child: BlocBuilder<WebShopBloc, WebShopState>(
            builder: (context, state) {
              if (state is WebShopLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is WebShopError) {
                return Center(child: Text(state.message));
              }

              if (state is WebShopLoaded) {
                if (state.websites.isEmpty) {
                  return const Center(child: Text("اطلاعاتی وجود ندارد"));
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  itemCount: state.websites.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 189,
                      child: WebShopCard(shop: state.websites[index]),
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
