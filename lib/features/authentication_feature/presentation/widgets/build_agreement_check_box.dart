import 'package:flutter/material.dart';
import 'package:souq_app/core/components/custom_text_span.dart';
import 'package:souq_app/generated/l10n.dart';

class BuildAgreementCheckbox extends StatelessWidget {
  final bool? value;
  final void Function(bool?)? onChanged;
  const BuildAgreementCheckbox({super.key, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: CustomTxtSpan(
            onRegisterTap: () {},
            textOne: S.of(context).appRulesCheckBox,
            textTwo: S.of(context).appRulesNote,
          ),
        ),
      ],
    );
  }
}
