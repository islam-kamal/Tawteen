import 'package:code/src/Base/common/file_export.dart';

class TermsScreen extends StatelessWidget {
  String? str = r"""<!-- HTML Codes by Quackit.com -->
<!DOCTYPE html>
<title>Text Example</title>
<style>
div.container {
background-color: #ffffff;
}
div.container p {
font-family: Arial;
font-size: 14px;
font-style: normal;
font-weight: bold;
text-decoration: none;
text-transform: none;
color: #00ff00;
background-color: #ffffff;
}
</style>

<div class="container">
<h3 style="font-family:verdana;"> الشروط والأحكام</h3>
<p></p>
<p style="font-family:verdana;">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى نصي، هنا يوجد محتوى نصي" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا الفكاهية إليها.</p>
<p></p>
<h3 style="color:green;font-family:verdana;">عنوان فرعي</h3>
<p></p>
<p style="font-family:verdana;">أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات</p>
<p></p>
<h3 style="color:green;font-family:verdana;">عنوان فرعي</h3>
<p></p>
<p style="font-family:verdana;">أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات</p>
</div>""";
  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Directionality(
          textDirection: translator.activeLanguageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child:Scaffold(
          appBar: AppBarWidget.appBarWidget(
              context: context,
              icon: true,
              route: Index()

          ),
          backgroundColor: kWhiteColor,
          body:  SingleChildScrollView(
              child: Container(
                  color: kGreenColor,
                  child: Column(
                    children: [
                      Container(
                          height: Shared.height,
                          padding: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Shared.width * 0.08),
                                topLeft: Radius.circular(Shared.width * 0.08)),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Shared.width * 0.05,vertical: Shared.width * 0.05),
                            child: Scrollbar(
                              child:  Html(
                                data: str,
                              ),

                            ),
                          )
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
