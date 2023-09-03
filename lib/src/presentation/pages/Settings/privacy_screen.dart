import 'package:code/src/Base/common/file_export.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyScreen extends StatelessWidget {
  WebViewController? _webController;
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

<div _ngcontent-mut-c170="" class="bv"><div _ngcontent-mut-c170="" class="container">
<div _ngcontent-mut-c170="" class="row"><div _ngcontent-mut-c170="" class="col-12 col-lg-12">
<div _ngcontent-mut-c170="" class="m-crd pr"><h3 _ngcontent-mut-c170="" class="mb-4">إشعار الخصوصية </h3>
<p _ngcontent-mut-c170="" class="mb-3"> يُعتبر إشعار الخصوصية 
الموضح أدناه جزءًا من شروط استخدامك للبوابة الالكترونية للهيئة العامة للنقل. </p><p _ngcontent-mut-c170="" class="mb-3"> تلتزم الهيئة العامة للنقل بالحفاظ على سرية البيانات الشخصية لضمان وحفظ حقوق أصحاب البيانات، وتمتثل الهيئة لسياسات حوكمة البيانات الوطنية والتشريعات الأساسية لحماية حقوق وخصوصية الأفراد فيما يتعلق ببياناتهم الشخصية، والتي تخضع لنظام حماية البيانات الشخصية.
 </p><h4 _ngcontent-mut-c170="" class="start-in"> الموافقة على إشعار الخصوصية </h4>
<p _ngcontent-mut-c170="" class="mb-3"> تقوم الهيئة العامة للنقل بجمع البيانات الشخصية عند زيارة البوابة الالكترونية وذلك لتقديم خدمات ذات جودة عالية، ويعتبر استخدامك لبوابة الهيئة والمنصات التابعة لها موافقةً منك على هذا الإشعار. </p>
<h4 _ngcontent-mut-c170="" class="start-in">ما هي البيانات الشخصية التي نجمعها </h4>
<h4 _ngcontent-mut-c170="" class="start-in">
<b _ngcontent-mut-c170="">1- ملفات تعريف الارتباط (Cookies) </b></h4><p _ngcontent-mut-c170=""> قد يقوم الموقع بتخزين ما يسمى بملفات تعريف الارتباط "Cookies" على الجهاز المحمول الخاص بك عندما تقوم بزيارة موقع الهيئة العامة للنقل. إن ملفات تعريف الارتباط "Cookies" هي جزء من البيانات التي تحددك كمستخدم بشكل فريد، كما يمكن استخدامها لتطوير معرفتك بموقع الهيئة العامة للنقل وفهم تجربة المستخدم على نحو أفضل.و من هذه البيانات المحفوظة: </p>
<div _ngcontent-mut-c170="" class="box-skils"><ul _ngcontent-mut-c170="">
<li _ngcontent-mut-c170="">تذكر اسم مستخدم وكلمة مرور.</li>
<li _ngcontent-mut-c170="">حفظ إعدادات الصفحة في حال كان ذلك متاح على البوابة.</li>
<li _ngcontent-mut-c170="">حفظ الألوان التي تم اختيارها من قبل المستخدم.</li></ul></div>
<h4 _ngcontent-mut-c170="" class="start-in">
<b _ngcontent-mut-c170="">2- البيانات الشخصية</b>
</h4><p _ngcontent-mut-c170="">تقوم الهيئة العامة للنقل بجمع بعض البيانات الشخصية عند استخدام الخدمات الالكترونية أو
 وسائل الاتصال الخاصة بالهيئة، مع إمكانية مشاركة بعض البيانات مع الجهات الحكومية لغرض تسهيل رحلة المستفيد ورفع مستوى الجودة.</p>
