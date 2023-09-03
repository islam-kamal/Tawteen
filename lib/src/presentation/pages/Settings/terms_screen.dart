import 'package:code/src/Base/common/file_export.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsScreen extends StatelessWidget {

  String? content_ar = r"""<!-- HTML Codes by Quackit.com -->
<!DOCTYPE html>
<title>Text Example</title>
<style>
div.container {
background-color: #ffffff;
}
div.container p {
font-family: DINNextLTArabic;
font-size: 14px;
font-style: normal;
font-weight: normal;
text-decoration: none;
text-transform: none;
color: #303030;
background-color: #ffffff;
}
</style>

<div _ngcontent-xgf-c179="" class="bv"><div _ngcontent-xgf-c179="" class="container"><div _ngcontent-xgf-c179="" class="row">
<div _ngcontent-xgf-c179="" class="col-12 col-lg-12"><div _ngcontent-xgf-c179="" class="m-crd pr">
<h3 _ngcontent-xgf-c179="" class="mb-4">الاستخدام الآمن للأنظمة </h3><h4 _ngcontent-xgf-c179="" class="start-in"> الدقة والضمانات </h4>
<p _ngcontent-xgf-c179="" class="mb-3"> جميع المعلومات المقدمة على النظام مملوكة من قبل الهيئة ويتم تنفيذ أفضل الممارسات لضمان جودة وتحديث المعلومات. ومع ذلك، لا توجد ضمانات صريحة أو ضمنية حول دقة المعلومات المقدمة على النظام أو موثوقيتها أو توافرها وبالتالي لا تتحمل الهيئة مسؤولية أي معلومات غير دقيقة، أو غير كاملة، أو قديمة، أو أي إجراءات يتم اتخاذها فيما يتعلق بالمعلومات المقدمة. </p>
<h4 _ngcontent-xgf-c179="" class="start-in"> اتاحة وتوفر النظام </h4>
<p _ngcontent-xgf-c179="" class="mb-3">تبذُل الهيئة العامة للنقل أفضل جهد ممكن للحفاظ على تشغيل النظام بطريقة جيدة وسهلة، ولا تتحمل الهيئة أي مسؤولية ولن تكون خاضعة لأية مساءلة أو مطالبات لعدم توفر النظام بسبب مشاكل فنية خارجة عن سيطرة الهيئة. </p><h4 _ngcontent-xgf-c179="" class="start-in">
 الروابط المتصلة بالمواقع الأخرى </h4><p _ngcontent-xgf-c179="" class="mb-3">
 تبذُل الهيئة العامة للنقل أفضل جهد ممكن للحفاظ على تشغيل النظام بطريقة جيدة وسهلة، ولا تتحمل الهيئة أي مسؤولية ولن تكون خاضعة لأية مساءلة أو مطالبات لعدم توفر النظام بسبب مشاكل فنية خارجة عن سيطرة الهيئة. </p><div _ngcontent-xgf-c179="" class="box-skils">
 <h4 _ngcontent-xgf-c179="" class="start-in"> اتفاقية المستخدم </h4>
 <p _ngcontent-xgf-c179="">يوافق المستخدم على عدم استخدام، أو تشجيع، أو تعزيز، أو تسهيل، أو إرشاد الآخرين لاستخدام الخدمات على النحو التالي: </p>
 <ul _ngcontent-xgf-c179=""><li _ngcontent-xgf-c179="">الدخول في أنشطة أو الترويج لها أو التشجيع عليها بما يخالف أي قانون، أو نظام، أو قرار حكومي، أو مرسوم ملكي ،أو اتفاقية قانونية أو سياسات منشورة صادرة عن الهيئة. </li>
 <li _ngcontent-xgf-c179=""> الوصول إلى أي خدمة أو نظام أو البحث في نقاط الضعف فيه دون تصريح، بما في ذلك، على سبيل المثال لا الحصر، الانتهاكات أو عمليات مسح الثغرات الأمنية أو اختبار الاختراق. </li>
 <li _ngcontent-xgf-c179="">استخدم المكتبة الرقمية لإنشاء</li><li _ngcontent-xgf-c179=""> 
 تعطيل أي جانب من جوانب الخدمة أو التدخل فيه أو التحايل عليه؛ أو انتهاك أي إجراءات أمان أو مصادقة يستخدمها النظام أو الخدمة. </li>
 <li _ngcontent-xgf-c179="">أي سرقة للموارد بما في ذلك المعلومات الحساسة. </li></ul></div></div></div>
 </div></div></div>""";

  String? content_en = r"""<!-- HTML Codes by Quackit.com -->
<!DOCTYPE html>
<title>Text Example</title>
<style>
div. container {
background-color: #ffffff;
}
div.container p {
font-family: DINNextLTArabic;
font-size: 14px;
font-style: normal;
font-weight: normal;
text-decoration: none;
text-transform: none;
color: #303030;
background-color: #ffffff;
}
</style>

<div _ngcontent-xgf-c179="" class="bv"><div _ngcontent-xgf-c179="" class="container"><div _ngcontent-xgf-c179="" class="row">
<div _ngcontent-xgf-c179="" class="col-12 col-lg-12"><div _ngcontent-xgf-c179="" class="m-crd pr">
<h3 _ngcontent-xgf-c179="" class="mb-4">Safe Use of Systems</h3><h4 _ngcontent-xgf-c179="" class="start-in">Accuracy and Guarantees</h4>
<p _ngcontent-xgf-c179="" class="mb-3"> All information submitted on the system is owned by the Authority and best practices are implemented to ensure the quality and up-to-date information. However, there are no express or implied guarantees about the accuracy, reliability or availability of the information provided on the system and therefore the Authority is not responsible for any inaccurate, incomplete or outdated information or any actions taken in relation to the information provided. </p>
<h4 _ngcontent-xgf-c179="" class="start-in"> system availability </h4>
<p _ngcontent-xgf-c179="" class="mb-3">The Public Transport Authority makes the best possible effort to keep the system running in a good and easy way, and the authority does not bear any responsibility and will not be subject to any accountability or claims for the system not being available due to problems Technical outside the authority's control. </p><h4 _ngcontent-xgf-c179="" class="start-in">
  Links to other websites </h4><p _ngcontent-xgf-c179="" class="mb-3">
  The Public Transport Authority makes the best possible effort to keep the system running in a good and easy way, and the authority bears no responsibility and will not be subject to any liability or claims for the system not being available due to technical problems beyond the control of the authority. </p><div _ngcontent-xgf-c179="" class="box-skills">
  <h4 _ngcontent-xgf-c179="" class="start-in">User Agreement</h4>
  <p _ngcontent-xgf-c179="">User agrees not to use, encourage, promote, facilitate or instruct others to use the Services as follows:</p>
  <ul _ngcontent-xgf-c179=""><li _ngcontent-xgf-c179="">Entering, promoting or encouraging activities in contravention of any law, regulation, government decision, royal decree or legal agreement or published policies issued by the Authority. </li>
  <li _ngcontent-xgf-c179=""> Unauthorized access to, or investigation of vulnerabilities in, any service or system, including, but not limited to, breaches, vulnerability scans, or penetration testing. </li>
  <li _ngcontent-xgf-c179="">Use the digital library to create</li><li _ngcontent-xgf-c179="">
  disable, interfere with, or circumvent any aspect of the Service; or violate any security or authentication measures used by the system or the Service. </li>
  <li _ngcontent-xgf-c179="">Any theft of resources including sensitive information. </li></ul></div></div></div>
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
                          padding: EdgeInsets.only(top: 10,bottom: Shared.width * 0.1),
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
                                  data: translator.activeLanguageCode == 'ar' ? content_ar : content_en,                                  onLinkTap: (url, _, __, ___) async {
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
