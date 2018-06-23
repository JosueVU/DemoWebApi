namespace INEC.TEMA1.Proxy
{
    using System;
    using System.Configuration;
    using System.Net.Http;

    /// <summary>
    /// Creates a Singleton instance of HttpClient - note that this is for demo purposes only. 
    /// I would recommend that you use a Dependency Injection container such as Autofac for managing the lifecycle of your objects.
    /// If we used Autofac here there would be no need for this class.
    /// </summary>
    public static class HttpClientInstance
    {
        private static string BaseUriCommon = ConfigurationManager.AppSettings["ApiWebCommon"].ToString();
        private static readonly HttpClient instanceCommon = new HttpClient {BaseAddress = new Uri(BaseUriCommon) };

        public static HttpClient InstanceCommon
        {
            get { return instanceCommon; }
        }
    }
}