<p _ngcontent-mut-c170="">مثل : الاسم ، أرقام التواصل ، البريد الشخصي ، العنوان ، الهوية أو رقم الإقامة.</p><h4 _ngcontent-mut-c170="" class="start-in">
<b _ngcontent-mut-c170="">3- الموقع الجغرافي </b></h4><p _ngcontent-mut-c170="">قد يُطلب من المستخدم في بعض الأحيان الموافقة على تحديد الموقع الجغرافي له، للاستفادة من بعض الخدمات المقدمة في موقع الهيئة العامة للنقل.</p>
<h4 _ngcontent-mut-c170="" class="start-in">كيف نستخدم بياناتك الشخصية</h4>
<div _ngcontent-mut-c170="" class="box-skils"><ul _ngcontent-mut-c170=""><li _ngcontent-mut-c170="">استخدام موقع الهيئة العامة للنقل لبروتوكول الإنترنت الخاص بك يساعد على تشخيص المشكلات التي تحدث في الخوادم الخاصة بها، ويساعدها أيضًا على إجراء الإحصاء اللازم لقياس استخدام الموقع (عدد الزوار ولغة جهاز الكمبيوتر الذي تستخدمه ونوع المتصفح)، لا يسمح لأي جهة خارج إطار الفريق الفني لها بالاطلاع على بروتوكول الإنترنت الخاص بك.</li>
<li _ngcontent-mut-c170="">تحسين تجربة المستخدم من خلال تحسين وتطوير موقع الهيئة العامة للنقل لتلبية احتياجات وخدمات المستخدمين.</li>
<li _ngcontent-mut-c170="">تحسين خدمة المستفيدين من خلال الاستجابة بشكل أكثر فعالية لطلبات خدمة العملاء واحتياجات الدعم.</li><li _ngcontent-mut-c170="">قد نستخدم تقرير " Google" التحليلي للقيام بتحليلات مواقع الويب التي تحصل على معلوماتها من عناوين بروتوكول الإنترنت، لإظهار المعلومات المعروضة مثل: البلد، المدينة، الجهاز، الصفحات التي تمت زيارتها، ووقت الجلسة لكل صفحة تمت زيارتها، وتستخدم هذه التقارير داخليًا فقط لأغراض التحليل وتطوير الموقع.</li><li _ngcontent-mut-c170="">إرسال رسائل البريد الإلكتروني و الرسائل النصية الدورية –لمعالجة الطلبات، وقد يستخدم لإرسال المعلومات والتحديثات إلى طلبك بالإضافة إلى تلقي أخبار الهيئة العامة للنقل العامة والتحديثات والمنتجات ذات الصلة.</li></ul></div>
<h4 _ngcontent-mut-c170="" class="start-in">الأساس النظامي لجمع ومعالجة بياناتك الشخصية </h4>
<div _ngcontent-mut-c170="" class="box-skils">
<p _ngcontent-mut-c170="" class="mb-3">وفقاً لنظام حماية البيانات الشخصية في السعودية و لسياسة حماية البيانات الشخصية الصادرة من مكتب إدارة البيانات الوطنية، فإن الأساس النظامي الذي نعتمد عليه لمعالجة هذه البيانات هو: </p><ul _ngcontent-mut-c170=""><li _ngcontent-mut-c170="">موافقتك الصريحة، ويمكنك التراجع عن الموافقة في أي وقت ما عدا بعض الاستثناءات الموضحة أعلاه وللقيام بذلك يمكنك التواصل من خلال بيانات التواصل الموضحة أدناه.</li>
<li _ngcontent-mut-c170="">تحقيق المصلحة العامة: من خلال تسهيل وتحسين إجراءات الجهات الحكومية ذات العلاقة.</li></ul></div><h4 _ngcontent-mut-c170="" class="start-in">حماية بياناتك الشخصية</h4>
<p _ngcontent-mut-c170="" class="mb-2">ستكون بياناتك الشخصية متاحة فقط لموظفي الهيئة أو لموظفي الأطراف الثالثة المصرّح لهم بالاطلاع عليها، كما نؤكد بتطبيق الإجراءات التنظيمية والتدابير الأمنية المناسبة لحماية بياناتك من أي إفصاح أو معالجة غير مصرح بها، ولن تكون تلك البيانات متاحة للعامة، ولن يتم تبادل أو تداول أي من تلك البيانات أو بيعها لأي طرف آخر من غير الموافقة المسبقة لصاحب البيانات إلا في حالة الامتثال للسياسات و الأنظمة والقوانين ذات العلاقة.</p>
<p _ngcontent-mut-c170="" class="mb-3">كما لن يسمح بالوصول إلى المعلومات إلا للأشخاص المؤهلين والذين يتولون تقديم خدمات موقع الهيئة العامة للنقل ،والجهات الحكومية التي تساهم في تطوير الخدمات وتسهيل إجراءات رحلة المستفيد، ويتم تطبيق نظام حماية البيانات الشخصية واتباع سياسات حماية البيانات الشخصية الصادرة من مكتب إدارة البيانات الوطنية المتعلقة بأمن البيانات الشخصية.</p>
<h4 _ngcontent-mut-c170="" class="start-in">مشاركة بياناتك الشخصية</h4><p _ngcontent-mut-c170="" class="mb-1">قد يتم مشاركة البيانات الشخصية مع جهات حكومية ذات العلاقة ، على أن يتم مشاركتها لأغراض مشروعة في سبيل تحسين تجربة المستفيد أو لأغراض أخرى تحقق أهداف و مصالح وطنية.</p><p _ngcontent-mut-c170="" class="mb-1">وبتقديمك لبياناتك ومعلوماتك الشخصية من خلال البوابة الإلكترونية للهيئة، فإنك توافق تمامًا على تخزين ومعالجة واستخدام تلك البيانات من قِبل السلطات السعودية، ونحن نحتفظ بالحق في كل الأوقات في كشف أي معلومات للجهات المختصة، عندما يكون ذلك ضروريًا للالتزام بأي قانون أو نظام أو طلب حكومي.</p>
<p _ngcontent-mut-c170="" class="mb-1">لن نشارك بياناتك الشخصية مع الجهات غير الحكومية إلا إذا كانت من الجهات المصرح لها من الجهات المختصة بالقيام بأداء خدمات حكومية محددة.</p>
<h4 _ngcontent-mut-c170="" class="start-in">حقوق صاحب البيانات</h4>
<h5 _ngcontent-mut-c170="" class="start-in">يحق لصاحب البيانات الذي يزوّد بياناته الشخصية لموقع الهيئة، ما يلي:</h5><div _ngcontent-mut-c170="" class="box-skils"><ul _ngcontent-mut-c170=""><li _ngcontent-mut-c170="">الحق في الوصول إلى بياناتك الشخصية: وذلك بطلب نسخة من بياناتك الشخصية عبر البريد الالكتروني الموضح في بيانات التواصل، وسيتم الرد عليك خلال [ 5 ] أيام عمل.</li>
<li _ngcontent-mut-c170="">الحق في تصحيح بياناتك الشخصية: وذلك بطلب تصحيح بياناتك الشخصية التي ترى أنها غير دقيقة أو غير صحيحة أو غير مكتملة وذلك عبر البريد الإلكتروني الموضح في بيانات التواصل، وسيتم مراجعتها وتحديثها خلال [ 5 ] أيام عمل ويتم اشعارك بذلك عن طريق [ معلومات التواصل الخاصة بك ].</li><li _ngcontent-mut-c170="">الحق في إتلاف بياناتك الشخصية: وذلك بطلب مسح بياناتك الشخصية في ظروف معينة بما لا يتعارض مع الأسس النظامية و المصالح المشروعة.</li>
<li _ngcontent-mut-c170="">الحق في تقييد المعالجة: وذلك بطلب تقييد معالجة بياناتك الشخصية في ظروف معينة ولفترة زمنية محددة.</li>
<li _ngcontent-mut-c170="">الحق في الاعتراض على المعالجة: وذلك بالاعتراض على معالجة بياناتك الشخصية في الحالات التالية [ لأغراض التسويق المباشر – لمهام محددة يتم تنفيذها للمصلحة العامة أو لأهدافنا المشروعة ].</li><li _ngcontent-mut-c170="">الحق في نقل بياناتك الشخصية: وذلك بطلب نقل بياناتك الشخصية – التي يتم جمعها عن طريقك مباشرة إلى جهة أخرى بمقابل مادي، ولا يمكن ممارسة هذا الحق إلا إذا كانت موافقتك هي الأساس النظامي.</li></ul></div><h4 _ngcontent-mut-c170="" class="start-in">التزامات جهات المعالجة </h4>
<h5 _ngcontent-mut-c170="" class="start-in">تلتزم أي جهة معالجة تعالج البيانات الشخصية ، حصلت على قبول للترخيص من الهيئة العامة للنقل بالتالي: </h5>
<div _ngcontent-mut-c170="" class="box-skils"><ul _ngcontent-mut-c170=""><li _ngcontent-mut-c170="">تطبيق أحكام ومبادئ نظام حماية البيانات الشخصية و سياسات حماية البيانات الشخصية المعمول بها في المملكة ، و يعتبر استخدامك و موافقتك لبوابة الهيئة العامة للنقل موافقتك بالالتزام بها. </li><li _ngcontent-mut-c170="">تخزين البيانات الشخصية ومعالجتها داخل الحدود الجغرافية للمملكة لضمان المحافظة على السيادة الوطنية الرقمية لهذه البيانات، ولا يجوز معالجتها خارج المملكة إلا بعد الحصول على الموافقة الكتابية من الجهات التنظيمية.</li>
<li _ngcontent-mut-c170="">أن يتم حماية البيانات الشخصية من التسرب، أو التلف، أو الفقدان، أو الاختلاس، أو إساءة الاستخدام، أو التعديل أو الوصول غير المصرّح به – وفقاً لما يصدر من الهيئة الوطنية للأمن السيبراني والجهات ذات الاختصاص.
</li><li _ngcontent-mut-c170="">يحظر مشاركة البيانات الشخصية مع جهات أخرى إلا وفقاً للأغراض المحددة بعد موافقة صاحب البيانات ووفقاً للأنظمة واللوائح والسياسات على أن يتم تزويد الجهات الأخرى بسياسات وإجراءات الخصوصية المتبعة وتضمينها في العقود والاتفاقيات.</li>
<li _ngcontent-mut-c170="">استخدام التدابير الأمنية المناسبة – كالتشفير، وغيره – لأمن البيانات الشخصية وحمايتها بما يتناسب مع طبيعتها وحساسيتها والوسائط المستخدمة لنقلها وتخزينها وفقاً لما يصدر من الهيئة الوطنية للأمن السيبراني والجهات ذات الاختصاص.</li><li _ngcontent-mut-c170="">إجراء التقييم الدوري للمخاطر والآثار المحتملة لأنشطة معالجة البيانات الشخصية .</li></ul></div>
<h4 _ngcontent-mut-c170="" class="start-in">التغييرات التي قد تطرأ على إشعار الخصوصية</h4><p _ngcontent-mut-c170="" class="mb-1">يجب على المستخدمين الاطلاع بشكل مستمرعلي إشعار الخصوصية، والذي قد يطرأ عليه تغيير في أي وقت. سيتم نشر التحديثات في صفحة إشعار الخصوصية مع الإشارة إلى آخر تحديث أُجري عليها.</p>
<p _ngcontent-mut-c170="" class="mb-1">تحتفظ الهيئة بحقها في تعديل إشعار الخصوصية عند الضرورة، ويصبح أي تعديل للبنود والشروط نافذًا فور اعتماده دون أي التزام بالإعلان.</p><h4 _ngcontent-mut-c170="" class="start-in">تواصل معنا</h4>
<p _ngcontent-mut-c170="">في حال وجود أي اسئلة أو استفسارات حول إشعار الخصوصية الخاص ب الهيئة العامة للنقل ، فيمكنك التواصل معنا من خلال التالي: </p><div _ngcontent-mut-c170="" class="box-skils"><p _ngcontent-mut-c170="">الفريق المختص : مكتب إدارة البيانات</p>
<p _ngcontent-mut-c170="">البريد الإلكــتروني : DMO@tga.gov.sa</p><div _ngcontent-mut-c170="" class="box-skils">
<h4 _ngcontent-mut-c170="">التشريعات ذات العلاقة</h4>
<ul _ngcontent-mut-c170="">
<li _ngcontent-mut-c170="">
<a _ngcontent-mut-c170="" href="https://laws.boe.gov.sa/BoeLaws/Laws/LawDetails/b7cfae89-828e-4994-b167-adaa00e37188/1" target="_blank">نظام وسياسة حماية البيانات الشخصية </a></li><li _ngcontent-mut-c170="">
<a _ngcontent-mut-c170="" href="https://sdaia.gov.sa/ndmo/Files/PoliciesAr.pdf">سياسات حوكمة البيانات الوطنية</a></li><li _ngcontent-mut-c170="">
<a _ngcontent-mut-c170="" href="https://ega.ee/wp-content/uploads/2019/03/Essential-Cybersecurity-Controls.pdf">الضوابط الأساسية للأمن السيبراني</a></li><li _ngcontent-mut-c170="">
<a _ngcontent-mut-c170="" href="https://laws.boe.gov.sa/BoeLaws/Laws/LawDetails/6f509360-2c39-4358-ae2a-a9a700f2ed16/1">نظام التعاملات الالكترونية</a></li></ul></div></div></div>

