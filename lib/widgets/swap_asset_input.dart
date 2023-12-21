import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomo_ui_kit/components/input/textInput/nomo_input.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swapping_webon/widgets/select_asset.dart';

const _kExpand = Duration(milliseconds: 300);

class SwapAssetInput extends StatelessWidget {
  final bool showBottomInfo;
  final Widget? inputActions;

  const SwapAssetInput(
      {super.key, required this.showBottomInfo, this.inputActions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NomoInput(
          selectedBorder: Border.all(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: _kBorderRadius(showBottomInfo),
          margin: const EdgeInsets.all(0),
          background: context.theme.colors.background2,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          maxLines: 1,
          style: context.theme.typography.b3,
          placeHolderStyle: context.theme.typography.b3,
          leading: const SelectAsset(),
          textAlign: TextAlign.end,
          padding: const EdgeInsets.only(
            left: 4,
            right: 12,
            top: 12,
            bottom: 12,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+([.,]\d{0,4})?')),
          ],
        ),
        if (showBottomInfo)
          AnimatedContainer(
            height: showBottomInfo ? 32 : 0,
            duration: _kExpand,
            decoration: BoxDecoration(
              color: context.theme.colors.background2,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 12,
            ),
            child: AnimatedOpacity(
              opacity: showBottomInfo ? 1 : 0,
              duration: _kExpand,
              child: inputActions,
            ),
          ),
      ],
    );
  }

  BorderRadiusGeometry _kBorderRadius(bool showBottomInfo) {
    if (showBottomInfo) {
      return const BorderRadius.vertical(
        top: Radius.circular(12),
      );
    }

    return const BorderRadius.vertical(
      top: Radius.circular(12),
      bottom: Radius.circular(12),
    );
  }
}
