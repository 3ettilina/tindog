/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:lottie/lottie.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/arrow_down.json
  LottieGenImage get arrowDown =>
      const LottieGenImage('assets/animations/arrow_down.json');

  /// File path: assets/animations/arrow_down_short.json
  LottieGenImage get arrowDownShort =>
      const LottieGenImage('assets/animations/arrow_down_short.json');

  /// File path: assets/animations/empty.json
  LottieGenImage get empty =>
      const LottieGenImage('assets/animations/empty.json');

  /// File path: assets/animations/error.json
  LottieGenImage get error =>
      const LottieGenImage('assets/animations/error.json');

  /// File path: assets/animations/success.json
  LottieGenImage get success =>
      const LottieGenImage('assets/animations/success.json');

  /// File path: assets/animations/walking_dog.json
  LottieGenImage get walkingDog =>
      const LottieGenImage('assets/animations/walking_dog.json');

  /// Directory path: assets/animations
  String get path => 'assets/animations';

  /// List of all assets
  List<LottieGenImage> get values =>
      [arrowDown, arrowDownShort, empty, error, success, walkingDog];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/apple_light.svg
  SvgGenImage get appleLight =>
      const SvgGenImage('assets/icons/apple_light.svg');

  /// File path: assets/icons/chats.svg
  SvgGenImage get chats => const SvgGenImage('assets/icons/chats.svg');

  /// File path: assets/icons/dog.svg
  SvgGenImage get dog => const SvgGenImage('assets/icons/dog.svg');

  /// File path: assets/icons/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/google.svg');

  /// File path: assets/icons/google_light.svg
  SvgGenImage get googleLight =>
      const SvgGenImage('assets/icons/google_light.svg');

  /// File path: assets/icons/paw.svg
  SvgGenImage get paw => const SvgGenImage('assets/icons/paw.svg');

  /// File path: assets/icons/send.svg
  SvgGenImage get send => const SvgGenImage('assets/icons/send.svg');

  /// Directory path: assets/icons
  String get path => 'assets/icons';

  /// List of all assets
  List<SvgGenImage> get values =>
      [appleLight, chats, dog, google, googleLight, paw, send];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/arrow_down.gif
  AssetGenImage get arrowDown =>
      const AssetGenImage('assets/images/arrow_down.gif');

  /// File path: assets/images/arrow_down_double.gif
  AssetGenImage get arrowDownDouble =>
      const AssetGenImage('assets/images/arrow_down_double.gif');

  /// File path: assets/images/arrow_down_small.gif
  AssetGenImage get arrowDownSmall =>
      const AssetGenImage('assets/images/arrow_down_small.gif');

  /// File path: assets/images/dog_girl_welcome.jpg
  AssetGenImage get dogGirlWelcome =>
      const AssetGenImage('assets/images/dog_girl_welcome.jpg');

  /// File path: assets/images/like.png
  AssetGenImage get like => const AssetGenImage('assets/images/like.png');

  /// File path: assets/images/loading_paw.gif
  AssetGenImage get loadingPaw =>
      const AssetGenImage('assets/images/loading_paw.gif');

  /// File path: assets/images/loading_paws.gif
  AssetGenImage get loadingPaws =>
      const AssetGenImage('assets/images/loading_paws.gif');

  /// File path: assets/images/nope.png
  AssetGenImage get nope => const AssetGenImage('assets/images/nope.png');

  /// File path: assets/images/onboarding_welcome.png
  AssetGenImage get onboardingWelcome =>
      const AssetGenImage('assets/images/onboarding_welcome.png');

  /// File path: assets/images/toro.jpeg
  AssetGenImage get toro => const AssetGenImage('assets/images/toro.jpeg');

  /// File path: assets/images/welcome_header.png
  AssetGenImage get welcomeHeader =>
      const AssetGenImage('assets/images/welcome_header.png');

  /// Directory path: assets/images
  String get path => 'assets/images';

  /// List of all assets
  List<AssetGenImage> get values => [
        arrowDown,
        arrowDownDouble,
        arrowDownSmall,
        dogGirlWelcome,
        like,
        loadingPaw,
        loadingPaws,
        nope,
        onboardingWelcome,
        toro,
        welcomeHeader
      ];
}

class Assets {
  Assets._();

  static const String package = 'app_ui';

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  static const String package = 'app_ui';

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/app_ui/$_assetName';
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  static const String package = 'app_ui';

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/app_ui/$_assetName';
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  static const String package = 'app_ui';

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/app_ui/$_assetName';
}