</div></div></div></div>""";

String? content_en  = r"""<!-- HTML Codes by Quackit.com -->
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

<div _ngcontent-mut-c170="" class="bv"><div _ngcontent-mut-c170="" class="container">
<div _ngcontent-mut-c170="" class="row"><div _ngcontent-mut-c170="" class="col-12 col-lg-12">
<div _ngcontent-mut-c170="" class="m-crd pr"><h3 _ngcontent-mut-c170="" class="mb-4">privacy notice</h3>
<p _ngcontent-mut-c170="" class="mb-3"> Privacy Notice
The following is part of the conditions for your use of the electronic portal of the Public Transport Authority. </p><p _ngcontent-mut-c170="" class="mb-3"> The Public Transport Authority is committed to maintaining the confidentiality of personal data to ensure and preserve the rights of data owners, and the authority is in compliance with national data governance policies and basic legislation to protect the rights and privacy of individuals in relation to relating to their personal data, which is subject to the Personal Data Protection Regulation.
  </p><h4 _ngcontent-mut-c170="" class="start-in">agree to the privacy notice </h4>
<p _ngcontent-mut-c170="" class="mb-3"> The Public Transport Authority collects personal data when visiting the portal in order to provide high-quality services, and your use of the portal and its affiliated platforms is considered your approval of this notice. </p>
<h4 _ngcontent-mut-c170="" class="start-in">What personal data do we collect</h4>
<h4 _ngcontent-mut-c170="" class="start-in">
<b _ngcontent-mut-c170="">1- Cookies </b></h4><p _ngcontent-mut-c170=""> The site may store so-called "cookies" on your mobile device when you visit the Public Transport Authority website. Cookies are a piece of data that uniquely identifies you as a user, and can also be used to improve your knowledge of the Public Transport Authority website and better understand the user experience. From this saved data: </p>
<div _ngcontent-mut-c170="" class="box-skills"><ul _ngcontent-mut-c170="">
<li _ngcontent-mut-c170="">Remember your username and password.</li>
<li _ngcontent-mut-c170="">Save page settings if available on the portal.</li>
<li _ngcontent-mut-c170="">Save the colors chosen by the user.</li></ul></div>
<h4 _ngcontent-mut-c170="" class="start-in">
<b _ngcontent-mut-c170="">2- Personal data</b>
</h4><p _ngcontent-mut-c170="">The Public Transport Authority collects some personal data when using electronic services or
  The authority's means of communication, with the possibility of sharing some data with government agencies for the purpose of facilitating the beneficiary's journey and raising the level of quality.</p>
