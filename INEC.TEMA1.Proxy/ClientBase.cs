namespace INEC.TEMA1.Proxy
{
    using INEC.TEMA1.COMUN;
    using System.Net.Http;
    using System.Threading.Tasks;
    using System.Web.Helpers;

    public abstract class ClientBase
    {
        protected readonly IApiProxy ApiProxy;

        protected ClientBase(IApiProxy apiProxy)
        {
            ApiProxy = apiProxy;
        }


        //Json Response verbs implementation
        protected async Task<TResponse> PostJsonEncodedContent<TResponse, TModel>(string url, TModel model)
            where TResponse : ApiResponse<TModel>, new()
        {
            using (var apiResponse = await ApiProxy.PostJsonEncodedContentWithContext(url, model))
            {
                return await DecodeJsonResponse<TResponse, TModel>(apiResponse);
            }
        }

        //Json Response verbs implementation
        protected async Task<TResponse> GetJsonEncodedContent<TResponse, TModel>(string url, TModel model)
            where TResponse : ApiResponse<TModel>, new()
        {
            using (var apiResponse = await ApiProxy.PostJsonEncodedContentWithContext(url, model))
            {
                return await DecodeJsonResponse<TResponse, TModel>(apiResponse);
            }
        }

        //Response implementation
        protected static async Task<TContentResponse> DecodeContent<TContentResponse>(HttpResponseMessage response)
        {
            if (response.Content.Headers.ContentType.MediaType == "application/json")
            {
                var result = await response.Content.ReadAsStringAsync();
                var resultModel = Json.Decode<TContentResponse>(result);
                return resultModel;
            }
            else
            {
                var result = await response.Content.ReadAsStringAsync();
                return default(TContentResponse);
            }
        }

        private static async Task<TResponse> DecodeJsonResponse<TResponse, TDecode>(HttpResponseMessage apiResponse) where TResponse : ApiResponse<TDecode>, new()
        {
            if (apiResponse.Content.Headers.ContentType.MediaType == "application/json")
            {
                var response = await CreateJsonResponse<TResponse, TDecode>(apiResponse);
                response.Model = Json.Decode<TDecode>(response.ResponseResult);
                return response;
            }
            else
            {
                TResponse response = new TResponse();
                var result = await apiResponse.Content.ReadAsStringAsync();
                return response;
            }
            
        }

        protected static async Task<TResponse> CreateJsonResponse<TResponse, TModel>(HttpResponseMessage response) where TResponse : ApiResponse<TModel>, new()
        {
            var clientResponses = new TResponse();

           
                if (response.Content != null && clientResponses != null)
                {
                    clientResponses = await response.Content.ReadAsAsync<TResponse>();
                    clientResponses.ResponseResult = await response.Content.ReadAsStringAsync();
                    clientResponses.StatusIsSuccessful = response.IsSuccessStatusCode;
                    clientResponses.ResponseCode = response.StatusCode;
                }
           

            return clientResponses;
        }
    }
}