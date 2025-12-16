
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors_resources.dart';

class GlobalText extends StatelessWidget {
  final String str;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;
  final double? height;
  final String? fontFamily;
  final bool isUpperCase;

  const GlobalText({
    super.key,
    required this.str,
    this.fontWeight,
    this.fontSize,
    this.fontStyle,
    this.color,
    this.letterSpacing,
    this.decoration,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.height,
    this.fontFamily,
    this.isUpperCase = false,
  });

  @override
  Widget build(BuildContext context) {
    final h = height ?? 1.0;
    final fw = fontSize ?? 14;
    final double? fontHeight = height != null ? h : null;

    return Text(
      isUpperCase ? str.toUpperCase() : str,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap,
      style: GoogleFonts.inter(
        color: color ?? ColorRes.appTextColor,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterSpacing ?? 0,
        decoration: decoration ?? TextDecoration.none,
        height: fontHeight,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}

// Predefined text styles for consistent usage
class AppTextStyles {
  // Heading styles
  static TextStyle heading1({Color? color}) => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: color ?? ColorRes.appTextColor,
    letterSpacing: 0,
    height: 1.2,
  );

  static TextStyle heading2({Color? color}) => GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: color ?? ColorRes.appTextColor,
    letterSpacing: 0,
    height: 1.2,
  );

  static TextStyle heading3({Color? color}) => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.appTextColor,
    letterSpacing: 0,
    height: 1.3,
  );

  static TextStyle heading4({Color? color}) => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.appTextColor,
    letterSpacing: 0,
    height: 1.4,
  );

  // Subtitle styles
  static TextStyle subtitle1({Color? color}) => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.appTextColor,
    letterSpacing: 0,
    height: 1.5,
  );

  static TextStyle subtitle2({Color? color}) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.textSecondary,
    letterSpacing: 0,
    height: 1.5,
  );

  // Body text styles
  static TextStyle bodyLarge({Color? color}) => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color ?? ColorRes.appTextColor,
    letterSpacing: 0,
    height: 1.5,
  );

  static TextStyle bodyMedium({Color? color}) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color ?? ColorRes.appTextColor,
    letterSpacing: 0,
    height: 1.5,
  );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color ?? ColorRes.textSecondary,
    letterSpacing: 0,
    height: 1.5,
  );

  // Caption and label styles
  static TextStyle caption({Color? color}) => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color ?? ColorRes.textTertiary,
    letterSpacing: 0,
    height: 1.4,
  );

  static TextStyle label({Color? color}) => GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: color ?? ColorRes.textSecondary,
    letterSpacing: 0.5,
    height: 1.4,
  );

  // Button text style
  static TextStyle button({Color? color}) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.white,
    letterSpacing: 0.5,
    height: 1.0,
  );

  // Link style
  static TextStyle link({Color? color}) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.appColor,
    letterSpacing: 0,
    height: 1.5,
    decoration: TextDecoration.underline,
  );

  // App specific styles (matching your design)
  static TextStyle appTitle({Color? color}) => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.white,
    letterSpacing: 0,
    height: 1.0,
  );

  static TextStyle appSubtitle({Color? color}) => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.white,
    letterSpacing: 0,
    height: 1.4,
  );
}

// Helper widget for common text patterns
class AppText {
  // Heading text
  static Widget h1(String text, {Color? color, TextAlign? textAlign}) => GlobalText(
    str: text,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: color ?? ColorRes.appTextColor,
    textAlign: textAlign,
    height: 1.2,
  );

  static Widget h2(String text, {Color? color, TextAlign? textAlign}) => GlobalText(
    str: text,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: color ?? ColorRes.appTextColor,
    textAlign: textAlign,
    height: 1.2,
  );

  static Widget h3(String text, {Color? color, TextAlign? textAlign}) => GlobalText(
    str: text,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.appTextColor,
    textAlign: textAlign,
    height: 1.3,
  );

  // Body text
  static Widget body(String text, {Color? color, TextAlign? textAlign, int? maxLines}) => GlobalText(
    str: text,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color ?? ColorRes.appTextColor,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
  );

  static Widget bodyLarge(String text, {Color? color, TextAlign? textAlign, int? maxLines}) => GlobalText(
    str: text,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color ?? ColorRes.appTextColor,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
  );

  static Widget bodySmall(String text, {Color? color, TextAlign? textAlign, int? maxLines}) => GlobalText(
    str: text,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color ?? ColorRes.textSecondary,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
  );

  // Caption and hint
  static Widget caption(String text, {Color? color, TextAlign? textAlign}) => GlobalText(
    str: text,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color ?? ColorRes.textTertiary,
    textAlign: textAlign,
  );

  static Widget hint(String text, {Color? color, TextAlign? textAlign}) => GlobalText(
    str: text,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color ?? ColorRes.textHint,
    textAlign: textAlign,
  );

  // Button text
  static Widget button(String text, {Color? color}) => GlobalText(
    str: text,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.white,
    letterSpacing: 0.5,
  );

  // Link text
  static Widget link(String text, {Color? color, TextAlign? textAlign}) => GlobalText(
    str: text,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? ColorRes.appColor,
    textAlign: textAlign,
    decoration: TextDecoration.underline,
  );
}