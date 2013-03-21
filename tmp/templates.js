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
    "	<p>Don't forget to check <a href=\"#!/jobs\">list of companies, I was working for before</a> and <a href=\"#!/projects\">projects, I am proud of</a>. Feel free to <a href=\"#!/contacts\">contact me</a> if you need my help.</p>" +
    "</div>" +
    ""
  );

}]);