namespace INEC.TEMA1.Proxy
{
    using CSP.Common.Model.Class;
    using System;
    using System.Collections.Generic;
    using System.Net.Http;
    using System.Net.Http.Headers;
    using System.Threading.Tasks;
    using System.Linq;
    using System.Web;
    using INEC.TEMA1.COMUN;

    public class ApiProxy : IApiProxy
    {
        private readonly HttpClient httpClient;
        private readonly ITokenContainer tokenContainer;

        public ApiProxy(HttpClient httpClient, ITokenContainer tokenContainer,string Area = null)
        {
            this.httpClient = httpClient;
            this.httpClient.DefaultRequestHeaders.Authorization = null;
            this.tokenContainer = tokenContainer;
        }

        public async Task<HttpResponseMessage> PostFormEncodedContent(string requestUri, params KeyValuePair<string, string>[] values)
        {
            using (var content = new FormUrlEncodedContent(values))
            {
                var response = await httpClient.PostAsync(requestUri, content);
                return response;
            }
        }

        public async Task<HttpResponseMessage> PostJsonEncodedContentWithContext<T>(string requestUri, T content) 
        {
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            ApiRequest<T> contentRequest = new ApiRequest<T>
            {
                Model = content
            };
            try
            {
                var response = await httpClient.PostAsJsonAsync(requestUri, contentRequest);
                return response;
            }
            catch(Exception ex)
            {
                var x = ex.Message;
                return null;
            }
          
        }

        public async Task<HttpResponseMessage> GetEncodedContentWithContext<T>(string requestUri, T content)
        {
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            ApiRequest<T> contentRequest = new ApiRequest<T>
            {
                Model = content
            };
            try
            {
                HttpResponseMessage response = null;
                if (contentRequest.Model != null)
                {
                    var properties = from p in contentRequest.Model.GetType().GetProperties()
                                     where p.GetValue(contentRequest.Model, null) != null && !p.PropertyType.IsAbstract
                                     select HttpUtility.UrlEncode(p.GetValue(contentRequest.Model, null).ToString());

                    response = await httpClient.GetAsync(requestUri + "/" + properties.FirstOrDefault());//String.Join("&", properties.ToArray()));
                }
                else
                {
                    response = await httpClient.GetAsync(requestUri);
                }
               
                return response;
            }
            catch (Exception ex)
            {
                var x = ex.Message;
                return null;
            }

        }
    }
}