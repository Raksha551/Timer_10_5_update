<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timer_30_10_charts.aspx.cs" Inherits="Task_8.Timer_30_10_charts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <title></title>
    <style>
        body {
            background-color: black;
            color: white;
            margin-top: 0px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            text-align: center;
        }

        .header-center {
            width: 55%;
            height: 48px;
            background-color: #222222;
            border-radius: 10px;
            text-align: center;
            padding-top: 8px;
            margin-left: 100px;
        }

        .header-title {
            font-size: 35px;
            font-weight: bold;
            font-family: monospace;
        }

        .header-right {
            display: flex;
            font-size: 25px;
            flex-direction: column;
            font-weight: 550;
            font-family: sans-serif;
            line-height: 1;
            margin: 5px;
        }

        .shiftA {
            margin-left: 28%;
        }

        .firstRow {
            display: flex;
        }

        .TD {
            width: 30%;
            height: 40px;
            background-color: #222222;
            border-radius: 8px;
            text-align: center;
            padding: 2px;
            margin-right: 35px;
            margin-left: 35px;
            font-size: 30px;
            font-family: sans-serif;
            padding-top: 10px;
        }

        .machineid {
            margin-right: 30px;
            padding-top: 4px;
            padding-bottom: 6px;
        }

        #firstTD {
            padding-top: 4px;
            padding-bottom: 6px;
        }

        .ThirdRow {
            display: flex;
            margin-left: 60px;
            margin-right: 60px;
        }

        .thirdRowTD {
            margin-right: 10px;
            margin-left: 10px;
            border-radius: 10px;
            background-color: #222222;
            width: 200px;
            height: 120px;
        }

        .toplefttext {
            padding-top: 8px;
            font-size: 20px;
            font-family: sans-serif;
        }

        .toprighttext {
            font-size: 12px;
            padding-top: 12px;
            font-family: sans-serif;
        }

        .Boxdata {
            display: flex;
            justify-content: space-around;
            padding: 6px;
        }

        .Boxdata6 {
            display: flex;
            padding: 6px;
        }

        .subheading {
            font-size: 12px;
            padding-top: 15px;
            padding-left: 6px;
        }

        .row3image {
            padding-left: 20px;
        }

        .value {
            text-align: center;
            font-size: 30px;
            padding: 6px;
            color: orange;
            font-weight: 600;
            font-family: sans-serif;
        }

        .FourthRow {
            margin-right: 10px;
            margin-left: 10px;
        }

        .leftchart {
            background-color: #222222;
            width: 50%;
            margin-left: 60px;
            border-radius: 10px;
            margin-top: 20px;
        }

        .leftchartheading {
            justify-content: space-between;
            padding: 10px;
            padding-left: 20px;
            padding-left: 20px;
            padding-right: 20px;
        }

        .chartrightheading {
            padding-top: 6px;
            margin-top: 10px;
            background-color: black;
            border-radius: 10px;
            height: 24px;
        }

        .chartrightheading1 {
            background-color: black;
            padding-top: 6px;
            padding-left: 12px;
            padding-right: 12px;
            border-radius: 10px;
            margin-top: 20px;
        }

        .chartrightheading2 {
            background-color: #222222;
            padding-top: 5px;
            padding-bottom: 6px;
            padding-left: 12px;
            padding-right: 12px;
            border-radius: 10px;
        }

        .metric {
            margin-bottom: 12px;
            font-size: 18px;
            font-family: sans-serif;
        }

        .progress-bar {
            width: 100%;
            border-radius: 5px;
            overflow: hidden;
            height: 20px;
            position: relative;
        }

        .progress-fill {
            height: 100%;
            border-radius: 5px;
            background-color: #125999
        }

        .progress-bar1 {
            width: 80%;
            border-radius: 2px;
            overflow: hidden;
            height: 20px;
            position: relative;
            padding-bottom: 10px;
        }

        .progress-fill1 {
            height: 100%;
            border-radius: 2px;
            background-color: #125999
        }

        .secondrowTD {
            margin-right: 15px;
            background-color: #222222;
            width: 18%;
            border-radius: 15px;
        }

        .secondRow {
            margin-top: 20px;
            margin-bottom: 20px;
            display: flex;
        }

        .range {
            padding: 10px;
            padding-top: 30px;
            padding-left: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Timer runat="server" OnTick="Timer1_Tick" ID="Timer1" Interval="12000"></asp:Timer>
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server" ID="updatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <div style="padding: 15px;">
                        <div class="header">
                            <img runat="server" src="./Images/AmitLogo-Transparent.png" alt="Amit_Logo" style="width: 140px; height: 60px; background-color: black;" />
                            <div class="header-center">
                                <asp:Label runat="server" Text="ANDON-TPM Trak" class="header-title"></asp:Label>
                            </div>
                            <div class="header-right">
                                <asp:Label runat="server" ID="currentDate"></asp:Label>
                                <asp:Label runat="server" ID="currentTime" class="shiftA"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <asp:ListView runat="server" ID="listview1" ItemPlaceholderID="itemplaceholder">
                        <LayoutTemplate>
                            <div class="outerbody">
                                <div runat="server" id="itemplaceholder"></div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div runat="server" class="firstRow">
                                <div runat="server" class="TD" id="firstTD">
                                    <asp:Label runat="server" Text='<%# Eval("MachineInterfaceID") %>' CssClass="machineid"></asp:Label>
                                    <img runat="server" src="./Images/running.png" style="height: 26px;" />
                                </div>
                                <div runat="server" class="TD" id="secondTD">
                                    <asp:Label runat="server" Text='<%# Eval("MachineID") %>'></asp:Label>
                                </div>
                                <div runat="server" class="TD" id="thirdTD">
                                    <asp:Label runat="server" Text='<%# Eval("LatestOpnDescription") %>'></asp:Label>
                                </div>
                            </div>
                            <div runat="server" class="secondRow" style="display: flex; margin-left: 72px;">
                                <div runat="server" class="secondrowTD" style="padding-top: 15px;">
                                    <asp:Label runat="server" Text="OEE" Style="padding-left: 20px; font-size: 20px; font-family: sans-serif;"></asp:Label>
                                    <div style="display: flex; margin-top: 5px;">
                                        <div style="">
                                            <img runat="server" src="./Images/speedometer.png" class="row3image" style="width: 30px;" />
                                        </div>
                                        <asp:Label runat="server" Text="(%)" CssClass="toprighttext" Style="padding-left: 5px; font-size: 12px;"></asp:Label>

                                    </div>
                                    <div id="solidgaugecontainer" style="width: 60%; height: 200px; margin-left: 60px;"></div>
                                </div>

                                <div runat="server" class="secondrowTD" style="width: 28.3%;">
                                    <div style="display: flex; font-size: 28px; padding-top: 10px; padding-left: 10px; padding-bottom: 10px;">
                                        <asp:Label runat="server" Text="Part Count" CssClass="toplefttext" Style="font-size: 20px; padding-left: 15px;"></asp:Label>
                                        <asp:Label runat="server" Text="(no's)" CssClass="toprighttext" Style="padding-left: 10px; font-size: 16px; padding-top: 10px;"></asp:Label>
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" style="width: 30px;" />
                                    </div>
                                    <div class="range">
                                        <div class="metric" style="padding-right: 20px; padding-left: 10px; padding-bottom: 40px;">
                                            <div style="display: flex;">
                                                <label class="name" style="padding-right: 20px;">Shift 1</label>
                                                <div class="progress-bar1" style="display: flex">
                                                    <div id="" class="progress-fill1" style='<%# Eval("ShiftPartCountstyle") %>'></div>
                                                    <div id="" class="progress-fill1" style='<%# Eval("ShiftTargetstyle") %>'></div>
                                                </div>
                                            </div>
                                            <div style="display: flex; padding-left: 84px;">
                                                <div style="display: flex; padding-right: 20px;">
                                                    <div style="width: 10px; height: 10px; background-color: blue; border-radius: 50px; margin-right: 5px; margin-top: 2px;"></div>
                                                    <label class="availdata" style="padding-right: 5px;">Actual - </label>
                                                    <label class="availdata"><%# Eval("ShiftPartCount") %></label>
                                                </div>
                                                <div style="display: flex; padding-right: 20px;">
                                                    <div style="width: 10px; height: 10px; background-color: #393433; border-radius: 50px; margin-right: 5px; margin-top: 2px;"></div>
                                                    <label class="availdata" style="padding-right: 5px;">Target - </label>
                                                    <label class="availdata"><%# Eval("ShiftTarget") %></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="metric" style="padding-right: 20px; padding-left: 10px;">
                                            <div style="display: flex;">
                                                <label class="name" style="padding-right: 20px;">Day</label>
                                                <div class="progress-bar1" style="display: flex; margin-left: 16px;">
                                                    <div id="" class="progress-fill1" style='<%# Eval("DayPartCountstyle") %>'></div>
                                                    <div id="" class="progress-fill1" style='<%# Eval("DayTargetstyle") %>'></div>
                                                </div>
                                            </div>
                                            <div style="display: flex; padding-left: 84px;">
                                                <div style="display: flex; padding-right: 20px;">
                                                    <div style="width: 10px; height: 10px; background-color: blue; border-radius: 50px; margin-right: 5px; margin-top: 2px;"></div>
                                                    <label class="availdata" style="padding-right: 5px;">Actual - </label>
                                                    <label class="availdata"><%# Eval("DayPartCount") %></label>
                                                </div>
                                                <div style="display: flex; padding-right: 20px;">
                                                    <div style="width: 10px; height: 10px; background-color: #393433; border-radius: 50px; margin-right: 5px; margin-top: 2px;"></div>
                                                    <label class="availdata" style="padding-right: 5px;">Target - </label>
                                                    <label class="availdata"><%# Eval("DayTarget") %></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div runat="server" class="secondrowTD">
                                    <div style="display: flex; padding-top: 10px; padding-bottom: 0px;" class="leftchartheading">
                                        <div style="display: flex; font-size: 30px;">
                                            <asp:Label runat="server" Text="Part Count" CssClass="toplefttext" Style="font-size: 20px;"></asp:Label>
                                        </div>
                                        <div class="chartrightheading">
                                            <asp:Label runat="server" ID="labelMonth" ClientIDMode="Static" Text="month" CssClass="chartrightheading1"></asp:Label>
                                            <asp:Label runat="server" ID="labelYear" ClientIDMode="Static" Text="year" CssClass="chartrightheading2"></asp:Label>

                                        </div>
                                    </div>
                                    <div style="display: flex;">
                                        <div style="">
                                            <img runat="server" src="./Images/speedometer.png" class="row3image" style="width: 30px;" />
                                        </div>
                                        <asp:Label runat="server" Text="(no's)" CssClass="toprighttext" Style="padding-left: 10px; font-size: 16px; padding-top: 6px;"></asp:Label>

                                    </div>

                                    <div id="barchartcontainer" style="width: 60%; height: 180px; padding-left: 60px;"></div>
                                </div>
                                <div runat="server" stye="" class="secondrowTD" style="width: 28.3%">
                                    <div style="display: flex; font-size: 28px; padding-top: 10px; padding-left: 10px; padding-bottom: 10px;">
                                        <asp:Label runat="server" Text="Month To Date (MTD)" CssClass="toplefttext" Style="font-size: 20px;"></asp:Label>
                                        <asp:Label runat="server" Text="(no's)" CssClass="toprighttext" Style="padding-left: 10px; font-size: 16px;"></asp:Label>
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" style="width: 30px;" />
                                    </div>
                                    <div class="range">
                                        <div class="metric">
                                            <div style="display: flex; padding-bottom: 6px;">
                                                <label class="name" style="width: 50%">Req. Rate/Day</label>

                                                <div class="progress-bar">
                                                    <div id="" class="progress-fill" style='<%# Eval("AskRateData") %>'></div>
                                                </div>
                                            </div>
                                            <label class="" style="margin-left: 72%"><%# Eval("AskRate") %> </label>
                                        </div>
                                        <div class="metric">
                                            <div style="display: flex; padding-bottom: 6px;">
                                                <label class="name" style="width: 50%">Hit Rate/Day</label>

                                                <div class="progress-bar">
                                                    <div id="" class="progress-fill" style='<%# Eval("HitRateData") %>'></div>
                                                </div>
                                            </div>
                                            <label class="" style="margin-left: 67%"><%# Eval("HitRate") %></label>
                                        </div>
                                        <div class="metric">
                                            <div style="display: flex; padding-bottom: 6px;">
                                                <label class="name" style="width: 50%">Ask Rate/Day</label>

                                                <div class="progress-bar">
                                                    <div id="" class="progress-fill" style='<%# Eval("ReqRateData") %>'></div>
                                                </div>
                                            </div>
                                            <label class="qualitydata" style="margin-left: 85%"><%# Eval("ReqRate") %></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div runat="server" class="ThirdRow">
                                <div runat="server" id="thirdRowTD1" class="thirdRowTD">
                                    <div class="Boxdata">
                                        <asp:Label runat="server" Text="Idle Time" Style="" CssClass="toplefttext"></asp:Label>
                                        <asp:Label runat="server" Text="(Shift 1)" CssClass="toprighttext"></asp:Label>
                                    </div>
                                    <div class="" style="display: flex">
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" />
                                        <asp:Label runat="server" Text="(HH:MM)" CssClass="subheading"></asp:Label>
                                    </div>
                                    <div class="value">
                                        <asp:Label runat="server" Text='<%# Eval("ShiftDownTime") %>'></asp:Label>
                                    </div>
                                </div>
                                <div runat="server" class="thirdRowTD">
                                    <div class="Boxdata">
                                        <asp:Label runat="server" Text="Idle Time" CssClass="toplefttext"></asp:Label>
                                        <asp:Label runat="server" Text="(Cumulative)" CssClass="toprighttext" Style=""></asp:Label>
                                    </div>
                                    <div style="display: flex">
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" />
                                        <asp:Label runat="server" Text="(HH:MM)" CssClass="subheading"></asp:Label>
                                    </div>
                                    <div class="value">
                                        <asp:Label runat="server" Text='<%# Eval("DayDownTime") %>'></asp:Label>
                                    </div>
                                </div>
                                <div runat="server" class="thirdRowTD">
                                    <div class="Boxdata">
                                        <asp:Label runat="server" Text="Rejection" CssClass="toplefttext"></asp:Label>
                                        <asp:Label runat="server" Text="(Today)" CssClass="toprighttext"></asp:Label>
                                    </div>
                                    <div style="display: flex">
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" />
                                        <asp:Label runat="server" Text="(no's)" CssClass="subheading" Style="font-size: 14px; padding-top: 12px;"></asp:Label>
                                    </div>
                                    <div class="value" style="color: red">
                                        <asp:Label runat="server" Text='<%# Eval("DayRejCount") %>'></asp:Label>
                                    </div>
                                </div>
                                <div runat="server" class="thirdRowTD">
                                    <div class="Boxdata">
                                        <asp:Label runat="server" Text="Rejection" CssClass="toplefttext"></asp:Label>
                                        <asp:Label runat="server" Text="(Cumulative)" CssClass="toprighttext" Style=""></asp:Label>
                                    </div>
                                    <div style="display: flex">
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" />
                                        <asp:Label runat="server" Text="(no's)" CssClass="subheading" Style="font-size: 14px; padding-top: 12px;"></asp:Label>
                                    </div>
                                    <div class="value" style="color: red">
                                        <asp:Label runat="server" Text='<%# Eval("MonthRejCount") %>'></asp:Label>
                                    </div>
                                </div>
                                <div runat="server" class="thirdRowTD">
                                    <div class="Boxdata">
                                        <asp:Label runat="server" Text="Power" CssClass="toplefttext"></asp:Label>
                                        <asp:Label runat="server" Text="(Cumulative)" CssClass="toprighttext" Style=""></asp:Label>
                                    </div>
                                    <div style="display: flex">
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" />
                                        <asp:Label runat="server" Text="(kwh)" CssClass="subheading" Style="font-size: 14px; padding-top: 12px;"></asp:Label>
                                    </div>
                                    <div class="value" style="color: green">
                                        <asp:Label runat="server" Text='<%# Eval("MonthLevel_KWH") %>'></asp:Label>
                                    </div>
                                </div>
                                <div runat="server" class="thirdRowTD" style="width: 35.4%; font-size: 20px;">
                                    <div class="Boxdata6">
                                        <asp:Label runat="server" Text="Current Downtime Reason" CssClass="toplefttext"></asp:Label>
                                    </div>
                                    <div style="display: flex">
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" />
                                        <asp:Label runat="server" Text='<%# Eval("HelpReqStatus") %>' Style="color: red; padding: 8px; padding-top: 12px;"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
            <div runat="server" class="FourthRow" style="display: flex; margin-right: 75px;">
                <div class="leftchart" style="width: 47.3%;">
                    <div style="display: flex;" class="leftchartheading">
                        <div style="display: flex; font-size: 30px;">
                            <asp:Label runat="server" Text="Monthly Production" CssClass="toplefttext" Style="font-size: 24px;"></asp:Label>
                            <asp:Label runat="server" Text="(no's)" CssClass="toprighttext" Style="padding-left: 10px; font-size: 18px; padding-top: 14px;"></asp:Label>
                            <img runat="server" src="./Images/speedometer.png" class="row3image" style="width: 30px;" />
                        </div>
                        <div class="chartrightheading">
                            <asp:Label runat="server" ID="weeklabel2" Text="week" CssClass="chartrightheading1"></asp:Label>
                            <asp:Label runat="server" ID="monthlabel2" Text="month" CssClass="chartrightheading2"></asp:Label>
                        </div>
                    </div>
                    <div id="leftchartcontainer" style="width: 80%; height: 200px; background-color: #222222; margin-left: 90px; padding: 5px; border-radius: 10px;"></div>
                </div>
                <div class="leftchart" style="margin-left: 20px; width: 47.3%;">
                    <div style="display: flex;" class="leftchartheading">
                        <div style="display: flex; font-size: 30px;">
                            <asp:Label runat="server" Text="Monthly Time Analysis" CssClass="toplefttext" Style="font-size: 24px;"></asp:Label>
                            <asp:Label runat="server" Text="(HH:MM)" CssClass="toprighttext" Style="padding-left: 10px; font-size: 18px; padding-top: 14px;"></asp:Label>
                            <img runat="server" src="./Images/speedometer.png" class="row3image" style="width: 30px;" />
                        </div>
                        <div class="chartrightheading">
                            <asp:Label runat="server" ID="weeklabel1" Text="week" CssClass="chartrightheading1"></asp:Label>
                            <asp:Label runat="server" ID="monthlabel1" Text="month" CssClass="chartrightheading2"></asp:Label>
                        </div>
                    </div>
                    <div id="rightcontainer" style="width: 80%; height: 200px; background-color: #222222; padding: 5px; padding-left: 80px; border-radius: 10px;"></div>
                </div>


            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(document).ready(function () {
            // To hold the chart instance globally

            let isWeekData = false;
            let isMonthData = false;// Flag to toggle between week and month data
            let iterationCount = 0; // Counter for interval execution

            // Initial fetch and render
            fetchChartData(); // Fetch and render month data by default
            fetchSolidGaugeData();
            fetchBarChartData();

            fetchStackedBarChartData();


            setInterval(function () {
                // Toggle between week and month data every 5 seconds
                console.log("Iteration Count:", iterationCount); // Debugging iteration count
                //if (iterationCount % 2 === 0) {
                console.log("Switching classes for la bels");

                if (isWeekData) {
                    fetchWeekChartData();
                    fetchWeekStackedBarChartData();
                    fetchBarChartMonthData();
                    $("#weeklabel1").removeClass("chartrightheading1").addClass("chartrightheading2");
                    $("#monthlabel1").removeClass("chartrightheading2").addClass("chartrightheading1");
                    $("#weeklabel2").removeClass("chartrightheading1").addClass("chartrightheading2");
                    $("#monthlabel2").removeClass("chartrightheading2").addClass("chartrightheading1");
                    $("#labelMonth").removeClass("chartrightheading1").addClass("chartrightheading2");
                    $("#labelYear").removeClass("chartrightheading2").addClass("chartrightheading1");

                } else {
                    fetchChartData();
                    fetchStackedBarChartData();
                    fetchBarChartData();
                    $("#weeklabel1").removeClass("chartrightheading2").addClass("chartrightheading1");
                    $("#monthlabel1").removeClass("chartrightheading1").addClass("chartrightheading2");
                    $("#weeklabel2").removeClass("chartrightheading2").addClass("chartrightheading1");
                    $("#monthlabel2").removeClass("chartrightheading1").addClass("chartrightheading2");
                    $("#labelMonth").removeClass("chartrightheading2").addClass("chartrightheading1");
                    $("#labelYear").removeClass("chartrightheading1").addClass("chartrightheading2");
                }

                isMonthData = !isMonthData;
                isWeekData = !isWeekData;

                // Increment the counter
            }, 6000); // Interval of 5 seconds

            setInterval(function () {
                fetchSolidGaugeData(); // Fetch solid gauge data every 10 seconds
            }, 12000); // Interval of 10 seconds
            const prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                fetchChartData();
                fetchSolidGaugeData();
                fetchBarChartData();
                fetchStackedBarChartData(); // Update stacked bar chart data after UpdatePanel update
                fetchWeekChartData();// Fetch stacked bar chart data
                fetchWeekStackedBarChartData();

            });

            //  $("[id$=lblMonth]")
        });


        function fetchChartData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendMonthDataToAjax", // Replace with the actual page name
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Received Month Data:", data);
                    renderCombinedChart(data, false);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching Month chart data:", error);
                }
            });
        }

        function fetchWeekChartData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendWeekDataToAjax", // Replace with the actual page name
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Received Week Data:", data);
                    data.pDate = data.pDate.map(dateString => formatDate(dateString));
                    renderCombinedChart(data, true); // Render chart with week data
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching Week chart data:", error);
                }
            });
        }

        function fetchSolidGaugeData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendSolidGaugeDataToAjax", // Replace with actual page name
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Solid Gauge Data:", data);
                    initializeSolidGauge(data);// Update the solid gauge
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching solid gauge data:", error);
                }
            });
        }

        function fetchBarChartData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendBarChartDataToAjax", // Replace with actual page name
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Bar Chart year Data:", data);
                    initializeBarChart(data.YearTarget, data.YearPartCount); // Update the bar chart
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching bar chart year data:", error);
                }
            });
        }
        function fetchBarChartMonthData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendBarChartMonthDataToAjax", // Replace with actual page name
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Bar Chart month Data:", data);
                    initializeBarChart(data.MonthTarget, data.MonthPartCount);// Update the bar chart
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching bar chart month data:", error);
                }
            });
        }

        function fetchStackedBarChartData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendMonthDataToAjax",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Stacked Bar Chart Data:", data);
                    renderStackedBarChart(data);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching Month stacked bar chart data:", error);
                }
            });
        }
        function fetchWeekStackedBarChartData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendWeekDataToAjax",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Stacked Bar Chart Data Week:", data);
                    renderStackedBarChart(data);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching stacked bar chart data:", error);
                }
            });
        }
        function formatDate(dateString) {
            // Remove the "/Date(" and the closing ")/" to get the timestamp
            const timestamp = dateString.replace(/\/Date\((\d+)\)\//, '$1');

            // Convert the timestamp to a JavaScript Date object
            const date = new Date(parseInt(timestamp, 10));

            // Check if the date is valid
            if (isNaN(date.getTime())) {
                console.error("Invalid date format:", dateString);
                return "Invalid Date"; // Return a default value for invalid dates
            }

            // Extract the day and month
            const day = String(date.getDate()).padStart(2, '0'); // Ensure 2-digit day
            const month = String(date.getMonth() + 1).padStart(2, '0'); // Ensure 2-digit month

            // Return the formatted date as "DD-MM"
            return `${day}/${month}`;
        }


        let chartInstance;
        function renderCombinedChart(data, isWeekData) {
            const xAxisData = isWeekData ? data.pDate : data.WeekNo; // Use pDate for week data, WeekNo for month data
            const numericXData = xAxisData.map((_, index) => index + 1); // For numeric trend line calculation
            const trendLineData = calculateTrendLine(numericXData, data.UtilisedTimeInSec);

            if (!chartInstance) {
                // Initialize chart if not already done
                chartInstance = Highcharts.chart('leftchartcontainer', {
                    chart: {
                        zoomType: 'xy',
                        backgroundColor: '#222222',
                        animation: false,// Set the background to black
                    },
                    credits: {
                        enabled: false
                    },
                    exporting: {
                        enabled: false
                    },
                    title: {
                        text: '',
                        style: {
                            color: 'white' // Set title text color to white
                        }
                    },
                    xAxis: {
                        categories: xAxisData,
                        title: {
                            text: isWeekData ? 'Dates' : 'Days',
                            style: {
                                color: 'white' // Set x-axis title color to white
                            }
                        },
                        labels: {
                            style: {
                                color: 'white' // Set x-axis labels color to white
                            }
                        },
                        gridLineWidth: 0, // Add vertical grid lines
                        gridLineColor: '#ffffff',
                        lineWidth: 1,
                        lineColor: '#ddd',
                    },
                    yAxis: [
                        {
                            title: {
                                text: 'No\'s',
                                style: {
                                    color: 'white' // Set left y-axis title color to white
                                }
                            },
                            labels: {
                                style: {
                                    color: 'white' // Set left y-axis labels color to white
                                }
                            },
                            gridLineWidth: 0,
                            lineWidth: 1,
                            lineColor: '#ddd',
                        },

                        {
                            visible: false // Hide the right-side y-axis for Target Value
                        },
                        // Remove X-axis line
                    ],
                    tooltip: {
                        shared: true,
                        formatter: function () {
                            let tooltip = `<b>Week: ${this.x}</b><br/>`;
                            this.points.forEach(point => {
                                tooltip += `<span style="color:${point.color}">\u25CF</span> ${point.series.name}: ${point.y}<br/>`;
                            });
                            return tooltip;
                        }
                    },
                    series: [
                        {
                            type: 'column',
                            name: 'Production',
                            data: data.UtilisedTimeInSec,
                            tooltip: { valueSuffix: ' sec' },
                            color: '#7cb5ec', // Adjust the column color as per preference
                            dataLabels: {
                                enabled: true, // Enable data labels
                                color: 'white', // Set data label text color to white
                                style: {
                                    textOutline: 'none', // Remove the outline around data labels
                                    fontWeight: 'bold' // Make the font weight bold
                                },
                                formatter: function () {
                                    return this.y; // Display the value of each data point
                                }
                            }
                        },
                        {
                            type: 'line',
                            name: 'Target',
                            yAxis: 1,
                            marker: { enabled: false },
                            data: data.TargetVal,
                            tooltip: { valueSuffix: '' },
                            color: '#FFA500', // Adjust the line color for Target Value
                            dataLabels: {
                                enabled: true, // Enable data labels
                                color: 'white', // Set data label text color to white
                                style: {
                                    textOutline: 'none', // Remove the outline around data labels
                                    fontWeight: 'bold' // Make the font weight bold
                                },
                                formatter: function () {
                                    return this.y; // Display the value of each data point
                                }
                            }
                        },
                        {
                            type: 'line',
                            name: '2 per.mov.Avg.(Production)',
                            data: trendLineData,
                            marker: { enabled: false },
                            dashStyle: 'solid',
                            tooltip: { valueSuffix: ' sec' },
                            color: '#ff0000', // Adjust the trend line color
                            dataLabels: {
                                enabled: true, // Enable data labels
                                color: 'white', // Set data label text color to white
                                style: {
                                    textOutline: 'none', // Remove the outline around data labels
                                    fontWeight: 'bold' // Make the font weight bold
                                },
                                formatter: function () {
                                    return this.y; // Display the value of each data point
                                }
                            }
                        }
                    ],
                    legend: {
                        enabled: true, // Make sure the legend is enabled
                        layout: 'vertical', // Arrange legend items vertically
                        align: 'right', // Align legend to the right side
                        verticalAlign: 'middle', // Vertically center the legend
                        itemStyle: {
                            color: 'white' // Set the legend text color to white
                        }
                    }
                });
            } else {
                if (chartInstance.xAxis && chartInstance.series) {
                    chartInstance.xAxis[0].setCategories(xAxisData, false);
                    chartInstance.series[0].setData(data.UtilisedTimeInSec, false);
                    chartInstance.series[1].setData(data.TargetVal, false);
                    chartInstance.series[2].setData(trendLineData, false);
                    chartInstance.redraw();
                } else {
                    console.error("Chart instance exists but is not properly initialized.");
                }
            }
        }

        function calculateTrendLine(xData, yData) {
            console.log("Calculating 2-period Moving Average with:", xData, yData);

            // Initialize an empty array to store the moving averages
            const trendLine = [];

            // Loop through the yData and calculate the 2-period moving average
            for (let i = 1; i < yData.length; i++) {
                const avg = (yData[i] + yData[i - 1]) / 2; // Average of the current and previous value
                trendLine.push(avg); // Store the calculated moving average
            }

            // The first value is undefined, as there is no previous value to average with.
            // For consistency, we can set it to the first data point (or you can choose another default value).
            trendLine.unshift(yData[0]); // Start the trendline with the first value

            console.log("2-Period Moving Average Trendline Values:", trendLine);
            return trendLine;
        }


        function initializeSolidGauge(data) {

            Highcharts.chart('solidgaugecontainer', {
                chart: {
                    type: 'solidgauge',
                    backgroundColor: '#222222',
                    animation: false,
                    custom: {}, // Keep custom object for reuse
                    events: {
                        render() {
                            const chart = this;
                            let customLabel = chart.options.chart.custom.label;

                            if (!customLabel) {
                                customLabel = chart.options.chart.custom.label =
                                    chart.renderer.label(
                                        `<br/><strong>${data.ShiftOEE.toFixed(2)}%</strong>`
                                    )
                                        .css({
                                            color: 'white',
                                            textAnchor: 'middle',
                                            fontSize: "22px"
                                        })
                                        .add();
                            }
                            const x = (chart.plotWidth / 2) + 10,
                                y = chart.plotHeight / 2 + chart.plotTop - (customLabel.attr('height') / 2);

                            customLabel.attr({
                                x,
                                y
                            });
                        }
                    }
                },
                credits: {
                    enabled: false
                },
                exporting: {
                    enabled: false
                },
                title: {
                    text: '',
                },
                tooltip: {
                    enabled: true,
                    formatter: function () {
                        return `<strong></strong> ${this.y.toFixed(2)}%`;
                    }
                },
                yAxis: {
                    min: 0,
                    max: 100,
                    title: {
                        text: null
                    },
                    lineWidth: 0,
                    tickPositions: [], // Hide ticks
                },
                pane: {
                    startAngle: 0,
                    endAngle: 360,
                    background: [{ // Full-circle gauge
                        outerRadius: '112%',
                        innerRadius: '88%',
                        backgroundColor: '#393433',
                        borderWidth: 0
                    }]
                },
                series: [{
                    name: '',
                    data: [{
                        y: data.ShiftOEE,
                        color: '#BF40BF'
                    }],
                    dataLabels: {
                        enabled: false
                    },
                    innerRadius: '88%', // Ensure series matches pane's inner radius
                    radius: '112%',
                    borderRadius: '10px' // Ensure series matches pane's outer radius
                }]
            });
        }

        function renderStackedBarChart(data) {
            // Use backend data directly without modifications
            const categories = ["Production"]; // Single category for X-axis
            const utilisedData = [{
                name: "Production",
                data: [data.UtilisedTimeInSec[0]],
                color: '#ADD8E6'// Use the first value directly from UtilisedTimeInSec
            }];
            const downtimeColors = ['#FFD700', '#FFFF00', '#008000']; // Yellow, Lemon Yellow, Green
            const downtimeData = data.DownCategory.map((category, index) => ({
                name: category,
                data: [data.DownTimeInSec[index] || 0], // Use exact index mapping for DownTimeInSec
                color: downtimeColors[index % downtimeColors.length] // Assign colors in sequence
            })).reverse(); // Reverse the order of downtimeData

            // Log data for debugging
            console.log("Utilised Data:", utilisedData);
            console.log("Downtime Data:", downtimeData);

            Highcharts.chart('rightcontainer', {
                chart: {
                    type: 'bar',
                    backgroundColor: '#222222',
                    animation: false,// Black background
                },
                title: {
                    text: '',
                    style: {
                        color: 'white' // Title color
                    }
                },
                xAxis: {
                    categories: categories,
                    title: {
                        text: null
                    },
                    labels: {
                        enabled: false // Hide X-axis labels
                    },
                    lineWidth: 0 // Remove X-axis line
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: null // Hide Y-axis title
                    },
                    labels: {
                        enabled: false // Hide Y-axis labels
                    },
                    gridLineWidth: 0
                },
                tooltip: {
                    valueSuffix: ' sec',
                    shared: true // Tooltip for stacked values
                },
                plotOptions: {
                    series: {
                        stacking: 'normal',
                        borderColor: '#222222',
                        //pointPadding: 0.4, // Padding between bars
                        //groupPadding: 0.2, // Padding between groups of bars
                        //borderRadius: 10, // Enable stacking
                        dataLabels: {
                            enabled: true, // Enable data labels
                            color: 'white', // Set data label text color
                            style: {
                                fontWeight: 'bold', // Make the font weight bold
                                textOutline: 'none', // Remove the outline around data labels
                                fontSize: '12px' // Customize font size
                            },
                            formatter: function () {
                                return this.y; // Display the value of each data point
                            }
                        }
                    }
                },
                series: [
                    ...downtimeData, // Add downtime categories (lower layers)
                    ...utilisedData  // Add production (upper layer)
                ],
                legend: {
                    reversed: true,
                    itemStyle: {
                        color: 'white' // Legend text color
                    }
                },
                credits: {
                    enabled: false
                },
                exporting: {
                    enabled: false
                }
            });
        }



        function initializeBarChart(Target, actual) {

            // Initialize the chart
            Highcharts.chart('barchartcontainer', {
                chart: {
                    type: 'column',
                    backgroundColor: '#222222',
                    animation: false,// Black background
                },
                title: {
                    text: '',
                    style: {
                        color: 'white' // Set title color
                    }
                },
                xAxis: {
                    categories: ['Target', 'Actual'], // X-axis categories
                    title: {
                        text: null // Remove title for X-axis
                    },
                    labels: {
                        nabled: true,
                        style: {
                            color: 'white' // X-axis labels color
                        }
                    },
                    gridLineWidth: 0, // Remove vertical grid lines
                    lineWidth: 1,
                    lineColor: '#ddd',
                },
                yAxis: {
                    min: 0, // Start Y-axis from 0
                    labels: {
                        enabled: false // Disable Y-axis labels
                    },
                    title: {
                        text: null // Remove Y-axis title
                    },
                    gridLineWidth: 0, // Remove horizontal grid lines
                    lineWidth: 0 // Remove Y-axis line
                },
                legend: {
                    enabled: false, // Show legend
                    itemStyle: {
                        color: 'white' // Legend text color
                    }
                },
                exporting: {
                    enabled: false
                },
                credits: {
                    enabled: false // Disable Highcharts credits
                },
                plotOptions: {
                    column: {
                        borderWidth: 1, // Border width for the bars
                        borderColor: '# 222222',
                        colorByPoint: false
                    }
                },
                series: [
                    {
                        name: '',
                        data: [
                            { y: Target, color: 'yellow' }, // Target bar with yellow color
                            { y: actual, color: 'green' }  // Actual bar with green color
                        ],
                        dataLabels: {
                            enabled: true, // Enable data labels for Target
                            color: 'white', // Set data label color
                            style: {
                                fontSize: '12px', // Customize the font size for the data labels
                                fontWeight: 'bold' // Make the data labels bold
                            }
                        }
                    }
                ]
            });

        }

    </script>

</body>
</html>







