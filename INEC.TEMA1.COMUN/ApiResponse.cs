namespace INEC.TEMA1.COMUN
{
    using System.Net;

    public class ApiResponse<T> 
    {
        public bool StatusIsSuccessful { get; set; }
        public HttpStatusCode ResponseCode { get; set; }
        public string ResponseResult { get; set; }
        public T Model { get; set; }
    }
}