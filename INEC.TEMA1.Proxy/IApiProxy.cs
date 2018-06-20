namespace INEC.TEMA1.Proxy
{
    using System.Collections.Generic;
    using System.Net.Http;
    using System.Threading.Tasks;

    public interface IApiProxy
    {
        //Form Encoded verbs interface
        Task<HttpResponseMessage> PostFormEncodedContent(string requestUri, params KeyValuePair<string, string>[] values);
        //Json Response verbs interface
        Task<HttpResponseMessage> PostJsonEncodedContentWithContext<T>(string requestUri, T content);
    }
}