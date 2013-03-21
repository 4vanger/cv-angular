angular.module("CV").run(["$templateCache", function($templateCache) {

  $templateCache.put("partials/404.html",
    "<div>" +
    "	<h1>404 Not Found</h1>" +
    "	Try starting from <a href=\"#/\">main page</a>" +
    "</div>"
  );

  $templateCache.put("partials/index.html",
    "<div>Hello world</div>"
  );

}]);
