using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using Newtonsoft.Json;

namespace CswLibrarySite.Models.Books
{
    /// <summary>
    /// Summary description for CswBookAPI
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class CswBookAPI : System.Web.Services.WebService
    {

        static async Task<int> AsyncMethod(SqlConnection conn, SqlCommand cmd)
        {
            System.Diagnostics.Debug.Write("\n start");
            await conn.OpenAsync();
            System.Diagnostics.Debug.Write("\n conn");
            //await cmd.ExecuteNonQueryAsync();
            return 1;
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetAllBooksAsync()
        {
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            System.Diagnostics.Debug.Write("\n GetBooksByAuthorAsync");
            SqlCommand cmd = new SqlCommand("Select * from vwBooks", conn);
            
            //Async conn
            //int result = AsyncMethod(conn, cmd).Result;
            
            //Sync conn
            conn.Open();

            System.Diagnostics.Debug.Write("\n End async");
            SqlDataReader read = cmd.ExecuteReader();

            //Build json
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);

            using (JsonWriter jsonWriter = new JsonTextWriter(sw))
            {
                jsonWriter.WriteStartArray();

                while (read.Read())
                {
                    jsonWriter.WriteStartObject();

                    int fields = read.FieldCount;

                    for (int i = 0; i < fields; i++)
                    {
                        jsonWriter.WritePropertyName(read.GetName(i));
                        jsonWriter.WriteValue(read[i]);
                    }

                    jsonWriter.WriteEndObject();
                }

                jsonWriter.WriteEndArray();
            }

            return sw.ToString();
        }
        //end GetAllBooksAsync

        [WebMethod]
        public string GetBooksByAuthorAsync(string pAuthorID)
        {
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            System.Diagnostics.Debug.Write("\n GetBooksByAuthorAsync");
            SqlCommand cmd = new SqlCommand("Select * from vwBooks Where AuthorID = " + pAuthorID + " Order by Title", conn);

            //Async conn
            //int result = AsyncMethod(conn, cmd).Result;

            //Sync conn
            conn.Open();

            System.Diagnostics.Debug.Write("\n End async");
            SqlDataReader read = cmd.ExecuteReader();

            //Build json
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);

            using (JsonWriter jsonWriter = new JsonTextWriter(sw))
            {
                jsonWriter.WriteStartArray();

                while (read.Read())
                {
                    jsonWriter.WriteStartObject();

                    int fields = read.FieldCount;

                    for (int i = 0; i < fields; i++)
                    {
                        jsonWriter.WritePropertyName(read.GetName(i));
                        jsonWriter.WriteValue(read[i]);
                    }

                    jsonWriter.WriteEndObject();
                }

                jsonWriter.WriteEndArray();
            }

            return sw.ToString();
        }
        //end GetBooksByAuthorAsync

        [WebMethod]
        public string GetBooksByCategoryAsync(string pCategoryID)
        {
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            System.Diagnostics.Debug.Write("\n GetBooksByAuthorAsync");
            SqlCommand cmd = new SqlCommand("Select * from vwBooks Where CategoryID = " + pCategoryID + " Order by Title", conn);

            //Async conn
            //int result = AsyncMethod(conn, cmd).Result;

            //Sync conn
            conn.Open();

            System.Diagnostics.Debug.Write("\n End async");
            SqlDataReader read = cmd.ExecuteReader();

            //Build json
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);

            using (JsonWriter jsonWriter = new JsonTextWriter(sw))
            {
                jsonWriter.WriteStartArray();

                while (read.Read())
                {
                    jsonWriter.WriteStartObject();

                    int fields = read.FieldCount;

                    for (int i = 0; i < fields; i++)
                    {
                        jsonWriter.WritePropertyName(read.GetName(i));
                        jsonWriter.WriteValue(read[i]);
                    }

                    jsonWriter.WriteEndObject();
                }

                jsonWriter.WriteEndArray();
            }

            return sw.ToString();
        }
        //end GetBooksByCategoryAsync
    }
}
