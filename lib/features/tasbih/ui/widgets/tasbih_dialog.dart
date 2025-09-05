import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/tasbih/tasbih_database.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/my_text_form_field.dart';
import 'package:noor/features/tasbih/logic/tasbih_cubit.dart';

import '../../../../generated/l10n.dart';

class TasbihDialog extends StatefulWidget {
  final Tasbih? tasbih;
  const TasbihDialog({super.key, this.tasbih});

  @override
  State<TasbihDialog> createState() => _TasbihDialogState();
}

class _TasbihDialogState extends State<TasbihDialog> {
  late final TasbihCubit _tasbihCubit = context.read();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController zekrController = TextEditingController();
  final TextEditingController countController = TextEditingController();
  bool isSaving = false;
  bool isAlreadyAdded = false;

  @override
  void initState() {
    super.initState();
    if (widget.tasbih != null) {
      zekrController.text = widget.tasbih!.zekr;
      countController.text = widget.tasbih!.count.toString();
    }
  }

  @override
  void dispose() {
    zekrController.dispose();
    countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${widget.tasbih == null ? S.current.add : S.current.edit} ${S.current.tasbih}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextFormField(
                  maxLength: 30,
                  hintText: S.current.zekr,
                  controller: zekrController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.current.field_is_required;
                    }
                    if (isAlreadyAdded) {
                      return S.current.already_added;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                MyTextFormField(
                  maxLength: 10,
                  hintText: S.current.count_optional,
                  controller: countController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.primary,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            isAlreadyAdded = false;
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isSaving = true;
                              });
                              final int result;
                              final Tasbih tasbih = Tasbih(
                                zekr: zekrController.text,
                                count: countController.text.isEmpty
                                    ? 0
                                    : int.parse(countController.text),
                              );
                              if (widget.tasbih == null) {
                                result = await _tasbihCubit.insertTasbih(
                                  tasbih,
                                );
                              } else {
                                result = await _tasbihCubit.updateTasbih(
                                  widget.tasbih!.zekr,
                                  tasbih,
                                );
                              }
                              if (result > 0) {
                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
                              } else {
                                setState(() {
                                  isSaving = false;
                                  isAlreadyAdded = true;
                                  formKey.currentState!.validate();
                                });
                              }
                            }
                          },
                          child: isSaving
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "${widget.tasbih == null ? S.current.add : S.current.edit} ${S.current.the_tasbih}",
                                  style: const TextStyle(
                                    fontWeight: FontWeightHelper.bold,
                                    fontSize: 15,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            S.current.cancel,
                            style: const TextStyle(
                              fontWeight: FontWeightHelper.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
