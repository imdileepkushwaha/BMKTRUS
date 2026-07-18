using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTier;
using System.Data;
using System.Data.SqlClient;


    public class clsUtility
    {

        public static string ProjectName { get { return "BMK TRUST"; } }
        public static string ProjectAbbreviation { get { return "BMK TRUST"; } }
        public static string ProjectWebsite { get { return "https://bmktrust.org/"; } }
        public static string Company { get { return "BMK TRUST"; } }
        public static string Session { get { return "20226-27"; } }

        public static string Day { get { return DateTime.Now.ToString("ddd, MMM dd, yyyy"); } }

    }

