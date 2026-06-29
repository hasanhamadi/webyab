import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webyab/web/bloc/web_bloc.dart';
import 'package:webyab/web/bloc/web_event.dart';
import 'package:webyab/web/bloc/web_state.dart';
import 'package:webyab/web/web_card.dart';

import 'package:webyab/web/web_repository.dart';

class WebsiteListWidget extends StatelessWidget {
  const WebsiteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WebBloc(WebRepository())..add(GetWebEvent()),
      child: BlocBuilder<WebBloc, WebState>(
        builder: (context, state) {
          if (state is WebLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WebError) {
            return Center(child: Text(state.message));
          }

          if (state is WebLoaded) {
            if (state.websites.isEmpty) {
              return const Center(child: Text("وب‌سایتی یافت نشد"));
            }

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 1),
              itemCount: state.websites.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 189, // عرض هر کارت
                  child: WebCard(web: state.websites[index]),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
