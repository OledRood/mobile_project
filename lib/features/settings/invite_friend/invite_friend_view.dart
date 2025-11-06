import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String promoCode = "asdfasdf-ad1561sdf-as3f-asdf";
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Приглоси друга получи промокод"),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    onPromoCodeTap();
                  },
                  child: Container(
                    // width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text(promoCode)),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    debugPrint('Share button pressed');
                    //Реализация шаринга промокода
                    //  final inviteLink = 'https://example.com/invite?code=$promoCode';
                    //   final shareText = 'Приглашаю в приложение!\nСсылка: $inviteLink\nПромокод: $promoCode';
                    //   Share.share(shareText);
                  },
                  child: Text("Поделиться"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void onPromoCodeTap() async {
  print('Promo code tapped');
  // await Clipboard.setData(ClipboardData(text: promoCode));
  // ScaffoldMessenger.of(
  //   context,
  // ).showSnackBar(const SnackBar(content: Text('Промокод скопирован')));
}
