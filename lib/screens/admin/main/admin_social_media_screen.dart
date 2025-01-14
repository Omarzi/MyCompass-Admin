import 'package:flutter/material.dart';
import 'package:mycompass_admin_website/controllers/menu_app_controller.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/core/helper_functions/build_formated_date.dart';
import 'package:mycompass_admin_website/core/responsive.dart';
import 'package:mycompass_admin_website/routes/routes_name.dart';
import 'package:provider/provider.dart';

class AdminSocialMediaScreen extends StatefulWidget {
  const AdminSocialMediaScreen({super.key});

  @override
  State<AdminSocialMediaScreen> createState() => _AdminSocialMediaScreenState();
}

class _AdminSocialMediaScreenState extends State<AdminSocialMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!Responsive.isDesktop(context))
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: context.read<MenuAppController>().contractorOfficerControlMenu,
                    ),

                    Text(
                      "التواصل الأجتماعي",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              if (!Responsive.isMobile(context))
                Text(
                  "التواصل الأجتماعي",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              const SizedBox(height: defaultPadding),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "التواصل الأجتماعي",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding /
                            (Responsive.isMobile(context) ? 2 : 1),
                      ),
                    ),
                    onPressed: () {
                      print('Create');

                      /// Todo: navigate to add new announcement screen
                      Navigator.pushNamed(
                          context, RoutesName.adminAddNewPost);
                    },
                    icon: const Icon(Icons.add),
                    label: Text("إضافة منشور",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              ),


              const SizedBox(height: defaultPadding),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: posts.length,
              //   itemBuilder: (context, index) {
              //     return Card(
              //       margin: const EdgeInsets.only(bottom: defaultPadding),
              //       color: bgColor.withOpacity(.5), // لون الخلفية
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(defaultPadding),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   posts[index]['sender'],
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .bodyMedium!
              //                       .copyWith(fontWeight: FontWeight.bold),
              //                 ),
              //                 Text(
              //                   buildDateFormat()
              //                       .format(posts[index]['timestamp']),
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .bodySmall!
              //                       .copyWith(color: Colors.grey),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(height: defaultPadding / 2),
              //             Text(
              //               posts[index]['content'],
              //               style: Theme.of(context).textTheme.bodyLarge,
              //             ),
              //             const SizedBox(height: defaultPadding / 2),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Row(
              //                   children: [
              //                     IconButton(
              //                       onPressed: () => _toggleReact(index),
              //                       icon: Icon(
              //                         posts[index]['reacted']
              //                             ? Icons.favorite
              //                             : Icons.favorite_border,
              //                         color: posts[index]['reacted']
              //                             ? Colors.red
              //                             : Colors.grey,
              //                       ),
              //                     ),
              //                     const SizedBox(width: 8),
              //                     Text(
              //                       "أعجبني",
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyMedium!
              //                           .copyWith(
              //                         color: Colors.grey,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 TextButton(
              //                   onPressed: () => _showCommentsDialog(index),
              //                   child: const Text("تعليقات"),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: defaultPadding),
                    color: bgColor.withOpacity(.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                posts[index]['sender'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                buildDateFormat().format(posts[index]['timestamp']),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding / 2),
                          Text(
                            posts[index]['content'],
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: defaultPadding / 2),

                          // عرض آخر تعليق فقط
                          if (posts[index]['comments'].isNotEmpty) ...[
                            const Divider(),
                            Text(
                              posts[index]['comments'].last,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],

                          const SizedBox(height: defaultPadding / 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => _toggleReact(index),
                                    icon: Icon(
                                      posts[index]['reacted']
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: posts[index]['reacted']
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "أعجبني",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () => _showCommentsDialog(index),
                                child: const Text("تعليقات"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> posts = [
    {
      'sender': 'أحمد علي',
      'content': 'هذا هو المنشور الأول في الصفحة',
      'comments': ['تعليق على المنشور الأول'],
      'reacted': false,
      'timestamp': DateTime.now().subtract(const Duration(minutes: 10)),
    },
    {
      'sender': 'منى محمد',
      'content': 'هذا هو المنشور الثاني في الصفحة',
      'comments': ['تعليق على المنشور الثاني'],
      'reacted': false,
      'timestamp': DateTime.now().subtract(const Duration(hours: 1)),
    },
    {
      'sender': 'أحمد علي',
      'content': 'هذا هو المنشور الأول في الصفحة',
      'comments': ['تعليق على المنشور الأول'],
      'reacted': false,
      'timestamp': DateTime.now().subtract(const Duration(minutes: 10)),
    },
    {
      'sender': 'منى محمد',
      'content': 'هذا هو المنشور الثاني في الصفحة',
      'comments': ['تعليق على المنشور الثاني'],
      'reacted': false,
      'timestamp': DateTime.now().subtract(const Duration(hours: 1)),
    },
    {
      'sender': 'أحمد علي',
      'content': 'هذا هو المنشور الأول في الصفحة',
      'comments': ['تعليق على المنشور الأول'],
      'reacted': false,
      'timestamp': DateTime.now().subtract(const Duration(minutes: 10)),
    },
    {
      'sender': 'منى محمد',
      'content': 'هذا هو المنشور الثاني في الصفحة',
      'comments': ['تعليق على المنشور الثاني'],
      'reacted': false,
      'timestamp': DateTime.now().subtract(const Duration(hours: 1)),
    },
  ];

  final TextEditingController _commentController = TextEditingController();

  void _toggleReact(int index) {
    setState(() {
      posts[index]['reacted'] = !posts[index]['reacted'];
    });
  }

  void _showCommentsDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              color: Colors.black.withOpacity(0.3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "التعليقات",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: defaultPadding),
                  ...posts[index]['comments'].map<Widget>((comment) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            comment,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () => _replyToComment(index, comment),
                            child: const Text(
                              "رد",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  const Divider(color: Colors.white),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          decoration: InputDecoration(
                            hintText: "أضف تعليقًا...",
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        onPressed: () => _addComment(index),
                        icon: const Icon(Icons.send, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _addComment(int index) {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        posts[index]['comments'].add(_commentController.text);
        _commentController.clear();
      });
      Navigator.pop(context);
    }
  }

  void _replyToComment(int postIndex, String comment) {
    // Function to handle reply to a specific comment
    print("Replying to: $comment in post $postIndex");
  }
}
