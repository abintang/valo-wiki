import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';
import 'package:transparent_image/transparent_image.dart';

class TextComponent extends StatelessWidget {
  final String componentCategory;
  final String componentValue;
  final bool hasIcon;
  final String? urlIcon;

  const TextComponent(
      {super.key,
      required this.componentCategory,
      required this.componentValue,
      required this.hasIcon,
      this.urlIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h, left: 8.w, right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$componentCategory:",
            style: TextStyle(color: AppColors.redValorant, fontSize: 16.sp),
          ),
          Row(
            children: [
              (hasIcon)
                  ? Padding(
                      padding: EdgeInsets.only(right: 2.w),
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: urlIcon!,
                          width: 5.w))
                  : const SizedBox(),
              Text(
                componentValue,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      margin: EdgeInsets.only(bottom: 1.h, left: 8.w, right: 8.w),
      decoration: const BoxDecoration(color: Colors.white),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String descValue;
  final bool hasLeftRightMargin;
  final double fontSize;
  const DescriptionText(
      {super.key,
      required this.descValue,
      required this.hasLeftRightMargin,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (hasLeftRightMargin)
          ? EdgeInsets.only(bottom: 1.h, left: 8.w, right: 8.w)
          : EdgeInsets.only(bottom: 1.h),
      child: RichText(
          text: TextSpan(
              text: "${AppStrings.textDescription}: ",
              style: TextStyle(
                  color: AppColors.redValorant,
                  fontSize: fontSize.sp,
                  fontFamily: "BowlbyOneSC"),
              children: [
            TextSpan(
                text: descValue,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize.sp,
                    fontFamily: "BowlbyOneSC"))
          ])),
    );
  }
}

class AbilitiesSection extends StatelessWidget {
  final String abilitiesSlot;
  final String abilitiesName;
  final String urlIconAbilities;
  final String abilitiesDescription;

  const AbilitiesSection(
      {super.key,
      required this.abilitiesSlot,
      required this.abilitiesName,
      required this.urlIconAbilities,
      required this.abilitiesDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      padding: EdgeInsets.all(4.w),
      margin: EdgeInsets.only(
        right: 1.h,
      ),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.redValorant, width: 0.2.w),
          borderRadius: BorderRadius.circular(2.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            abilitiesSlot,
            style: TextStyle(color: AppColors.redValorant, fontSize: 16.sp),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: urlIconAbilities,
                  width: 10.w,
                  fit: BoxFit.cover),
              SizedBox(
                width: 3.w,
              ),
              Text(
                abilitiesName,
                style: TextStyle(color: AppColors.redValorant, fontSize: 16.sp),
              )
            ],
          ),
          SizedBox(height: 2.h),
          DescriptionText(
            descValue: abilitiesDescription,
            hasLeftRightMargin: false,
            fontSize: 14,
          )
        ],
      ),
    );
  }
}

int hexToInteger(String hex) => int.parse(hex, radix: 16);

class StrokeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Color strokeColor;
  final double strokeWidth;

  const StrokeText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      required this.strokeColor,
      required this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: fontSize.sp,
            foreground: Paint()
              ..strokeWidth = strokeWidth
              ..color = strokeColor
              ..style = PaintingStyle.stroke,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize.sp,
            foreground: Paint()..color = color,
          ),
        ),
      ],
    );
  }
}

class MapsContainer extends StatelessWidget {
  final String urlSplashImage;
  final String titleMap;
  final String descMap;
  final bool isEven;
  final String number;
  const MapsContainer(
      {super.key,
      required this.urlSplashImage,
      required this.titleMap,
      required this.descMap,
      required this.isEven,
      required this.number});

  @override
  Widget build(BuildContext context) {
    if (isEven) {
      return Container(
        margin: EdgeInsets.only(bottom: 2.h),
        width: double.infinity,
        height: 18.h,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0.5, 0),
              child: SizedBox(
                width: 4.w,
                height: 4.w,
                child: const CircularProgressIndicator(
                  color: AppColors.redValorant,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(1, -1),
              child: FadeInImage.memoryNetwork(
                  width: 50.w,
                  height: 15.h,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: urlSplashImage),
            ),
            Align(
              alignment: const Alignment(-1, 0.1),
              child: Container(
                width: 40.w,
                height: 14.h,
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleMap,
                      style: TextStyle(color: Colors.white, fontSize: 17.sp),
                    ),
                    SizedBox(
                      width: 38.w,
                      child: Text(
                        descMap,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 10.sp,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-1, -0.85),
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  number,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: 2.h),
        width: double.infinity,
        height: 18.h,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(-0.5, 0),
              child: SizedBox(
                width: 4.w,
                height: 4.w,
                child: const CircularProgressIndicator(
                  color: AppColors.redValorant,
                ),
              ),
            ),
            FadeInImage.memoryNetwork(
                width: 50.w,
                height: 15.h,
                fit: BoxFit.cover,
                placeholder: kTransparentImage,
                image: urlSplashImage),
            Align(
                alignment: const Alignment(1, 0.25),
                child: Container(
                  width: 40.w,
                  height: 14.h,
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleMap,
                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                      ),
                      SizedBox(
                        width: 38.w,
                        child: Text(
                          descMap,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 10.sp,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                )),
            Align(
              alignment: const Alignment(0.1, -0.85),
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  number,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
