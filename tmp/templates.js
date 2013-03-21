angular.module("CV").run(["$templateCache", function($templateCache) {

  $templateCache.put("partials/404.html",
    "<div>" +
    "	<h1>404 Not Found</h1>" +
    "	Try starting from <a href=\"#/\">main page</a>" +
    "</div>"
  );

  $templateCache.put("partials/index.html",
    "<div class=\"hero-unit\">" +
    "	<p>Hi. My name is Andrew Kulinich and you are reading (actually using) my resume. I am UI development expert, team lead and R&D office manager.</p>" +
    "	<p>As for me - best resume for developer is code he creates. Check out this <a href=\"https://github.com/4vanger/cv-angular\">CV source code</a> at github. This project is my playground to try <a href=\"http://angularjs.org\">Angular.js</a> framework</p>" +
    "	<p>When I got interested how whisky is made - I built my own distillery at home. Yes, I'm hacker - I'm interested how things are made. When something is not working correctly - I will get to the root of problem, fix it and learn from that. I hate poorly written code, incorrect indents or inconsistently named variables. Code should be perfect - only then it will work correctly.</p>" +
    "	<p>I love Javascript a lot because it is so easy and agile. And today I could write anything with Javascript - not only browser UI, but also server-side and mobile apps. I love it so much that even this resume is written on Javascript - check out page source.</p>" +
    "	<p>I live in Ukraine, but I'm ok to relocate if necessary.</p>" +
    "	<p>Don't forget to check <a href=\"#/jobs\">list of companies, I was working for before</a> and <a href=\"#/projects\">projects, I am proud of</a>. Feel free to <a href=\"#/contacts\">contact me</a> if you need my help.</p>" +
    "</div>" +
    ""
  );

  $templateCache.put("partials/jobs.html",
    "<form class=\"form-inline\">" +
    "	<label for=\"searchSkill\">" +
    "		Search by skill:" +
    "	</label>" +
    "	<div class=\"input-append\">" +
    "		<input id=\"searchSkill\" type=\"text\" ng-model=\"search.skill\" placeholder=\"type skill here\"/>" +
    "		<span class=\"add-on clickable\" ng-click=\"search.skill = ''\"><i class=\"icon icon-trash\"></i></span>" +
    "	</div>" +
    "</form>" +
    "" +
    "<ul class=\"jobs\">" +
    "	<li class=\"job\" ng-repeat=\"job in jobs | filter:{skills:search.skill}| orderBy:'-finishTimestamp'\">" +
    "		<h2 class=\"position\">" +
    "			{{job.position}}" +
    "			<span ng-show=\"job.company\">at {{job.company}}</span>" +
    "			<small ng-show=\"job.href\"><a href=\"{{job.href}}\">{{job.href}}</a></small>" +
    "		</h2>" +
    "		<p class=\"time\">" +
    "			{{ job.startTimestamp | date:'MMMM yy' }}" +
    "			&mdash;" +
    "			<span ng-show=\"job.finishTimestamp\">{{job.finishTimestamp | date:'MMMM yy'}}</span>" +
    "			<span ng-hide=\"job.finishTimestamp\"> current</span>" +
    "" +
    "			({{ job.startTimestamp | howLong:job.finishTimestamp }})" +
    "		</p>" +
    "		<ul class=\"skills\">" +
    "			<li class=\"skill\" ng-repeat=\"skill in job.skills\">" +
    "				<a class=\"label important\" ng-click=\"search.skill = skill\">{{skill}}</a>" +
    "			</li>" +
    "		</ul>" +
    "		<p ng-bind-html-unsafe=\"job.notes\"></p>" +
    "	</li>" +
    "</ul>" +
    ""
  );

}]);
