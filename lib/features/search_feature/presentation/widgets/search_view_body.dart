import 'package:flutter/material.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/generated/l10n.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomTextFormField(
                prefixIcon: Icons.search_outlined,
                onPressed: () {},
                suffixIcon: Icons.tune_outlined,
                hintText: S.of(context).searchForHome,
              ),
          )
        ],
      ),
    );
  }
}