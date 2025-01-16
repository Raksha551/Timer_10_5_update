using Evaluation2_Screens;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Task_8;
using static Task_8.DataBaseHelper;

namespace Task_8
{
    public partial class Timer_30_10_charts : System.Web.UI.Page
    {
        DataTable dt_emptyparameters = new DataTable();
        DataTable dt_monthparameters = new DataTable();
        DataTable dt_yearparameters = new DataTable();
        DataBaseHelper dbhelper = new DataBaseHelper();
        List<DataTable> dt_monthlist = new List<DataTable>();
        List<DataTable> dt_weaklist = new List<DataTable>();

        private static int currentIndex = 0;
        private List<DataBaseHelper.ColumnNames> list
        {
            get { return Session["DataList"] as List<DataBaseHelper.ColumnNames>; }
            set { Session["DataList"] = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    loaddateTime();
                    fetchDbdata();
                  
                    if (list.Count > 0)
                    {
                        BindRow(currentIndex); // Displays first row of DB
                    }
                }
                catch (Exception ex)
                {
                    Logger.WriteErrorLog($"Page_Load Error: {ex.Message}");
                }

            }
        }
        public void loaddateTime()
        {
            currentDate.Text = DateTime.Now.ToString("MMM dd yyyy");
            currentTime.Text = DateTime.Now.ToString("hh:mm:ss");
        }

