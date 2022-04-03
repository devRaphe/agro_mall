import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.getUser(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Visibility(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
              visible: model.isBusy,
              replacement: model.posts.isEmpty
                  ? const Center(
                      child: Text(
                        'No data, pls check your internet connection',
                      ),
                    )
                  : ListView.builder(
                      itemCount: model.posts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          model.posts[index].avatar!.thumbnail
                                              .toString(),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        model.posts[index].name.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    model.posts[index].company!.catchPhrase
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(model.posts[index].website.toString()),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(model.posts[index].email.toString()),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(model.posts[index].address!.city
                                      .toString()),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Divider(thickness: 1.5),
                            )
                          ],
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
