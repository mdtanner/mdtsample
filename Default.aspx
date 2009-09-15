using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MQClientInterface;
using BatchMaps;

public partial class _Default : System.Web.UI.Page 
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Expires = 0;

        int tmpTime = DateTime.Now.Millisecond * DateTime.Now.Second * DateTime.Now.Minute;
        Image1.ImageUrl = "~/mapImage.gif?" + tmpTime.ToString();
    }



    // just the bare code needed to work ... DOES NOT INCLUDE EXCEPTION CHECKING
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!SecurityCode.Text.Equals("8fWb90.mn0z7"))
        {
            return;
        }

        MapRouter router = new MapRouter();

        // origin address:
        router.Addr1_Street = Addr1_Street.Text;
        router.Addr1_City = Addr1_City.Text;
        router.Addr1_State = Addr1_State.Text;
        router.Addr1_PostalCode = Addr1_Zip.Text;
        router.Addr1_Country = Addr1_Country.Text;
        
        // destination address:
        router.Addr2_Street = Addr2_Street.Text;
        router.Addr2_City = Addr2_City.Text;
        router.Addr2_State = Addr2_State.Text;
        router.Addr2_PostalCode = Addr2_Zip.Text;
        router.Addr2_Country = Addr2_Country.Text;

        router.FilePath = @"C:\Users\Michael\www\BatchMaps1\";
        router.FileName = "mapImage.gif";

        MapResponse response = router.RetrieveAndSaveMap();

	//return null;

    }

}