        public void fetchDbdata()
        {
            try
            {
                dt_emptyparameters = dbhelper.FetchDBData();
                // dt_monthparameters = dbhelper.FetchDBData_month("AggMonthDataForAndon");
                // dt_yearparameters = dbhelper.FetchDBData_month("AggWeekDataForAndon");


                if (dt_emptyparameters != null && dt_emptyparameters.Rows.Count > 0)
                {

                    var tempList = new List<DataBaseHelper.ColumnNames>();
                    for (int i = 0; i < dt_emptyparameters.Rows.Count; i++)
                    {
                        DataBaseHelper.ColumnNames data = new DataBaseHelper.ColumnNames();

                        data.MachineID = dt_emptyparameters.Rows[i]["MachineID"].ToString();
                        data.MachineInterfaceID = "Model No: " + dt_emptyparameters.Rows[i]["MachineInterfaceID"].ToString();
                        data.LatestOpnDescription = dt_emptyparameters.Rows[i]["LatestOpnDescription"].ToString();
                        data.ShiftDownTime = dt_emptyparameters.Rows[i]["ShiftDownTime"].ToString();
                        data.ShiftOEE = dt_emptyparameters.Rows[i]["ShiftOEE"].ToString();
                        data.DayDownTime = dt_emptyparameters.Rows[i]["DayDownTime"].ToString();
                        data.DayRejCount = dt_emptyparameters.Rows[i]["DayRejCount"].ToString();
                        data.MonthRejCount = dt_emptyparameters.Rows[i]["MonthRejCount"].ToString();
                        data.MonthLevel_KWH = dt_emptyparameters.Rows[i]["MonthLevel_KWH"].ToString();
                        data.HelpReqStatus = dt_emptyparameters.Rows[i]["HelpReqStatus"].ToString();
                        data.MonthPartCount = dt_emptyparameters.Rows[i]["MonthPartCount"].ToString();
                        data.MonthTarget = dt_emptyparameters.Rows[i]["MonthTarget"].ToString();
                        data.YearPartCount = dt_emptyparameters.Rows[i]["YearPartCount"].ToString();
                        data.YearTarget = dt_emptyparameters.Rows[i]["YearTarget"].ToString();
                        data.DayPartCount = dt_emptyparameters.Rows[i]["DayPartCount"].ToString();
                        data.DayTarget = dt_emptyparameters.Rows[i]["DayTarget"].ToString();
                        data.ShiftPartCount = dt_emptyparameters.Rows[i]["ShiftPartCount"].ToString();
                        data.ShiftTarget = dt_emptyparameters.Rows[i]["ShiftTarget"].ToString();
                        data.ShiftPartCountstyle = $"background-color:blue;width:{((100 * Convert.ToDouble(dt_emptyparameters.Rows[i]["ShiftPartCount"])) / Convert.ToDouble(dt_emptyparameters.Rows[i]["ShiftTarget"])).ToString()}%";
                        data.ShiftTargetstyle = $"background-color:#393433;width:{((100 * Convert.ToDouble(dt_emptyparameters.Rows[i]["ShiftTarget"])) / Convert.ToDouble(dt_emptyparameters.Rows[i]["ShiftTarget"])).ToString()}%";
                        data.DayPartCountstyle = $"background-color:blue;width:{((100 * Convert.ToDouble(dt_emptyparameters.Rows[i]["DayPartCount"])) / Convert.ToDouble(dt_emptyparameters.Rows[i]["DayTarget"])).ToString()}%";
                        data.DayTargetstyle = $"background-color:#393433;width:{((100 * Convert.ToDouble(dt_emptyparameters.Rows[i]["DayTarget"])) / Convert.ToDouble(dt_emptyparameters.Rows[i]["DayTarget"])).ToString()}%";
                        data.YearPartCount = dt_emptyparameters.Rows[i]["YearPartCount"].ToString();
                        data.YearTarget = dt_emptyparameters.Rows[i]["YearTarget"].ToString();
                        data.ReqRate = dt_emptyparameters.Rows[i]["ReqRate"].ToString();
                        data.HitRate = dt_emptyparameters.Rows[i]["HitRate"].ToString();
                        data.AskRate = dt_emptyparameters.Rows[i]["AskRate"].ToString();
                        data.ReqRateData = $"background-color:blue;width:{((100 * Convert.ToDouble(dt_emptyparameters.Rows[i]["ReqRate"])) / 7000).ToString()}%";
                        data.HitRateData = $"background-color:fuchsia;width:{((100 * Convert.ToDouble(dt_emptyparameters.Rows[i]["HitRate"])) / 300).ToString()}%";
                        data.AskRateData = $"background-color:green;width:{((100 * Convert.ToDouble(dt_emptyparameters.Rows[i]["AskRate"])) / 25600).ToString()}%";
                        tempList.Add(data);
                        HttpContext.Current.Session["MachineID"] = data.MachineID;

                    }
                    list = tempList;
                }
                //listview1.DataSource = list;
                //listview1.DataBind();

            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"fetchDbdata Error: {ex.Message}");
            }
           

        }
        // Dictionary to store data for each MachineID
        private static Dictionary<string, Dictionary<string, object>> machineDataDictionary = new Dictionary<string, Dictionary<string, object>>();
        private static Dictionary<string, Dictionary<string, object>> machineWeekDataDictionary = new Dictionary<string, Dictionary<string, object>>();

        // Method to fetch and store month data for a specific machine
        private void FetchMonthDataForMachine(DataBaseHelper.ColumnNames row)
        {
            try
            {
                dt_monthlist = dbhelper.FetchDBData_monthWeek("AggMonthDataForAndon");

                DataTable dt_month1 = dt_monthlist[0];
                DataTable dt_month2 = dt_monthlist[1];

              
                var machineData = new Dictionary<string, object>();

                // Extract the MachineID from the current row in singleRowList.
                string machineID = row.MachineID;
              
                var month1Data = dt_month1.AsEnumerable()
                    .Where(r => r.Field<string>("MachineID") == machineID)
                    .Select(r => new
                    {
                        Targetval = r.Field<Double>("TargetVal"),
                        WeekNo = r.Field<int>("WeekNo")
                    })
                    .ToList();

                // Store the month1 data in the dictionary.
                if (month1Data.Any())
                {
                    machineData["TargetVal"] = month1Data.Select(d => d.Targetval).ToList();
                    machineData["WeekNo"] = month1Data.Select(d => d.WeekNo).ToList();
                }

                // Fetch data from dt_month2 where MachineID matches
                var month2Data = dt_month2.AsEnumerable()
                    .Where(r => r.Field<string>("MachineID") == machineID)
                    .Select(r => new
                    {
                        DownCategory = r.Field<string>("DownCategory"),
                        DownTimeInSec = r.Field<Double>("DownTimeInSec"), 
                        UtilisedTimeInSec = r.Field<Double>("UtilisedTimeInSec")  
                    })
                    .ToList();

                // Store the month2 data in the dictionary.
                if (month2Data.Any())
                {
                    machineData["DownCategory"] = month2Data.Select(d => d.DownCategory).ToList();
                    machineData["DownTimeInSec"] = month2Data.Select(d => d.DownTimeInSec).ToList();
                    machineData["UtilisedTimeInSec"] = month2Data.Select(d => d.UtilisedTimeInSec).ToList();
                }

                // Add or update the dictionary for the MachineID
                if (!machineDataDictionary.ContainsKey(machineID))
                {
                    machineDataDictionary.Add(machineID, machineData);
                }
                else
                {
                   
                    machineDataDictionary[machineID] = machineData;
                }
                HttpContext.Current.Session["MachineID"]= machineID;
                SendMonthDataToAjax();


            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"FetchMonthDataForMachine Error: {ex.Message}");
            }
            // Fetch the required data for the month

        }

        private void FetchWeekDataForMachine(DataBaseHelper.ColumnNames row)
        {
            try
            {
               
                dt_weaklist = dbhelper.FetchDBData_monthWeek("AggWeekDataForAndon");

                DataTable dt_week1 = dt_weaklist[0];
                DataTable dt_week2 = dt_weaklist[1];               
                var machineweekData = new Dictionary<string, object>();

                // Extract the MachineID from the current row in singleRowList.
                string machineID = row.MachineID;

                // Fetch data from dt_week1 where MachineID matches
                var week1Data = dt_week1.AsEnumerable()
                    .Where(r => r.Field<string>("MachineID") == machineID)
                    .Select(r => new
                    {
                        Targetval = r.Field<Double>("TargetVal"),
                        pDate = r.Field<DateTime>("pDate")
                    })
                    .ToList();
              
                if (week1Data.Any())
                {
                    machineweekData["TargetVal"] = week1Data.Select(d => d.Targetval).ToList();
                    machineweekData["pDate"] = week1Data.Select(d => d.pDate).ToList();
                }

                var week2Data = dt_week2.AsEnumerable()
                    .Where(r => r.Field<string>("MachineID") == machineID)
                    .Select(r => new
                    {
                        DownCategory = r.Field<string>("DownCategory"),
                        DownTimeInSec = r.Field<Double>("DownTimeInSec"),
                        UtilisedTimeInSec = r.Field<Double>("UtilisedTimeInSec") 
                    })
                    .ToList();
           
                if (week2Data.Any())
                {
                    machineweekData["DownCategory"] = week2Data.Select(d => d.DownCategory).ToList();
                    machineweekData["DownTimeInSec"] = week2Data.Select(d => d.DownTimeInSec).ToList();
                    machineweekData["UtilisedTimeInSec"] = week2Data.Select(d => d.UtilisedTimeInSec).ToList();
                }

                if (!machineWeekDataDictionary.ContainsKey(machineID))
                {
                    machineWeekDataDictionary.Add(machineID, machineweekData);
                }
                else
                {
                    machineWeekDataDictionary[machineID] = machineweekData;
                }
                //  SendMonthDataToAjax(machineID);
                HttpContext.Current.Session["MachineID"] = machineID;

                SendWeekDataToAjax();
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"FetchWeekDataForMachine Error: {ex.Message}");
            }

        }

        private void BindRow(int index)
        {
            try
            {
                if (list == null || index >= list.Count) return;

                // var start = DateTime.Now;
                // System.Diagnostics.Debug.WriteLine($"BindRow Start: Index={index}");
                var singleRowList = new List<DataBaseHelper.ColumnNames> { list[index] };
                foreach (var row in singleRowList)
                {
                    FetchMonthDataForMachine(row);
                    FetchWeekDataForMachine(row);
                }
                // HttpContext.Current.Session["RowDataList"] = singleRowList;
                var rowData = singleRowList[0]; // Get the first item from the list
                HttpContext.Current.Session["ShiftOEE"] = rowData.ShiftOEE;
                HttpContext.Current.Session["YearPartCount"] = rowData.YearPartCount;
                HttpContext.Current.Session["YearTarget"] = rowData.YearTarget;
                HttpContext.Current.Session["MonthPartCount"] = rowData.MonthPartCount;
                HttpContext.Current.Session["MonthTarget"] = rowData.MonthTarget;
                SendBarChartDataToAjax();
                SendSolidGaugeDataToAjax();
                SendBarChartMonthDataToAjax();
                listview1.DataSource = singleRowList;
                listview1.DataBind();              
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"BindRow Error: {ex.Message}");
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                if (list == null || list.Count == 0) return;

                currentIndex++;
                if (currentIndex >= list.Count)
                {
                    currentIndex = 0; // Reset to the first row when reaching the end
                }
                //currentIndex = (currentIndex + 1) % list.Count;
                BindRow(currentIndex);
                loaddateTime();
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"Timer1_Tick Error: {ex.Message}");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static MonthData SendMonthDataToAjax()
        {
            MonthData monthData = new MonthData();

            try
            {
                // Replace this with your logic to fetch the machineID from the backend
                string machineID = HttpContext.Current.Session["MachineID"]?.ToString(); // Example: Fetch from session

                if (!string.IsNullOrEmpty(machineID) && machineDataDictionary.ContainsKey(machineID))
                {
                    var machineData = machineDataDictionary[machineID];

                    if (machineData.ContainsKey("TargetVal"))
                    {
                        monthData.TargetVal = (List<double>)machineData["TargetVal"];
                    }

                    if (machineData.ContainsKey("DownCategory"))
                    {
                        monthData.DownCategory = (List<string>)machineData["DownCategory"];
                    }

                    if (machineData.ContainsKey("DownTimeInSec"))
                    {
                        monthData.DownTimeInSec = (List<double>)machineData["DownTimeInSec"];
                    }

                    if (machineData.ContainsKey("UtilisedTimeInSec"))
                    {
                        monthData.UtilisedTimeInSec = (List<double>)machineData["UtilisedTimeInSec"];
                    }

                    if (machineData.ContainsKey("WeekNo"))
                    {
                        monthData.WeekNo = (List<int>)machineData["WeekNo"];
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"SendMonthDataToAjax Error: {ex.Message}");
            }

            // Return the month data as a JSON response
            return monthData;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static WeekData SendWeekDataToAjax()
        {
            WeekData weekData = new WeekData();

            try
            {
                // Replace this with your logic to fetch the machineID from the backend
                string machineID = HttpContext.Current.Session["MachineID"]?.ToString(); // Example: Fetch from session

                if (!string.IsNullOrEmpty(machineID) && machineWeekDataDictionary.ContainsKey(machineID))
                {
                    var machineData = machineWeekDataDictionary[machineID];

                    // Extract the "TargetVal" data
                    if (machineData.ContainsKey("TargetVal"))
                    {
                        weekData.TargetVal = (List<double>)machineData["TargetVal"];
                    }

                    // Extract the "DownCategory" data
                    if (machineData.ContainsKey("DownCategory"))
                    {
                        weekData.DownCategory = (List<string>)machineData["DownCategory"];
                    }

                    // Extract the "DownTimeInSec" data
                    if (machineData.ContainsKey("DownTimeInSec"))
                    {
                        weekData.DownTimeInSec = (List<double>)machineData["DownTimeInSec"];
                    }

                    // Extract the "UtilisedTimeInSec" data
                    if (machineData.ContainsKey("UtilisedTimeInSec"))
                    {
                        weekData.UtilisedTimeInSec = (List<double>)machineData["UtilisedTimeInSec"];
                    }

                    if (machineData.ContainsKey("pDate"))
                    {
                        weekData.pDate = (List<DateTime>)machineData["pDate"];
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error if necessary
                Logger.WriteErrorLog($"SendMonthDataToAjax Error: {ex.Message}");
            }

            // Return the week data as a JSON response
            return weekData;
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
      
        public static SolidGaugeData SendSolidGaugeDataToAjax()
        {
            SolidGaugeData solidGaugeData = new SolidGaugeData();

            try
            {
                // Retrieve the list from the session
               
                string ShiftOEE = HttpContext.Current.Session["ShiftOEE"]?.ToString();
               
               // var rowDataList = HttpContext.Current.Session["RowDataList"] as List<DataBaseHelper.ColumnNames>;

                if (ShiftOEE != null )
                {
                    // Fetch ShiftOEE from the first row in the list
                    solidGaugeData.ShiftOEE = Convert.ToDouble(ShiftOEE);
                }
            }
            catch (Exception ex)
            {
                // Log the error if necessary
                Logger.WriteErrorLog($"SendSolidGaugeDataToAjax Error: {ex.Message}");
            }

            return solidGaugeData;
        }


        // Data class for the solid gauge
        public class SolidGaugeData
        {
            public double ShiftOEE { get; set; }
        }
        
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static BarChartData SendBarChartDataToAjax()
        {
            BarChartData barChartData = new BarChartData();

            try
            {
                // Retrieve the list from the session
               // var rowDataList = HttpContext.Current.Session["RowDataList"] as String;
                string YearPartCount = HttpContext.Current.Session["YearPartCount"]?.ToString();
                string YearTarget = HttpContext.Current.Session["YearTarget"]?.ToString();

                if (YearPartCount != null && YearTarget != null)
                {
                    // Fetch YearPartCount and YearTarget from the first row in the list
                    barChartData.YearPartCount = Convert.ToDouble(YearPartCount);
                    barChartData.YearTarget = Convert.ToDouble(YearTarget);
                }
            }
            catch (Exception ex)
            {
                // Log the error if necessary
                Logger.WriteErrorLog($"SendBarChartDataToAjax Error: {ex.Message}");
            }

            return barChartData;
        }

        // Data class for the bar chart
        public class BarChartData
        {
            public double YearPartCount { get; set; }
            public double YearTarget { get; set; }
            public double MonthPartCount { get; set; }
            public double MonthTarget { get; set; }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static BarChartData SendBarChartMonthDataToAjax()
        {
            BarChartData barChartDatamonth = new BarChartData();

            try
            {
                // Retrieve the list from the session
                // var rowDataList = HttpContext.Current.Session["RowDataList"] as String;
                string MonthPartCount = HttpContext.Current.Session["MonthPartCount"]?.ToString();
                string MonthTarget = HttpContext.Current.Session["MonthTarget"]?.ToString();

                if (MonthPartCount != null && MonthTarget != null)
                {
                    // Fetch YearPartCount and YearTarget from the first row in the list
                    barChartDatamonth.MonthPartCount = Convert.ToDouble(MonthPartCount);
                    barChartDatamonth.MonthTarget = Convert.ToDouble(MonthTarget);
                }
            }
            catch (Exception ex)
            {
                // Log the error if necessary
                Logger.WriteErrorLog($"SendBarChartDataToAjax Error: {ex.Message}");
            }

            return barChartDatamonth;
        }

        // Data class for the bar chart
       
    }
}


//private void BindRow(int index)
//{
//    try
//    {
//        if (list == null || index >= list.Count) return;

//        // var start = DateTime.Now;
//        // System.Diagnostics.Debug.WriteLine($"BindRow Start: Index={index}");
//        var singleRowList = new List<DataBaseHelper.ColumnNames> { list[index] };

//        listview1.DataSource = singleRowList;
//        listview1.DataBind();
//        // System.Diagnostics.Debug.WriteLine($"BindRow End: Time Taken={(DateTime.Now - start).TotalMilliseconds}ms");
//    }
//    catch (Exception ex)
//    {
//        Logger.WriteErrorLog($"BindRow Error: {ex.Message}");
//    }
//}

//protected void Timer1_Tick(object sender, EventArgs e)
//{
//    try
//    {
//        if (list == null || list.Count == 0) return;

//        currentIndex++;
//        if (currentIndex >= list.Count)
//        {
//            currentIndex = 0; // Reset to the first row when reaching the end
//        }
//        //currentIndex = (currentIndex + 1) % list.Count;
//        BindRow(currentIndex);
//    }
//    catch (Exception ex)
//    {
//        Logger.WriteErrorLog($"Timer1_Tick Error: {ex.Message}");
//    }
//}