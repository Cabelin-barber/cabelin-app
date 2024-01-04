import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/pages/profile/profile_controller.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ConfigOption {
  String title;
  String description;
  IconData icon;
  Function() onTap;

  ConfigOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap
  });
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    final userStorageRepository = GetIt.instance<UserStorageRepository>();
    final pageViewController = GetIt.instance<PageViewController>();

    List<ConfigOption> options = [
      ConfigOption(
        title: "Editar meu perfil",
        description: "Editar nome, número de celular, email e muito mais ",
        icon: Icons.edit_outlined,
        onTap: () {
          context.push("/editAccount");
        }
      ),
      ConfigOption(
        title: "Configurações",
        description: "Configurações do aplicativo",
        icon: Icons.settings_rounded,
        onTap: () {}
      ),
      ConfigOption(
        title: "Ajudas e sugestões",
        description: "Dúvidas, sugestões e criticas",
        icon: Icons.help_outline_rounded,
        onTap: () {}
      ),
      ConfigOption(
        title: "Favoritos",
        description: "Meus locais favoritos",
        icon: Icons.favorite_outline_rounded,
        onTap: () {}
      ),
      ConfigOption(
        title: "Sair",
        description: "Deixar o app (necessário fazer login posteriormente)",
        icon: Icons.logout_outlined,
        onTap: () async {
          try {
            await userStorageRepository.clearUser();
            pageViewController.pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear
            );
          } catch (e) {
            FeedbackSnackbar.error("Tivemos algum errinho, tente novamente");
          }
        }
      ),
    ];

    ProfileController profileController = ProfileController();
    
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          profileController.currentUser!.name,
          customFontsize: 22,
          customWeight: FontWeight.w800,
        ),
      ),
      body: SingleChildScrollView(
        child: LayoutWidget(
          child: ListWidget(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: options.length,
            itemBuilder: (_, index) => ListTile(
              onTap: options[index].onTap,
              leading: Icon(options[index].icon),
              trailing: const Icon(Icons.chevron_right_rounded),
              title: TextWidget(
                options[index].title,
                customWeight: FontWeight.w800,
              ),
              subtitle: TextWidget(
                options[index].description,
                customFontsize: 14,
              ),
            ),
          )
        ),
      ),
    );
  }
}