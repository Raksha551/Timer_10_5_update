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
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

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
            width: 60vw;
            height: 1vw;
                margin-left: 4em;
   
            background-color: #222222;
            border-radius: 10px;
            text-align: center;
             padding: 0.2vw;
    padding-bottom: 1.4vw;
        }

        .header-title {
            font-size: 2.1vw;
            font-weight: bold;
            font-family: monospace;
        }

        .header-right {
            display: flex;
            font-size: 1.1vw;
            flex-direction: column;
            font-weight: 550;
            font-family: sans-serif;
            line-height: 1;
            margin: 0.2vw;
            margin-right: 0vw;
        }

        .shiftA {
            margin-left: 28%;
        }

        .firstRow {
            display: flex;
        }

        .TD {
            width: 50vw;
            height: 0.7vw;
            background-color: #222222;
            border-radius: 8px;
            text-align: center;
           
            margin-right: 4vh;
            margin-left: 4vh;
                font-size: 1.6vw;
    font-family: sans-serif;
    padding: 1vh;
    padding-bottom: 3.6vh
        }

        .machineid {
            margin-right: 6vh;
            padding-top: 0vh;
          
        }

        #firstTD {
            padding-top: 4px;
            padding-bottom: 6px;
        }

        .ThirdRow {
            display: flex;
            margin-left: 3.2vw;
            margin-right: 4.4vw;
            margin-bottom:0.3vh;
        }

        .thirdRowTD {
         
            margin-left: 1vw;
            border-radius: 10px;
            background-color: #222222;
            width: 10vw;
            height: 7vw;
        }

        .toplefttext {
            padding-top: 0.4vw;
           
           
            font-family: sans-serif;
        }

        .toprighttext {
        
            padding-top: 0.8vw;
            font-family: sans-serif;
        }
         .toplefttext1 {
     padding-top: 0.4vw;
     font-size:1vw;
    
     font-family: sans-serif;
 }

 .toprighttext1 {
       font-size:0.7vw;
     padding-top: 0.6vw;
     font-family: sans-serif;
 }
        .Boxdata {
            display: flex;
            justify-content: space-around;
            padding: 0.3vw;
        }

        .Boxdata6 {
            display: flex;
           padding: 0.4vw;
    padding-left: 0.6vw;
        }

        .subheading {
           font-size: 0.7vw;
    padding-top: 0.9vw;
    padding-left: 0.3vw;
        }

        .row3image {
           padding-left: 1.2vw;
           width: 2vw;
        }

        .value {
            text-align: center;
            font-size: 1.8vw;
            padding: 0.4vw;
            color: orange;
            font-weight: 600;
            font-family: sans-serif;
        }

        .FourthRow {
           
            margin-left: 4.1vw;
        }

        .leftchart {
            background-color: #222222;
         
            border-radius: 10px;
            margin-top: 0.5vw;
        }

        .leftchartheading {
           justify-content: space-between;
    padding: 0.5vw;
    padding-left: 20px;
    padding-left: 1vw;
    padding-right: 1vw;
        }

        .chartrightheading {
         margin-top: 0.3vw;
    background-color: black;
    border-radius: 8px;
    height: 1.3vw;
    margin-left: 0.5vw;
    display: flex
;
        }

        .chartrightheading1 {
         font-size: 0.9vw;
    background-color: black;
    padding-top: 1px;
    padding-left: 0.6vw;
    padding-right: 0.3vw;
    border-radius: 8px;
   
        }

        .chartrightheading2 {
                font-size: 0.9vw;
    background-color: #36454F;
                  padding-left: 0.7vw;
    padding-right: 0.7vw;
    border-radius: 8px;
        }

        .metric {
          margin-bottom: 0.6vw;
            font-size: 1vw;
            font-family: sans-serif;
        }

        .progress-bar {
            width: 20vw;
            border-radius: 5px;
            overflow: hidden;
            height: 1.4vw;
            position: relative;
             padding-bottom: 0.4vw;
        }

        .progress-fill {
            height: 1.4vw;
            border-radius: 5px;
            background-color: #125999
        }

        .progress-bar1 {
            width: 18vw;
            border-radius: 2px;
            overflow: hidden;
            height: 1.4vw;
            position: relative;
            padding-bottom: 0.8vw;
        }

        .progress-fill1 {
            height: 1.4vw;
            border-radius: 2px;
            background-color: #125999
        }

        .secondrowTD {
            margin-right: 1vw;
            background-color: #222222;
            width: 17vw;
          
            padding-top: 2vh;
            border-radius: 15px;
        }

        .secondRow {
        
            display: flex;
            margin-left: 4.1vw;  
            margin-top: 1.5vh; 
            margin-bottom: 1.5vh;
                margin-right: 2.6vw;
        }

        .range {
          
            padding-top: 1vw;
            padding-left: 1vw;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Timer runat="server" OnTick="Timer1_Tick" ID="Timer1" Interval="10000"></asp:Timer>
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server" ID="updatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <div style="padding: 0.4vw;">
                        <div class="header">
                            <img runat="server" src="./Images/AmitLogo-Transparent.png" alt="Amit_Logo" style="width: 6.4vw; height: 3.3vw; background-color: black;" />
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
                                    <img runat="server" src="./Images/running.png" style="height: 1em;" />
                                </div>
                                <div runat="server" class="TD" id="secondTD">
                                    <asp:Label runat="server" Text='<%# Eval("MachineID") %>'></asp:Label>
                                </div>
                                <div runat="server" class="TD" id="thirdTD">
                                    <asp:Label runat="server" Text='<%# Eval("LatestOpnDescription") %>'></asp:Label>
                                </div>
                            </div>
                            <div runat="server" class="secondRow" style="">
                                <div runat="server" class="secondrowTD" style="">
                                    <asp:Label runat="server" Text="OEE" Style="padding-left: 1.2vw; font-size: 1.1vw; font-family: sans-serif;"></asp:Label>
                                    <div style="display: flex; ">
                                        <div style="">
                                            <img runat="server" src="./Images/speedometer.png" class="row3image" style="width: 2vw;" />
                                        </div>
                                        <asp:Label runat="server" Text="(%)" CssClass="toprighttext" Style="padding-left: 0.3vw; font-size:  0.7vw;"></asp:Label>

                                    </div>
                                    <div id="solidgaugecontainer" style="    width: 12vw;    margin-left: 2.6vw;   height: 11vw;"></div>
                                </div>

                                <div runat="server" class="secondrowTD" style="width: 26vw;padding-top: 0.5vw;">
                                    <div style="display: flex;  padding-bottom: 0.6vw;">
                                        <asp:Label runat="server" Text="Part Count" CssClass="toplefttext" Style="font-size: 1.3vw; padding-left: 1vw;"></asp:Label>
                                        <asp:Label runat="server" Text="(no's)" CssClass="toprighttext" Style="padding-left: 0.4vw; font-size: 0.8vw; "></asp:Label>
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" style="    padding-left: 1vw;" />
                                    </div>
                                    <div class="range">
                                        <div class="metric" style="padding-right: 1.2vw; padding-bottom: 2.4vw;">
                                            <div style="display: flex;">
                                                <label class="name" style="padding-right: 1.8vw;">Shift 1</label>
                                                <div class="progress-bar1" style="display: flex">
                                                    <div id="" class="progress-fill1" style='<%# Eval("ShiftPartCountstyle") %>'></div>
                                                    <div id="" class="progress-fill1" style='<%# Eval("ShiftTargetstyle") %>'></div>
                                                </div>
                                            </div>
                                            <div style="display: flex; padding-left: 6vw;">
                                                <div style="display: flex; padding-right: 1.6vw;">
                                                    <div style="width: 0.8vw; height: 0.8vw; background-color: blue; border-radius: 50px; margin-right: 0.5vw; "></div>
                                                    <label class="availdata" style="padding-right: 0.1vw;">Actual - </label>
                                                    <label class="availdata"><%# Eval("ShiftPartCount") %></label>
                                                </div>
                                                <div style="display: flex; padding-right: 1.6vw;">
                                                     <div style="width: 0.8vw; height: 0.8vw; background-color: #393433; border-radius: 50px; margin-right: 0.5vw; "></div>
                                                    <label class="availdata" style="padding-right: 0.1vw;">Target - </label>
                                                    <label class="availdata"><%# Eval("ShiftTarget") %></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="metric" style="padding-right: 1.2vw; ">
                                            <div style="display: flex;">
                                                <label class="name" style="padding-right: 1.8vw;">Day</label>
                                                <div class="progress-bar1" style="display: flex; margin-left: 1vw;">
                                                    <div id="" class="progress-fill1" style='<%# Eval("DayPartCountstyle") %>'></div>
                                                    <div id="" class="progress-fill1" style='<%# Eval("DayTargetstyle") %>'></div>
                                                </div>
                                            </div>
                                            <div style="display: flex; padding-left: 6vw;">
                                                <div style="display: flex; padding-right: 1.6vw;">
                                                     <div style="width: 0.8vw; height: 0.8vw; background-color: blue; border-radius: 50px; margin-right: 0.5vw; "></div>
                                                    <label class="availdata" style="padding-right: 0.1vw;">Actual - </label>
                                                    <label class="availdata"><%# Eval("DayPartCount") %></label>
                                                </div>
                                                <div style="display: flex; padding-right: 1.6vw;">
                                                    <div style="width: 0.8vw; height: 0.8vw; background-color: #393433; border-radius: 50px; margin-right: 0.5vw; "></div>
                                                    <label class="availdata" style="padding-right: 0.1vw;">Target - </label>
                                                    <label class="availdata"><%# Eval("DayTarget") %></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div runat="server" class="secondrowTD" style="padding-top: 0vw">
                                    <div style="display: flex; padding-bottom: 0px;" class="leftchartheading">
                                        <div style="display: flex;">
                                            <asp:Label runat="server" Text="Part Count" CssClass="toplefttext" Style="font-size: 1.3vw;"></asp:Label>
                                        </div>
                                        <div class="chartrightheading">
                                            <asp:Label runat="server" ID="labelMonth" ClientIDMode="Static" Text="month" CssClass="chartrightheading1"></asp:Label>
                                            <asp:Label runat="server" ID="labelYear" ClientIDMode="Static" Text="year" CssClass="chartrightheading2"></asp:Label>

                                        </div>
                                    </div>
                                    <div style="display: flex;    margin-left: 0.1vw;">
                                        <div style="">
                                            <img runat="server" src="./Images/speedometer.png" class="row3image" style="" />
                                        </div>
                                        <asp:Label runat="server" Text="(no's)" CssClass="toprighttext" Style="padding-left: 0.6vw; font-size: 0.8vw; padding-top: 0.8vw;"></asp:Label>

                                    </div>

                                    <div id="barchartcontainer" style="width: 10vw;   height: 10vw;  padding-left: 3.6vw;"></div>
                                </div>
                                <div runat="server" stye="" class="secondrowTD" style="width: 26vw;padding-top: 0.5vw;">
                                    <div style="display: flex; padding-left: 0.9vw; padding-bottom: 0.6vw;">
                                        <asp:Label runat="server" Text="Month To Date (MTD)" CssClass="toplefttext" Style="font-size: 1.3vw;"></asp:Label>
                                        <asp:Label runat="server" Text="(no's)" CssClass="toprighttext" Style="padding-left: 1.3vw; font-size: 0.8vw;padding-top: 0.8vw;"></asp:Label>
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" style="padding-left: 0.8vw;" />
                                    </div>
                                    <div class="range">
                                        <div class="metric">
                                            <div style="display: flex; ">
                                                <label class="name" style="width: 11vw">Req. Rate/Day</label>

                                                <div class="progress-bar">
                                                    <div id="" class="progress-fill" style='<%# Eval("AskRateData") %>'></div>
                                                </div>
                                            </div>
                                            <label class="" style="margin-left: 18vw"><%# Eval("AskRate") %> </label>
                                        </div>
                                        <div class="metric">
                                            <div style="display: flex; ">
                                                <label class="name" style="width: 11vw">Hit Rate/Day</label>

                                                <div class="progress-bar">
                                                    <div id="" class="progress-fill" style='<%# Eval("HitRateData") %>'></div>
                                                </div>
                                            </div>
                                            <label class="" style="margin-left: 18vw"><%# Eval("HitRate") %></label>
                                        </div>
                                        <div class="metric">
                                            <div style="display: flex; ">
                                                <label class="name" style="width: 11vw">Ask Rate/Day</label>

                                                <div class="progress-bar">
                                                    <div id="" class="progress-fill" style='<%# Eval("ReqRateData") %>'></div>
                                                </div>
                                            </div>
                                            <label class="qualitydata" style="margin-left: 21.5vw"><%# Eval("ReqRate") %></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div runat="server" class="ThirdRow">
                                <div runat="server" id="thirdRowTD1" class="thirdRowTD">
                                    <div class="Boxdata">
                                        <asp:Label runat="server" Text="Idle Time" Style="" CssClass="toplefttext1"></asp:Label>
                                        <asp:Label runat="server" Text="(Shift 1)" CssClass="toprighttext1"></asp:Label>
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
                                        <asp:Label runat="server" Text="Idle Time" CssClass="toplefttext1"></asp:Label>
                                        <asp:Label runat="server" Text="(Cumulative)" CssClass="toprighttext1" Style=""></asp:Label>
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
                                        <asp:Label runat="server" Text="Rejection" CssClass="toplefttext1"></asp:Label>
                                        <asp:Label runat="server" Text="(Today)" CssClass="toprighttext1"></asp:Label>
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
                                        <asp:Label runat="server" Text="Rejection" CssClass="toplefttext1"></asp:Label>
                                        <asp:Label runat="server" Text="(Cumulative)" CssClass="toprighttext1" Style=""></asp:Label>
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
                                        <asp:Label runat="server" Text="Power" CssClass="toplefttext1"></asp:Label>
                                        <asp:Label runat="server" Text="(Cumulative)" CssClass="toprighttext1" Style=""></asp:Label>
                                    </div>
                                    <div style="display: flex">
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" />
                                        <asp:Label runat="server" Text="(kwh)" CssClass="subheading" Style="font-size: 14px; padding-top: 12px;"></asp:Label>
                                    </div>
                                    <div class="value" style="color: green">
                                        <asp:Label runat="server" Text='<%# Eval("MonthLevel_KWH") %>'></asp:Label>
                                    </div>
                                </div>
                                <div runat="server" class="thirdRowTD" style="width: 34vw; font-size: 1.2vw;">
                                    <div class="Boxdata6">
                                        <asp:Label runat="server" Text="Current Downtime Reason" CssClass="toplefttext1"></asp:Label>
                                    </div>
                                    <div style="display: flex">
                                        <img runat="server" src="./Images/speedometer.png" class="row3image" style="width: 2vw;    height: 2vw;" />
                                        <asp:Label runat="server" Text='<%# Eval("HelpReqStatus") %>' Style="color: red; padding:0.4vw"></asp:Label>
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
            <div runat="server" class="FourthRow" style="display: flex; margin-right: 4vw;">
                <div class="leftchart" style="width: 44vw;">
                    <div style="display: flex;" class="leftchartheading">
                        <div style="display: flex; font-size: 1.4vw;">
                            <asp:Label runat="server" Text="Monthly Production" CssClass="toplefttext" Style="font-size: 1.4vw;"></asp:Label>
                            <asp:Label runat="server" Text="(no's)" CssClass="toprighttext" Style="padding-left: 10px; font-size: 0.9vw; padding-top: 0.8vw;"></asp:Label>
                            <img runat="server" src="./Images/speedometer.png" class="row3image" style="" />
                        </div>
                        <div class="chartrightheading">
                            <asp:Label runat="server" ID="weeklabel2" Text="week" CssClass="chartrightheading1"></asp:Label>
                            <asp:Label runat="server" ID="monthlabel2" Text="month" CssClass="chartrightheading2"></asp:Label>
                        </div>
                    </div>
                    <div id="leftchartcontainer" style="width: 37vw; height: 11vw; background-color: #222222; margin-left: 4vw; padding: 5px; border-radius: 10px;"></div>
                </div>
                <div class="leftchart" style="margin-left: 1vw; width: 44vw;">
                    <div style="display: flex;" class="leftchartheading">
                        <div style="display: flex; font-size: 1.4vw;">
                            <asp:Label runat="server" Text="Monthly Time Analysis" CssClass="toplefttext" Style="font-size: 1.4vw;"></asp:Label>
                            <asp:Label runat="server" Text="(HH:MM)" CssClass="toprighttext" Style="padding-left: 0.4vw;    font-size: 0.9vw;    padding-top: 0.8vw;"></asp:Label>
                            <img runat="server" src="./Images/speedometer.png" class="row3image" style="" />
                        </div>
                        <div class="chartrightheading">
                            <asp:Label runat="server" ID="weeklabel1" Text="week" CssClass="chartrightheading1"></asp:Label>
                            <asp:Label runat="server" ID="monthlabel1" Text="month" CssClass="chartrightheading2"></asp:Label>
                        </div>
                    </div>
                    <div id="rightcontainer" style="width: 37vw; height: 11vw; background-color: #222222; padding: 5px;    padding-left: 5vw; border-radius: 10px;"></div>
                </div>


            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(document).ready(function () {
            let isWeekData = false;
            let isMonthData = false;// Flag to toggle between week and month data
            let iterationCount = 0; // Counter for interval execution

           
            fetchChartData(); 
            fetchSolidGaugeData();
            fetchBarChartData();

            fetchStackedBarChartData();


            setInterval(function () {
                console.log("Iteration Count:", iterationCount); // Debugging iteration count
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
            }, 5000); // Interval of 5 seconds

            setInterval(function () {
                fetchSolidGaugeData(); 
            }, 10000); // Interval of 10 seconds
            const prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                fetchChartData();
                fetchSolidGaugeData();
                fetchBarChartData();
                fetchStackedBarChartData(); 
                fetchWeekChartData();
                fetchWeekStackedBarChartData();

            });

            //  $("[id$=lblMonth]")
        });


        function fetchChartData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendMonthDataToAjax", 
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
                url: "Timer_30_10_charts.aspx/SendWeekDataToAjax", 
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Received Week Data:", data);
                    data.pDate = data.pDate.map(dateString => formatDate(dateString));
                    renderCombinedChart(data, true); 
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching Week chart data:", error);
                }
            });
        }

        function fetchSolidGaugeData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendSolidGaugeDataToAjax", 
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Solid Gauge Data:", data);
                    initializeSolidGauge(data);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching solid gauge data:", error);
                }
            });
        }

        function fetchBarChartData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendBarChartDataToAjax", 
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Bar Chart year Data:", data);
                    initializeBarChart(data.YearTarget, data.YearPartCount); 
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching bar chart year data:", error);
                }
            });
        }
        function fetchBarChartMonthData() {
            $.ajax({
                type: "POST",
                url: "Timer_30_10_charts.aspx/SendBarChartMonthDataToAjax", 
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d;
                    console.log("Bar Chart month Data:", data);
                    initializeBarChart(data.MonthTarget, data.MonthPartCount);
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
            const date = new Date(parseInt(timestamp, 10));

            if (isNaN(date.getTime())) {
                console.error("Invalid date format:", dateString);
                return "Invalid Date"; 
            }
            const day = String(date.getDate()).padStart(2, '0'); 
            const month = String(date.getMonth() + 1).padStart(2, '0'); 
            return `${day}/${month}`;
        }


        let chartInstance;
        function renderCombinedChart(data, isWeekData) {
            const xAxisData = isWeekData ? data.pDate : data.WeekNo; 
            const numericXData = xAxisData.map((_, index) => index + 1); 
            const trendLineData = calculateTrendLine(numericXData, data.UtilisedTimeInSec);

            if (!chartInstance) {
                // Initialize chart if not already done
                chartInstance = Highcharts.chart('leftchartcontainer', {
                    chart: {
                        zoomType: 'xy',
                        backgroundColor: '#222222',
                        animation: false,
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
                            color: 'white' 
                        }
                    },
                    xAxis: {
                        categories: xAxisData,
                        title: {
                            text: isWeekData ? 'Dates' : 'Days',
                            style: {
                                color: 'white' 
                            }
                        },
                        labels: {
                            style: {
                                color: 'white' 
                            }
                        },
                        gridLineWidth: 0,
                        gridLineColor: '#ffffff',
                        lineWidth: 1,
                        lineColor: '#ddd',
                    },
                    yAxis: [
                        {
                            title: {
                                text: 'No\'s',
                                style: {
                                    color: 'white' 
                                }
                            },
                            labels: {
                                style: {
                                    color: 'white' 
                                }
                            },
                            gridLineWidth: 0,
                            lineWidth: 1,
                            lineColor: '#ddd',
                        },

                        {
                            visible: false // Hide the right-side y-axis for Target Value
                        },
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
                            color: '#7cb5ec', 
                            dataLabels: {
                                enabled: true, 
                                color: 'white', 
                                style: {
                                    textOutline: 'none', 
                                    fontWeight: 'bold' 
                                },
                                formatter: function () {
                                    return this.y; 
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
                            color: '#FFA500', 
                            dataLabels: {
                                enabled: true, 
                                color: 'white', 
                                style: {
                                    textOutline: 'none', 
                                    fontWeight: 'bold' 
                                },
                                formatter: function () {
                                    return this.y; 
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
                            color: '#ff0000', 
                            dataLabels: {
                                enabled: true, 
                                color: 'white', 
                                style: {
                                    textOutline: 'none', 
                                    fontWeight: 'bold' 
                                },
                                formatter: function () {
                                    return this.y; 
                                }
                            }
                        }
                    ],
                    legend: {
                        enabled: true, 
                        layout: 'vertical', 
                        align: 'right', 
                        verticalAlign: 'middle', 
                        itemStyle: {
                            color: 'white' 
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
            const trendLine = [];

            // Loop through the yData and calculate the 2-period moving average
            for (let i = 1; i < yData.length; i++) {
                const avg = (yData[i] + yData[i - 1]) / 2; // Average of the current and previous value
                trendLine.push(avg); // Store the calculated moving average
            }
            trendLine.unshift(yData[0]); 

            console.log("2-Period Moving Average Trendline Values:", trendLine);
            return trendLine;
        }


        function initializeSolidGauge(data) {

            Highcharts.chart('solidgaugecontainer', {
                chart: {
                    type: 'solidgauge',
                    backgroundColor: '#222222',
                    animation: false,                  
                    custom: {}, 
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
                                            fontSize: "1vw"
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
                    tickPositions: [],
                },
                pane: {
                    startAngle: 0,
                    endAngle: 360,
                    background: [{
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
                    innerRadius: '88%', 
                    radius: '112%',
                    borderRadius: '10px' 
                }]
            });
        }

        function renderStackedBarChart(data) {
           
            const categories = ["Production"]; 
            const utilisedData = [{
                name: "Production",
                data: [data.UtilisedTimeInSec[0]],
                color: '#ADD8E6'
            }];
            const downtimeColors = ['#FFD700', '#FFFF00', '#008000']; 
            const downtimeData = data.DownCategory.map((category, index) => ({
                name: category,
                data: [data.DownTimeInSec[index] || 0], 
                color: downtimeColors[index % downtimeColors.length]
            })).reverse(); 

            // Log data for debugging
            console.log("Utilised Data:", utilisedData);
            console.log("Downtime Data:", downtimeData);

            Highcharts.chart('rightcontainer', {
                chart: {
                    type: 'bar',
                    backgroundColor: '#222222',
                    animation: false,
                },
                title: {
                    text: '',
                    style: {
                        color: 'white' 
                    }
                },
                xAxis: {
                    categories: categories,
                    title: {
                        text: null
                    },
                    labels: {
                        enabled: false 
                    },
                    lineWidth: 0 
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: null 
                    },
                    labels: {
                        enabled: false 
                    },
                    gridLineWidth: 0
                },
                tooltip: {
                    valueSuffix: ' sec',
                    shared: true 
                },
                plotOptions: {
                    series: {
                        stacking: 'normal',
                        borderColor: '#222222',
                        dataLabels: {
                            enabled: true, 
                            color: 'white', 
                            style: {
                                fontWeight: 'bold', 
                                textOutline: 'none', 
                                fontSize: '12px' 
                            },
                            formatter: function () {
                                return this.y; 
                            }
                        }
                    }
                },
                series: [
                    ...downtimeData, //  (lower layers)
                    ...utilisedData  // (upper layer)
                ],
                legend: {
                    reversed: true,
                    itemStyle: {
                        color: 'white'
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

            Highcharts.chart('barchartcontainer', {
                chart: {
                    type: 'column',
                  
                    backgroundColor: '#222222',
                    animation: false,
                },
                title: {
                    text: '',
                    style: {
                        color: 'white' 
                    }
                },
                xAxis: {
                    categories: ['Target', 'Actual'], 
                    title: {
                        text: null 
                    },
                    labels: {
                        nabled: true,
                        style: {
                            color: 'white' 
                        }
                    },
                    gridLineWidth: 0,
                    lineWidth: 1,
                    lineColor: '#ddd',
                },
                yAxis: {
                    min: 0, 
                    labels: {
                        enabled: false 
                    },
                    title: {
                        text: null 
                    },
                    gridLineWidth: 0, // Remove horizontal grid lines
                    lineWidth: 0 
                },
                legend: {
                    enabled: false, 
                    itemStyle: {
                        color: 'white' 
                    }
                },
                exporting: {
                    enabled: false
                },
                credits: {
                    enabled: false 
                },
                plotOptions: {
                    column: {
                        borderWidth: 1, 
                        borderColor: '# 222222',
                        colorByPoint: false
                    }
                },
                series: [
                    {
                        name: '',
                        data: [
                            { y: Target, color: 'yellow' }, 
                            { y: actual, color: 'green' }  
                        ],
                        dataLabels: {
                            enabled: true, 
                            color: 'white', 
                            style: {
                                fontSize: '12px', 
                                fontWeight: 'bold' 
                            }
                        }
                    }
                ]
            });

        }

    </script>

</body>
</html>







