import 'package:flutter/material.dart';
import 'package:souq_app/core/components/custom_text_span.dart';
import 'package:souq_app/generated/l10n.dart';

Widget buildAgreementCheckbox(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          value: true,
          onChanged: (bool? value) {},
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