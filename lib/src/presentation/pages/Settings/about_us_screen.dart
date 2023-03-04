import 'package:code/src/Base/common/file_export.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {

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

<div _ngcontent-niq-c171="" class="bv"><div _ngcontent-niq-c171="" class="container"><div _ngcontent-niq-c171="" class="row"><div _ngcontent-niq-c171="" class="col-12 col-lg-12"><div _ngcontent-niq-c171="" class="m-crd pr"><h5 _ngcontent-niq-c171="" class="start-in"> هدفنا </h5>
<p _ngcontent-niq-c171="" class="mb-3"> تكوين قاعدة بيانات لكل ما يهم الباحثين عن وظائف من جهة وأصحاب العمل من جهة أخرى لنصبح حلقة وصل آلية وسريعة التنفيذ مع مراعاة تحري الدقة وحماية الخصوصية وتوفير كافة الخيارات لضمان تسهيل مهمة التوظيف والبحث عن عمل. </p><h5 _ngcontent-niq-c171="" class="start-in"> لماذا نوطن في قطاع النقل </h5><p _ngcontent-niq-c171="" class="mb-3">تنوع في الوظائف والمهن ومستوياتها وتناسبها مع كافة شرائح المجتمع ومختلف درجات التعليم والتأهيل ، وفرص عمل منتشرة في كافة مناطق المملكة وتوفر بيئة التدريب والتطوير .</p><h5 _ngcontent-niq-c171="" class="start-in"> التوطين في قطاع النقل </h5><p _ngcontent-niq-c171="" class="mb-3"> مسؤولية وطنية إجتماعية لتقديم درجة أعلى من جودة الخدمات من خلال خلق رواد أعمال في هذا القطاع ومكافحة الممارسات الغير نظامية . </p><div _ngcontent-niq-c171="" class="box-skils"><p _ngcontent-niq-c171="" class="mb-0"> العمل في قطاعات منظومة النقل والخدمات اللوجستية: </p><ul _ngcontent-niq-c171=""><li _ngcontent-niq-c171=""><b _ngcontent-niq-c171="">قطاع البري:</b> هو مجموعة من أنشطة وخدمات النقل التي يعمل فيها الباحثين عن العمل بأجر على الطرق البرية في المملكة، ويُعنى قطاع النقل البري بالإشراف والمتابعة على هذه الأنشطة والخدمات.</li><li _ngcontent-niq-c171=""><b _ngcontent-niq-c171="">قطاع البحري:</b> يُعنى قطاع النقل البحري بتنظيم كل ما يتعلق بأنشطة وخدمات النقل على البحر بواسطة السفن والناقلات البحرية وقوارب الصيد والنزهة واليخوت البحرية.</li><li _ngcontent-niq-c171=""><b _ngcontent-niq-c171="">قطاع السككي:</b> هو مجموعة أنشطة وخدمات النقل بالخطوط الحديدية ويُعنى هذا القطاع بالإشراف والمتابعة على هذه الأنشطة والخدمات.</li><li _ngcontent-niq-c171=""><b _ngcontent-niq-c171="">قطاع الجوي :</b> يهدف قطاع النقل الجوي بتعميق دورها كمشرع ومنظم لصناعة النقل الجوي في المملكةِ، ومن ثم الوقوف على مسافةٍ واحدةٍ من كافةِ المشغلين والعاملين في القطاع.</li></ul><p _ngcontent-niq-c171="" class="mb-0 mt-5">عن البرامج في قطاع النقل والخدمات اللوجستية :</p><ul _ngcontent-niq-c171=""><li _ngcontent-niq-c171="">برنامج تدريب على رأس العمل .</li><li _ngcontent-niq-c171="">برنامج تطوير المهارات في مجالات النقل والخدمات اللوجستية .</li><li _ngcontent-niq-c171="">برنامج لإكتساب المهارات الأساسية في مجالات النقل والخدمات اللوجستية.</li></ul></div></div></div></div></div></div>""";
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
              route:Index()

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
