import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:valorant_wiki/ui/widgets/side_components.dart';

class BorderButton extends StatelessWidget {
  final String textButton;
  final String imageButtonName;
  final VoidCallback onTap;

  const BorderButton(
      {super.key,
      required this.textButton,
      required this.imageButtonName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 17.h,
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: AppColors.redValorant,
            width: 0.2.w,
          ),
          borderRadius: BorderRadius.circular(1.w)),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(1.w),
        child: InkWell(
          onTap: onTap,
          splashColor: AppColors.redValorant,
          borderRadius: BorderRadius.circular(1.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 10.w,
                child: SizedBox(
                  width: 30.5.w,
                  child: Text(
                    textButton,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Image(
                  image: AssetImage("assets/images/$imageButtonName"),
                  width: 38.w,
                  height: 17.h,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonListOfAgents extends StatelessWidget {
  final String textAgents;
  final String urlButtonImage;
  final String textRole;
  final String codeName;
  final String urlRoleImage;
  final Color backgroundButtonColor;
  final VoidCallback onTap;

  const ButtonListOfAgents(
      {super.key,
      required this.textAgents,
      required this.urlButtonImage,
      required this.textRole,
      required this.codeName,
      required this.urlRoleImage,
      required this.backgroundButtonColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 40.w,
        height: 25.h,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0.2, 0),
              child: Container(
                width: 38.w,
                height: 21.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.2, 1],
                    colors: [
                      backgroundButtonColor,
                      Colors.black.withOpacity(0.5)
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (int i = 0; i < 2; i++)
                        StrokeText(
                            text: (i == 0) ? textAgents : codeName,
                            fontSize: 19,
                            color: Colors.transparent,
                            strokeColor: Colors.white.withOpacity(0.25),
                            strokeWidth: 0.8)
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-1, 1),
              child: FadeInImage.memoryNetwork(
                  width: 25.w,
                  height: 25.h,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: urlButtonImage),
            ),
            Align(
              alignment: const Alignment(0.7, 0.6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    textAgents,
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                  Text(
                    textRole,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: urlRoleImage,
                      width: 3.5.w)
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: SizedBox(
                width: 38.w,
                height: 21.h,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(3.w),
                  child: InkWell(
                    splashColor: backgroundButtonColor,
                    borderRadius: BorderRadius.circular(3.w),
                    onTap: onTap,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BorderButtonWithTitle extends StatelessWidget {
  final String urlImageButton;
  final String titleButton;
  final double sizeButton;
  final double sizeTitle;
  final VoidCallback onTap;

  const BorderButtonWithTitle(
      {super.key,
      required this.urlImageButton,
      required this.titleButton,
      required this.sizeButton,
      required this.sizeTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.redValorant, width: 0.2.w),
          borderRadius: BorderRadius.circular(1.w)),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(1.w),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(1.w),
          splashColor: AppColors.redValorant,
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(2.w),
                  child: FadeInImage.memoryNetwork(
                    image: urlImageButton,
                    placeholder: kTransparentImage,
                    width: sizeButton.w,
                    height: 8.h,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.redValorant,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(1.w),
                          bottomRight: Radius.circular(1.w))),
                  padding: EdgeInsets.only(left: 1.w),
                  width: 40.w,
                  child: Text(
                    titleButton,
                    style:
                        TextStyle(color: Colors.white, fontSize: sizeTitle.sp),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BorderButtonOnlyImage extends StatelessWidget {
  final String urlImageButton;
  final VoidCallback onTap;

  const BorderButtonOnlyImage(
      {super.key, required this.urlImageButton, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.redValorant, width: 0.2.w),
          borderRadius: BorderRadius.circular(1.w)),
      child: Stack(children: [
        Align(
          alignment: const Alignment(0, 0),
          child: Padding(
            padding: EdgeInsets.all(1.w),
            child: FadeInImage.memoryNetwork(
              image: urlImageButton,
              placeholder: kTransparentImage,
              width: 35.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ]),
    );
  }
}

class StaggeredImageContent extends StatelessWidget {
  final double extent;
  final String urlImage;
  final VoidCallback onTap;

  const StaggeredImageContent(
      {super.key,
      required this.extent,
      required this.urlImage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: SizedBox(
          height: extent,
          width: extent,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment(0, 0),
                child: CircularProgressIndicator(
                  color: AppColors.redValorant,
                ),
              ),
              FadeInImage.memoryNetwork(
                  height: extent,
                  width: extent,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: urlImage),
              Material(color: Colors.transparent, child: InkWell(onTap: onTap))
            ],
          ),
        ));
  }
}
