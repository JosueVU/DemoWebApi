using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Results;

namespace INEC.TEMA1.WebAPI.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values
        public List<String> Get()
        {
            List<String> strinResult = new List<string>();
            strinResult.Add("Concepto 1");
            strinResult.Add("Concepto 2");
            return strinResult;
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public List<String> Post([FromBody]string value)
        {
            List<String> strinResult = new List<string>();
            strinResult.Add("Concepto 1 post");
            strinResult.Add("Concepto 2 post");
            return strinResult;
        }

        // POST api/values
        [HttpPost]
        public List<String> Prueba([FromBody]string value)
        {
            List<String> strinResult = new List<string>();
            strinResult.Add("Concepto 1 post");
            strinResult.Add("Concepto 2 post");
            return strinResult;
        }

        // POST api/values
        [HttpPost]
        public List<byte[]> ObtenerImagen([FromBody]string value)
        {
            var prueba = new List<byte[]>();
            var prueba2 = File.ReadAllBytes(HttpContext.Current.Server.MapPath("~/Image/JetBox1.png"));
            prueba.Add(prueba2);
            return prueba;
        }

        // PUT api/values/5
        [HttpPut]
        public List<String> Put(int id, [FromBody]string value)
        {
            List<String> strinResult = new List<string>();
            strinResult.Add("Concepto 1 put");
            strinResult.Add("Concepto 2 put");
            return strinResult;
        }

        // DELETE api/values/5
        public List<String> Delete(int id)
        {
            List<String> strinResult = new List<string>();
            strinResult.Add("Concepto 1 delete");
            strinResult.Add("Concepto 2 delete");
            return strinResult;
        }
    }
}
