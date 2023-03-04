import 'package:code/src/Base/common/file_export.dart';
import 'package:url_launcher/url_launcher.dart';

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

<div _ngcontent-xgf-c179="" class="bv"><div _ngcontent-xgf-c179="" class="container"><div _ngcontent-xgf-c179="" class="row">
<div _ngcontent-xgf-c179="" class="col-12 col-lg-12"><div _ngcontent-xgf-c179="" class="m-crd pr">
<h2 _ngcontent-xgf-c179="" class="mb-4">الاستخدام الآمن للأنظمة: </h2><h5 _ngcontent-xgf-c179="" class="start-in"> الدقة والضمانات </h5>
<p _ngcontent-xgf-c179="" class="mb-3"> جميع المعلومات المقدمة على النظام مملوكة من قبل الهيئة ويتم تنفيذ أفضل الممارسات لضمان جودة وتحديث المعلومات. ومع ذلك، لا توجد ضمانات صريحة أو ضمنية حول دقة المعلومات المقدمة على النظام أو موثوقيتها أو توافرها وبالتالي لا تتحمل الهيئة مسؤولية أي معلومات غير دقيقة، أو غير كاملة، أو قديمة، أو أي إجراءات يتم اتخاذها فيما يتعلق بالمعلومات المقدمة. </p>
<h5 _ngcontent-xgf-c179="" class="start-in"> اتاحة وتوفر النظام </h5>
<p _ngcontent-xgf-c179="" class="mb-3">تبذُل الهيئة العامة للنقل أفضل جهد ممكن للحفاظ على تشغيل النظام بطريقة جيدة وسهلة، ولا تتحمل الهيئة أي مسؤولية ولن تكون خاضعة لأية مساءلة أو مطالبات لعدم توفر النظام بسبب مشاكل فنية خارجة عن سيطرة الهيئة. </p><h5 _ngcontent-xgf-c179="" class="start-in">
 الروابط المتصلة بالمواقع الأخرى </h5><p _ngcontent-xgf-c179="" class="mb-3">
 تبذُل الهيئة العامة للنقل أفضل جهد ممكن للحفاظ على تشغيل النظام بطريقة جيدة وسهلة، ولا تتحمل الهيئة أي مسؤولية ولن تكون خاضعة لأية مساءلة أو مطالبات لعدم توفر النظام بسبب مشاكل فنية خارجة عن سيطرة الهيئة. </p><div _ngcontent-xgf-c179="" class="box-skils">
 <h5 _ngcontent-xgf-c179="" class="start-in"> اتفاقية المستخدم </h5>
 <p _ngcontent-xgf-c179="">يوافق المستخدم على عدم استخدام، أو تشجيع، أو تعزيز، أو تسهيل، أو إرشاد الآخرين لاستخدام الخدمات على النحو التالي: </p>
 <ul _ngcontent-xgf-c179=""><li _ngcontent-xgf-c179="">الدخول في أنشطة أو الترويج لها أو التشجيع عليها بما يخالف أي قانون، أو نظام، أو قرار حكومي، أو مرسوم ملكي ،أو اتفاقية قانونية أو سياسات منشورة صادرة عن الهيئة. </li>
 <li _ngcontent-xgf-c179=""> الوصول إلى أي خدمة أو نظام أو البحث في نقاط الضعف فيه دون تصريح، بما في ذلك، على سبيل المثال لا الحصر، الانتهاكات أو عمليات مسح الثغرات الأمنية أو اختبار الاختراق. </li>
 <li _ngcontent-xgf-c179="">استخدم المكتبة الرقمية لإنشاء</li><li _ngcontent-xgf-c179=""> 
 تعطيل أي جانب من جوانب الخدمة أو التدخل فيه أو التحايل عليه؛ أو انتهاك أي إجراءات أمان أو مصادقة يستخدمها النظام أو الخدمة. </li>
 <li _ngcontent-xgf-c179="">أي سرقة للموارد بما في ذلك المعلومات الحساسة. </li></ul></div></div></div>
 </div></div></div>""";
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
                            child:  ListView(

                              physics: AlwaysScrollableScrollPhysics(),
                              children: [
                                Html(
                                  data: str,
                                  onLinkTap: (url, _, __, ___) async {
                                    await launchUrl(Uri.parse(url!),
                                      mode: LaunchMode.inAppWebView,
                                      webViewConfiguration: const WebViewConfiguration(
                                          headers: <String, String>{'my_header_key': 'my_header_value'}),);

                                  },
                                ),
                              ],

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
