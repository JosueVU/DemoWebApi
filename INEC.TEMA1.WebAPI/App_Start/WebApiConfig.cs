using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Web.Http;

namespace INEC.TEMA1.WebAPI
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.MapHttpAttributeRoutes();
            config.Formatters.OfType<JsonMediaTypeFormatter>().First();
            // Web API configuration and services
            // Adding formatter for Json   
//            GlobalConfiguration.Configuration.Formatters.JsonFormatter.MediaTypeMappings
//.Add(new System.Net.Http.Formatting.RequestHeaderMapping("Accept",
//                              "text/html",
//                              StringComparison.InvariantCultureIgnoreCase,
//                              true,
//                              "application/json"));
            // Web API routes

            config.Routes.MapHttpRoute(
                name: "ServiceSecurityApi",
                routeTemplate: "api/{controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
