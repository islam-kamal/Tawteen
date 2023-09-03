import 'package:code/src/Base/common/file_export.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {

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

<div _ngcontent-niq-c171="" class="bv"><div _ngcontent-niq-c171="" class="container"><div _ngcontent-niq-c171="" class="row"><div _ngcontent-niq-c171="" class="col-12 col-lg-12">
<div _ngcontent-niq-c171="" class="m-crd pr"><h3 _ngcontent-niq-c171="" class="start-in"> هدفنا </h3>
<p _ngcontent-niq-c171="" class="mb-3"> تكوين قاعدة بيانات لكل ما يهم الباحثين عن وظائف من جهة وأصحاب العمل من جهة أخرى لنصبح حلقة وصل آلية وسريعة التنفيذ مع مراعاة تحري الدقة وحماية الخصوصية وتوفير كافة الخيارات لضمان تسهيل مهمة التوظيف والبحث عن عمل. </p>
<h4 _ngcontent-niq-c171="" class="start-in"> لماذا نوطن في قطاع النقل </h4>
<p _ngcontent-niq-c171="" class="mb-3">تنوع في الوظائف والمهن ومستوياتها وتناسبها مع كافة شرائح المجتمع ومختلف درجات التعليم والتأهيل ، وفرص عمل منتشرة في كافة مناطق المملكة وتوفر بيئة التدريب والتطوير .</p>
<h4 _ngcontent-niq-c171="" class="start-in"> التوطين في قطاع النقل </h4>
<p _ngcontent-niq-c171="" class="mb-3"> مسؤولية وطنية إجتماعية لتقديم درجة أعلى من جودة الخدمات من خلال خلق رواد أعمال في هذا القطاع ومكافحة الممارسات الغير نظامية . </p>
<div _ngcontent-niq-c171="" class="box-skils"><h4> العمل في قطاعات منظومة النقل والخدمات اللوجستية: </h4><ul _ngcontent-niq-c171=""><li _ngcontent-niq-c171="">
<b _ngcontent-niq-c171="">قطاع البري:</b> هو مجموعة من أنشطة وخدمات النقل التي يعمل فيها الباحثين عن العمل بأجر على الطرق البرية في المملكة، ويُعنى قطاع النقل البري بالإشراف والمتابعة على هذه الأنشطة والخدمات.</li><li _ngcontent-niq-c171=""><b _ngcontent-niq-c171="">قطاع البحري:
</b> يُعنى قطاع النقل البحري بتنظيم كل ما يتعلق بأنشطة وخدمات النقل على البحر بواسطة السفن والناقلات البحرية وقوارب الصيد والنزهة واليخوت البحرية.
</li><li _ngcontent-niq-c171="">
<b _ngcontent-niq-c171="">قطاع السككي:</b> هو مجموعة أنشطة وخدمات النقل بالخطوط الحديدية ويُعنى هذا القطاع بالإشراف والمتابعة على هذه الأنشطة والخدمات.</li><li _ngcontent-niq-c171="">
<b _ngcontent-niq-c171="">قطاع الجوي :</b> يهدف قطاع النقل الجوي بتعميق دورها كمشرع ومنظم لصناعة النقل الجوي في المملكةِ، ومن ثم الوقوف على مسافةٍ واحدةٍ من كافةِ المشغلين والعاملين في القطاع.</li></ul>
<h4>عن البرامج في قطاع النقل والخدمات اللوجستية :</h4>
<ul _ngcontent-niq-c171=""><li _ngcontent-niq-c171="">برنامج تدريب على رأس العمل .</li><li _ngcontent-niq-c171="">برنامج تطوير المهارات في مجالات النقل والخدمات اللوجستية .</li><li _ngcontent-niq-c171="">برنامج لإكتساب المهارات الأساسية في مجالات النقل والخدمات اللوجستية.</li></ul></div></div></div></div></div></div>""";

  String? content_en =   r"""<!-- HTML Codes by Quackit.com -->
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

<div _ngcontent-niq-c171="" class="bv"><div _ngcontent-niq-c171="" class="container"><div _ngcontent-niq-c171="" class="row"><div _ngcontent-niq-c171="" class="col-12 col-lg-12">
<div _ngcontent-niq-c171="" class="m-crd pr"><h3 _ngcontent-niq-c171="" class="start-in">our goal</h3>
<p _ngcontent-niq-c171="" class="mb-3"> Creating a database of everything that matters to job seekers on the one hand and employers on the other hand, so that we become an automatic and fast implementation link, taking into account accuracy, protection of privacy, and provision of all options to ensure Facilitate the task of employment and job search. </p>
<h4 _ngcontent-niq-c171="" class="start-in"> Why do we settle in the transport sector</h4>
<p _ngcontent-niq-c171="" class="mb-3">Diversity in jobs and occupations and their levels, and their suitability with all segments of society and various degrees of education and qualification, and job opportunities spread across all regions of the Kingdom and provide an environment for training and development.</p>
<h4 _ngcontent-niq-c171="" class="start-in">Nationalisation in the transport sector</h4>
<p _ngcontent-niq-c171="" class="mb-3"> A national social responsibility to provide a higher degree of quality services by creating entrepreneurs in this sector and combating informal practices. </p>
<div _ngcontent-niq-c171="" class="box-skills"><h4> Work in the transportation and logistics system sectors: </h4><ul _ngcontent-niq-c171=""><li _ngcontent-niq- c171="">
<b _ngcontent-niq-c171="">Land Transportation Sector:</b> It is a group of transportation activities and services in which wage-seekers work on land roads in the Kingdom. The Land Transport Sector is concerned with supervising and following up on these activities and services.</b> li><li _ngcontent-niq-c171=""><b _ngcontent-niq-c171="">Offshore sector:
</b> The maritime transport sector is concerned with organizing everything related to transport activities and services at sea by ships, marine tankers, fishing and pleasure boats, and marine yachts.
</li><li _ngcontent-niq-c171="">
<b _ngcontent-niq-c171="">Railways sector:</b> is a group of railway transport activities and services. This sector is concerned with supervising and following up on these activities and services.</li><li _ngcontent-niq-c171="">
<b _ngcontent-niq-c171="">The air sector:</b> The air transport sector aims to deepen its role as legislator and regulator of the air transport industry in the Kingdom, and then stand at the same distance from all operators and workers in the sector.</li></b> /ul>
<h4>About programs in the transport and logistics sector:</h4>
<ul _ngcontent-niq-c171=""><li _ngcontent-niq-c171="">On-the-job training program.</li><li _ngcontent-niq-c171="">Skills development program in the fields of transportation and services Logistics </li><li_ngcontent-niq-c171="">A program to acquire basic skills in the fields of transport and logistics. </li></ul></div></div></div></div </div></div>""";

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
                                data: translator.activeLanguageCode == 'ar' ? content_ar : content_en,
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
