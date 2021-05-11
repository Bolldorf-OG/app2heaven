/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../generated/l10n.dart';
import '../../widgets/navigation_drawer.dart';

class ListPage<T extends Object> extends StatefulWidget {
  final String title;
  final String iconPath;
  final String noItemsFound;
  final Stream<List<T>> dataStream;
  final Widget Function(BuildContext context, T data) itemBuilder;
  final Widget Function(BuildContext context, T data)? itemTitle;
  final Widget Function(BuildContext context, T data)? itemSubtitle;
  final FutureOr<void> Function()? onAdd;
  final FutureOr<void> Function(List<T> items)? onShare;
  final FutureOr<void> Function(List<T> items)? onDelete;

  ListPage({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.dataStream,
    required this.itemBuilder,
    required this.noItemsFound,
    this.onAdd,
    this.onShare,
    this.onDelete,
    this.itemTitle,
    this.itemSubtitle,
  }) : super(key: key) {
    assert((onShare == null && onDelete == null) || (itemTitle != null && itemSubtitle != null));
  }

  @override
  State<StatefulWidget> createState() => _ListPageState<T>();
}

class _ListPageState<T extends Object> extends State<ListPage<T>> {
  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((Duration duration) {
      if (widget.onShare != null || widget.onDelete != null) {
        FeatureDiscovery.discoverFeatures(
          context,
          <String>{
            if (widget.onShare != null) "share_many",
            if (widget.onDelete != null) "delete_many",
          },
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    var deleteMode = false;
    var shareMode = false;
    final checked = <int, T?>{};

    Widget? fab(StateSetter setState) {
      if (deleteMode) {
        return FloatingActionButton(
          tooltip: strings.delete,
          onPressed: () {
            widget.onDelete!(checked.values.whereType<T>().toList());
            setState(() {
              deleteMode = false;
            });
          },
          child: Icon(Icons.delete),
        );
      }

      if (shareMode) {
        return FloatingActionButton(
          tooltip: strings.share,
          onPressed: () {
            widget.onShare!(checked.values.whereType<T>().toList());
            setState(() {
              shareMode = false;
            });
          },
          child: Icon(Icons.share),
        );
      }

      if (widget.onAdd != null) {
        return FloatingActionButton(
          tooltip: strings.add,
          onPressed: widget.onAdd,
          child: Icon(Icons.add),
        );
      }

      return null;
    }

    List<Widget> actions(StateSetter setState) {
      if (deleteMode || shareMode) {
        return [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () => setState(() {
              deleteMode = false;
              shareMode = false;
            }),
          ),
        ];
      }

      if (widget.onShare == null && widget.onDelete == null) {
        return [];
      }

      final deleteButton = DescribedFeatureOverlay(
        featureId: "delete_many",
        tapTarget: const Icon(Icons.delete),
        description: Text(strings.description_delete_many),
        onDismiss: () async {
          Future.delayed(Duration(milliseconds: 100), () => FeatureDiscovery.completeCurrentStep(context));
          return false;
        },
        onComplete: () async => true,
        child: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              deleteMode = true;
            });
          },
        ),
      );

      if (widget.onShare == null) {
        return [deleteButton];
      }

      final shareButton = DescribedFeatureOverlay(
        featureId: "share_many",
        tapTarget: const Icon(Icons.share),
        description: Text(strings.description_share_many),
        onDismiss: () async {
          Future.delayed(Duration(milliseconds: 100), () => FeatureDiscovery.completeCurrentStep(context));
          return false;
        },
        onComplete: () async => true,
        child: IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            setState(() {
              shareMode = true;
            });
          },
        ),
      );

      if (widget.onShare == null) {
        return [shareButton];
      }

      return [shareButton, deleteButton];
    }

    return StatefulBuilder(
      builder: (context, setState) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: NavigationBottomAppBar(
          actions: actions(setState),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 16),
                child: Image.asset(
                  widget.iconPath,
                  height: 64,
                  width: 64,
                ),
              ),
              Expanded(
                child: StreamBuilder<List<T?>>(
                  initialData: const [],
                  stream: widget.dataStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }

                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.data!.isEmpty) {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(
                              widget.noItemsFound,
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        return ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => AnimatedSwitcher(
                            duration: Duration(milliseconds: 100),
                            child: deleteMode || shareMode
                                ? CheckboxListTile(
                                    value: checked[index] != null,
                                    selected: checked[index] != null,
                                    onChanged: (value) {
                                      setState(() {
                                        checked[index] = value! ? snapshot.data![index] : null;
                                      });
                                    },
                                    title: Builder(
                                      builder: (context) => DefaultTextStyle(
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(color: DefaultTextStyle.of(context).style.color),
                                        child: widget.itemTitle!(context, snapshot.data![index]!),
                                      ),
                                    ),
                                    subtitle: widget.itemSubtitle!(context, snapshot.data![index]!),
                                  )
                                : widget.itemBuilder(context, snapshot.data![index]!),
                          ),
                          separatorBuilder: (context, index) => Divider(color: Colors.grey),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: fab(setState),
      ),
    );
  }
}