<p _ngcontent-mut-c170="">such as: name, contact numbers, personal email, address, ID or residence number.</p><h4 _ngcontent-mut-c170="" class="start-in">
<b _ngcontent-mut-c170="">3- Geographical location </b></h4><p _ngcontent-mut-c170="">Sometimes the user may be asked to agree to determine his or her geographic location, in order to benefit from Some of the services provided on the website of the Public Transport Authority.</p>
<h4 _ngcontent-mut-c170="" class="start-in">How do we use your personal data</h4>
<div _ngcontent-mut-c170="" class="box-skills"><ul _ngcontent-mut-c170=""><li _ngcontent-mut-c170="">Using your own IP ngcontent site helps to diagnose problems that occur in its servers, and also helps it to perform the necessary statistics to measure the use of the site (the number of visitors, the language of the computer you are using and the type of browser), it does not allow anyone outside the framework of its technical team to see your Internet protocol.</li >
<li _ngcontent-mut-c170="">Improving user experience by improving and developing the Public Transport Authority's website to meet the needs and services of users.</li>
<li _ngcontent-mut-c170="">Improve customer service by responding more effectively to customer service requests and support needs.</li><li _ngcontent-mut-c170="">We may use Google Analytics to perform analytics Websites that get their information from IP addresses, to show displayed information such as: country, city, device, pages visited, and session time for each page visited, and these reports are used internally only for analysis and site development purposes.</li><li _ngcontent-mut-c170="">Send periodic emails and text messages - to process orders, and may be used to send information and updates to your order as well as to receive GTA news, updates and related products.</li></ul>< /div>
<h4 _ngcontent-mut-c170="" class="start-in">Systematic basis for collecting and processing your personal data</h4>
<div_ngcontent-mut-c170="" class="box-skills">
<p _ngcontent-mut-c170="" class="mb-3">According to the personal data protection system in Saudi Arabia and the personal data protection policy issued by the National Data Management Office, the legal basis on which we rely to process this data is: </ p><ul _ngcontent-mut-c170=""><li _ngcontent-mut-c170="">Your express consent, and you can withdraw consent at any time except for some of the above exceptions and to do so you can communicate through the contact details shown below .</li>
<li _ngcontent-mut-c170="">Achieving the public interest: by facilitating and improving the procedures of the relevant government agencies.</li></ul></div><h4 _ngcontent-mut-c170="" class="start-in">Protecting Your Personal Data</h4>
<p _ngcontent-mut-c170="" class="mb-2">Your personal data will only be available to TRA employees or third party employees who are authorized to view it, and we confirm that appropriate organizational procedures and security measures are in place to protect your data from any unauthorized disclosure or processing It is authorized, and such data will not be available to the public, and none of this data will be exchanged, traded, or sold to any other party without the prior consent of the data owner, except in the case of compliance with relevant policies, regulations, and laws.</p>
<p _ngcontent-mut-c170="" class="mb-3">Access to information will not be allowed except for qualified persons who provide the services of the Public Transport Authority website, and government agencies that contribute to developing services and facilitating the beneficiary's journey procedures. Personal data protection system and follow the personal data protection policies issued by the National Data Management Office related to the security of personal data.</p>
<h4 _ngcontent-mut-c170="" class="start-in">Share your personal data</h4><p _ngcontent-mut-c170="" class="mb-1">Personal data may be shared with third parties related government, provided that it is shared for legitimate purposes in order to improve the beneficiary's experience or for other purposes that achieve national goals and interests. Through the Authority's electronic portal, you fully agree to the storage, processing and use of that data by the Saudi authorities, and we reserve the right at all times to disclose any information to the competent authorities, when this is necessary to comply with any law, system or government request.</p>
<p _ngcontent-mut-c170="" class="mb-1">We will not share your personal data with non-governmental entities unless they are authorized by the competent authorities to perform specific government services.</p>
<h4 _ngcontent-mut-c170="" class="start-in">Data Subject Rights</h4>
<h5 _ngcontent-mut-c170="" class="start-in">The data subject who provides his personal data to the Authority's website has the right to:</h5><div _ngcontent-mut-c170="" class="box- skils"><ul _ngcontent-mut-c170=""><li _ngcontent-mut-c170="">The right to access your personal data: by requesting a copy of your personal data via the email indicated in the contact details, and you will be answered within [ 5 ] working days.</li>
<li _ngcontent-mut-c170="">The right to correct your personal data: by requesting the correction of your personal data that you deem to be inaccurate, incorrect, or incomplete, via the e-mail indicated in the contact details, and it will be reviewed and updated within [5] days Work and you will be notified of this via [your contact information]. </li><li_ngcontent-mut-c170="">The right to destroy your personal data: by requesting the erasure of your personal data in certain circumstances in a manner that does not conflict with the legal bases and interests legitimate.</li>
<li _ngcontent-mut-c170="">Right to restriction of processing: by requesting that the processing of your personal data be restricted in certain circumstances and for a specified period of time.</li>
<li _ngcontent-mut-c170="">Right to object to processing: by objecting to the processing of your personal data in the following cases [for direct marketing purposes - for specific tasks carried out in the public interest or for our legitimate purposes].</li><li _ngcontent- mut-c170="">The right to transfer your personal data: by requesting the transfer of your personal data - which is collected directly from you to another party for a fee, and this right can only be exercised if your consent is the legal basis.</li></ ul></div><h4 _ngcontent-mut-c170="" class="start-in">Processor Obligations</h4>
<h5 _ngcontent-mut-c170="" class="start-in">Any processor that processes personal data, which has obtained acceptance of the license from the Public Transport Authority, is obligated to: </h5>
<div _ngcontent-mut-c170="" class="box-skills"><ul _ngcontent-mut-c170=""><li _ngcontent-mut-c170="">Applying the provisions and principles of the personal data protection system and protection policies Personal data in force in the Kingdom, and your use and approval of the Public Transport Authority portal is considered your agreement to abide by it. </li><li _ngcontent-mut-c170="">Personal data is stored and processed within the geographical borders of the Kingdom to ensure the preservation of the digital national sovereignty of this data, and it is not permissible to process it outside the Kingdom except after obtaining the written approval of the regulatory authorities.</li><li> >
<li _ngcontent-mut-c170="">Personal data shall be protected from leakage, damage, loss, misappropriation, misuse, modification or unauthorized access - according to what is issued by the National Cybersecurity Authority and relevant authorities Jurisdiction.
</li><li _ngcontent-mut-c170="">It is prohibited to share personal data with other parties except in accordance with the specified purposes after the consent of the data owner and in accordance with the laws, regulations and policies, provided that the other parties are provided with the privacy policies and procedures followed and included in contracts and agreements.< /li>
<li _ngcontent-mut-c170="">Using appropriate security measures - such as encryption, etc. - to secure and protect personal data in accordance with its nature, sensitivity, and the means used to transmit and store it, according to what is issued by the National Cybersecurity Authority and the competent authorities.</li></li></li><strong> li _ngcontent-mut-c170="">Performance of periodic assessment of potential risks and impacts of personal data processing activities.</li></ul></div>
<h4 _ngcontent-mut-c170="" class="start-in">Changes to the Privacy Notice</h4><p _ngcontent-mut-c170="" class="mb-1">Users should Constant review of the privacy notice, which may be subject to change aj time. Updates will be posted on the privacy notice page indicating the last update.</p>
<p _ngcontent-mut-c170="" class="mb-1">The Authority reserves the right to amend the Privacy Notice when necessary, and any amendment to the Terms and Conditions becomes effective immediately upon approval without any obligation to declare.</p><h4 _ngcontent-mut -c170="" class="start-in">Contact Us</h4>
<p _ngcontent-mut-c170="">If you have any questions or inquiries about the Public Transport Authority's privacy notice, you can contact us through the following: </p><div _ngcontent-mut-c170="" class= "box-skills"><p_ngcontent-mut-c170="">Concerned Team: Data Management Office</p>
<p _ngcontent-mut-c170="">E-mail: DMO@tga.gov.sa</p><div _ngcontent-mut-c170="" class="box-skills">
<h4 _ngcontent-mut-c170="">Relevant legislation</h4>
<ul _ngcontent-mut-c170="">
<li _ngcontent-mut-c170="">
<a _ngcontent-mut-c170="" href="https://laws.boe.gov.sa/BoeLaws/Laws/LawDetails/b7cfae89-828e-4994-b167-adaa00e37188/1" target="_blank">system and Personal Data Protection Policy </a></li><li _ngcontent-mut-c170="">
<a _ngcontent-mut-c170="" href="https://sdaia.gov.sa/ndmo/Files/PoliciesAr.pdf">National Data Governance Policies</a></li><li _ngcontent-mut- c170="">
<a _ngcontent-mut-c170="" href="https://ega.ee/wp-content/uploads/2019/03/Essential-Cybersecurity-Controls.pdf">Essential Cybersecurity Controls</a></ li><li _ngcontent-mut-c170="">
<a _ngcontent-mut-c170="" href="https://laws.boe.gov.sa/BoeLaws/Laws/LawDetails/6f509360-2c39-4358-ae2a-a9a700f2ed16/1">Electronic Transactions System</a </li></ul></div></div></div>

</div></div></div></div>""";
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
          body:  Container(
                      height: Shared.height,
              padding: EdgeInsets.only(top: 10,bottom: Shared.width * 0.1),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Shared.width * 0.08),
                            topLeft: Radius.circular(Shared.width * 0.08)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Shared.width * 0.05,vertical: Shared.width * 0.0),
                        child: ListView(

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
                  ),),
            ),


      ),
    );
  }
}
