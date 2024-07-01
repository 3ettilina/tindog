import 'package:app_ui/app_ui.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

enum _AppChoiceChipsType { single, multiple }

class AppChoiceChips<T> extends StatefulWidget {
  const AppChoiceChips.singleOption({
    required this.options,
    required Function(T selectedValue) onValueSelected,
    this.defaultSingleValue,
    this.direction = Axis.horizontal,
    super.key,
  })  : _type = _AppChoiceChipsType.single,
        _onSelect = onValueSelected,
        _onMultipleSelected = null,
        defaultMultipleValue = const [];

  const AppChoiceChips.multipleOption({
    required this.options,
    required Function(List<T> selectedValues) onMultipleSelected,
    this.defaultMultipleValue = const [],
    this.direction = Axis.horizontal,
    super.key,
  })  : _type = _AppChoiceChipsType.multiple,
        _onMultipleSelected = onMultipleSelected,
        _onSelect = null,
        defaultSingleValue = null;

  final _AppChoiceChipsType _type;
  final List<T> options;
  final T? defaultSingleValue;
  final List<T> defaultMultipleValue;
  final void Function(T selectedValue)? _onSelect;
  final void Function(List<T> selectedValues)? _onMultipleSelected;
  final Axis direction;

  @override
  State<AppChoiceChips> createState() => _AppChoiceChipsState<T>();
}

class _AppChoiceChipsState<T> extends State<AppChoiceChips<T>> {
  List<T> selected = [];

  @override
  void initState() {
    switch (widget._type) {
      case _AppChoiceChipsType.single:
        selected = (widget.defaultSingleValue != null)
            ? List.of(widget.defaultMultipleValue)
            : [];
        setState(() {});
      case _AppChoiceChipsType.multiple:
        selected = widget.defaultMultipleValue;
        setState(() {});
    }
    super.initState();
  }

  void onValueSelected(List<T> values) {
    switch (widget._type) {
      case _AppChoiceChipsType.single:
        selected = values;
        widget._onSelect!(values[0]);
        setState(() {});
      case _AppChoiceChipsType.multiple:
        selected = values;
        widget._onMultipleSelected!(values);
        setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget._type) {
      _AppChoiceChipsType.single => ChipsChoice<T>.single(
          value: selected.isNotEmpty ? selected[0] : null,
          onChanged: (value) => onValueSelected([value]),
          direction: widget.direction,
          choiceCheckmark: true,
          choiceItems: C2Choice.listFrom<T, T>(
            source: widget.options,
            value: (i, v) => v,
            label: (i, v) => v.toString(),
          ),
          choiceStyle: C2ChipStyle.filled(
            color: Colors.deepPurple.shade200,
            selectedStyle: C2ChipStyle(
              backgroundColor: context.theme.primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          wrapped: true,
          mainAxisSize: MainAxisSize.max,
        ),
      _AppChoiceChipsType.multiple => ChipsChoice<T>.multiple(
          value: selected,
          onChanged: onValueSelected,
          direction: widget.direction,
          choiceItems: C2Choice.listFrom<T, T>(
            source: widget.options,
            value: (i, v) => v,
            label: (i, v) => v.toString(),
          ),
          choiceStyle: C2ChipStyle.filled(
            color: Colors.deepPurple.shade200,
            selectedStyle: C2ChipStyle(
              backgroundColor: context.theme.primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          choiceCheckmark: true,
          wrapped: true,
        )
    };
  }
}
