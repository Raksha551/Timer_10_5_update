using Evaluation2_Screens;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Configuration;

namespace Task_8
{
    public class DataBaseHelper
    {
        private static string connectionString ;
        DataTable dt = new DataTable();
        DataTable dt_month = new DataTable();
        List<DataTable> dtList = new List<DataTable>();

        public class ColumnNames{
            public string MachineInterfaceID { get; set; }
            public string MachineID { get; set; }
            public string LatestOpnDescription { get; set; }
            public string ShiftDownTime { get; set; }
             public string ShiftOEE { get; set; }
            public string DayDownTime { get; set; }
            public string DayRejCount { get; set; }
            public string MonthRejCount { get; set; }
            public string MonthLevel_KWH { get; set; }
            public string HelpReqStatus { get; set; }
            public string ShiftPartCount { get; set; }
            public string ShiftTarget { get; set; }
            public string ShiftPartCountstyle { get; set; }
            public string ShiftTargetstyle { get; set; }
            public string MonthPartCount { get; set; }
            public string MonthTarget { get; set; }
            public string DayPartCount { get; set; }
            public string DayTarget { get; set; }
            public string DayPartCountstyle { get; set; }
            public string DayTargetstyle { get; set; }
            public string YearPartCount { get; set; }
            public string YearTarget { get; set; }
            public string ReqRate { get; set; }
            public string ReqRateData { get; set; }
            public string AskRate { get; set; }
            public string HitRate { get; set; }
            public string AskRateData { get; set; }
            public string HitRateData { get; set; }
            public string UtilisedTimeInSec { get; set; }
            public string TargetVal { get; set; }
            public string DownCategory { get; set; }
            public string DownTimeInSec { get; set; }
            public string WeekNo { get; set; }
            public DateTime pDate { get; set; }
            public MonthData MonthData { get; set; }
            public WeekData WeekData { get; set; }

        }
      
        public class MonthData
        {
            public List<double> TargetVal { get; set; }
            public List<string> DownCategory { get; set; }
            public List<double> DownTimeInSec { get; set; }
            public List<double> UtilisedTimeInSec { get; set; }
            public List<int> WeekNo { get; set; }
            public List<DateTime> pDate { get; set; }

            public MonthData()
            {
                TargetVal = new List<double>();
                DownCategory = new List<string>();
                DownTimeInSec = new List<double>();
                UtilisedTimeInSec = new List<double>();
                pDate = new List<DateTime>();
            }
        }
        public class WeekData
        {
            public List<double> TargetVal { get; set; }
            public List<string> DownCategory { get; set; }
            public List<double> DownTimeInSec { get; set; }
            public List<double> UtilisedTimeInSec { get; set; }
         
            public List<DateTime> pDate { get; set; }

            public WeekData()
            {
                TargetVal = new List<double>();
                DownCategory = new List<string>();
                DownTimeInSec = new List<double>();
                UtilisedTimeInSec = new List<double>();
              
                pDate = new List<DateTime>();
            }
        }

        public class chartValues
        {
          
        }
        public DataBaseHelper()
        {
           connectionString = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        }

        public DataTable FetchDBData(string param="", string PlantID="", string MachineID="")
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlDataReader rdr = null;
            try
            {
                using (SqlCommand cmd = new SqlCommand("S_GetMachineWiseAndonDetails_SAF", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;
                    cmd.Parameters.AddWithValue("@Param", param);
                    cmd.Parameters.AddWithValue("@PlantID", PlantID);
                    cmd.Parameters.AddWithValue("@MachineID", MachineID);
                    con.Open();
                    rdr = cmd.ExecuteReader();
                    if (rdr.HasRows)
                    {                       
                            dt.Load(rdr);
                           
                    }
                   
                    //SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    //ad.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("FetchDBData : " + ex.Message);
            }
            finally
            {
                 if(rdr!= null) { rdr.Close();   rdr.Dispose(); }
                if (con != null) { con.Close(); con.Dispose(); }   
               
            }
            return dt;

        }

        public List<DataTable> FetchDBData_monthWeek(string param, string PlantID = "", string MachineID = "")
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlDataReader rdr = null;
            List<DataTable> tables = new List<DataTable>();
            try
            {
                using (SqlCommand cmd = new SqlCommand("S_GetMachineWiseAndonDetails_SAF", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;
                    cmd.Parameters.AddWithValue("@Param", param);
                    cmd.Parameters.AddWithValue("@PlantID", PlantID);
                    cmd.Parameters.AddWithValue("@MachineID", MachineID);
                    con.Open();


                    rdr = cmd.ExecuteReader();
                    if (rdr.HasRows)
                    {
                        var dt = new DataTable();
                        var dt2 = new DataTable();
                        dt.Load(rdr);
                        dt.AcceptChanges();
                        tables.Add(dt);
                        dt2.Load(rdr);
                        dt2.AcceptChanges();
                        tables.Add(dt2);


                    }
                    //do
                    //{
                    //    var dt = new DataTable();
                    //    dt.Load(rdr);
                    //    dtList.Add(dt);

                    //} while (!rdr.IsClosed && rdr.Read()) ;
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("FetchDBData : " + ex.Message);
            }
            finally
            {
                if (rdr != null) { rdr.Close(); rdr.Dispose(); }
                if (con != null) { con.Close(); con.Dispose(); }

            }
            return tables;

        }
        public List<DataTable> FetchDBData_Week(string param, string PlantID = "", string MachineID = "")
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlDataReader rdr = null;
            List<DataTable> tables = new List<DataTable>();
            try
            {
                using (SqlCommand cmd = new SqlCommand("S_GetMachineWiseAndonDetails_SAF", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;
                    cmd.Parameters.AddWithValue("@Param", param);
                    cmd.Parameters.AddWithValue("@PlantID", PlantID);
                    cmd.Parameters.AddWithValue("@MachineID", MachineID);
                    con.Open();


                    rdr = cmd.ExecuteReader();
                    if (rdr.HasRows)
                    {
                        var dt = new DataTable();
                        var dt2 = new DataTable();
                        dt.Load(rdr);
                        dt.AcceptChanges();
                        tables.Add(dt);
                        dt2.Load(rdr);
                        dt2.AcceptChanges();
                        tables.Add(dt2);


                    }
                    //do
                    //{
                    //    var dt = new DataTable();
                    //    dt.Load(rdr);
                    //    dtList.Add(dt);

                    //} while (!rdr.IsClosed && rdr.Read()) ;
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("FetchDBData : " + ex.Message);
            }
            finally
            {
                if (rdr != null) { rdr.Close(); rdr.Dispose(); }
                if (con != null) { con.Close(); con.Dispose(); }

            }
            return tables;

        }
    }
}