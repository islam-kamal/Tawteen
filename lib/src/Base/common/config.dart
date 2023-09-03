//const String baseUrl = 'https://tga-test.master-works.sa:8443/';
const String baseUrl = 'https://rowad-alnaql.tga.gov.sa/';
const int pageSize = 10;

const String getAllJobsUrl = "api/v1/jobs/all?status=1";
const String getAllCitiesUrl = "api/v1/lookup/cities";
const String getAllProvincesUrl = "api/v1/lookup/provinces";
const String getAllJobTitlesUrl = "api/v1/lookup/job-titles";
const String getAllCoursesUrl = "api/v1/courses/all?status=1";
const String getEductionalLevelUrl = "api/v1/lookup/education-levels";
const String getEductionMajorUrl = "api/v1/lookup/education-majors";
const String getSkillsUrl = "api/v1/lookup/skills";
const String uploadAttachmentsUrl = "api/v1/attachments";
const String applyJobUrl = "api/v1/applicant-jobs";
const String signinUrl = "api/v1/login";
const String getAllIntativesUrl = "api/v1/initiatives/all?status=1&userTypeId=3";
const String applyIntativeUrl = "api/v1/applied-initiative";
const String getAppPublishInfoUrl = "api/v1/AppPublish";