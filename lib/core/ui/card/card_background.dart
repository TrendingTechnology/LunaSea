import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:lunasea/core.dart';

// ignore: non_constant_identifier_names
Decoration LSCardBackground({ @required String uri, bool darken = false }) => BoxDecoration(
    image: DecorationImage(
        image: AdvancedNetworkImage(
            uri,
            useDiskCache: true,
            loadFailedCallback: () {},
            fallbackAssetImage: 'assets/images/colors/secondary.png',
            retryLimit: 1,
        ),
        colorFilter: ColorFilter.mode(LSColors.secondary.withOpacity(darken ? 0.10 : 0.20), BlendMode.dstATop),
        fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(4.0),
);
