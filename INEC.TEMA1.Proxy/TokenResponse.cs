﻿using INEC.TEMA1.COMUN;
using INEC.TEMA1.Proxy;

namespace CSP.Common.Model.Class
{
    public class TokenResponse : ApiResponse<string>
    {
        public string access_token { get; set; }
        public string token_type { get; set; }
        public int expires_in { get; set; }
        public string error { get; set; }
        public string error_description { get; set; }
    }
}