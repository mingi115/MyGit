<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#chartdiv0 {
		  width: 1300px;
		  height: 500px;
		  left: 40px;
		  top:-160px;
		  position:absolute;
		  padding : 0 50px 0 0;
		  margin : 30px;
		}

#chartdiv1 {
		  width: 650px;
		  height: 450px;
		  left: 40px;
		  top: 530px;
		  position:absolute;
		  padding : 0 50px 0 0;
		}
		
#chartdiv2 {
		  width: 650px;
		  height: 450px;
		  left: 700px;
		  top:530px;
		  position:absolute;
		}
		
#chartdiv3 {
		  width: 1300px;
		  height: 750px;
		  left: 40px;
		  top:1100px;
		  position:absolute;
		}	 
		
</style>
</head>
<body>
<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script>
/* Chart0 code */  
am4core.ready(function() {
	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var chart = am4core.create("chartdiv0", am4charts.XYChart);

	// Add data
	chart.data = ${jsonList};

	// Create axes
	var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
	//dateAxis.renderer.grid.template.location = 0;
	//dateAxis.renderer.minGridDistance = 30;

	var valueAxis1 = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis1.title.text = "환자수";

	var valueAxis2 = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis2.title.text = "진료비용";
	valueAxis2.renderer.opposite = true;
	valueAxis2.renderer.grid.template.disabled = true;

	// Create series
	var series1 = chart.series.push(new am4charts.ColumnSeries());
	series1.dataFields.valueY = "sum_num_patient";
	series1.dataFields.dateX = "dis_month";
	series1.yAxis = valueAxis1;
	series1.name = "월별 환자수(단위 : 명)";
	series1.tooltipText = "{name}\n[bold font-size: 20]{valueY}[/]";
	series1.fill = chart.colors.getIndex(0);
	series1.strokeWidth = 0;
	series1.clustered = false;
	series1.columns.template.width = am4core.percent(60);

	var series3 = chart.series.push(new am4charts.LineSeries());
	series3.dataFields.valueY = "sum_cost";
	series3.dataFields.dateX = "dis_month";
	series3.name = "월별 진료 비용(단위: 천원)";
	series3.strokeWidth = 2;
	series3.tensionX = 0.7;
	series3.yAxis = valueAxis2;
	series3.tooltipText = "{name}\n[bold font-size: 20]{valueY}[/]";

	var bullet3 = series3.bullets.push(new am4charts.CircleBullet());
	bullet3.circle.radius = 3;
	bullet3.circle.strokeWidth = 2;
	bullet3.circle.fill = am4core.color("#fff");

	// Add cursor
	chart.cursor = new am4charts.XYCursor();

	// Add legend
	chart.legend = new am4charts.Legend();
	chart.legend.position = "top";

	// Add scrollbar
	chart.scrollbarX = new am4charts.XYChartScrollbar();
	chart.scrollbarX.series.push(series1);
	chart.scrollbarX.parent = chart.bottomAxesContainer;
}); // end am4core.ready()
	
/* Chart1 code */  
am4core.ready(function() {

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end
	
	// Create chart instance
	var chart = am4core.create("chartdiv1", am4charts.PieChart);
	
	// Add data
	chart.data = ${jsonList1};
	
	// Set inner radius
	chart.innerRadius = am4core.percent(50);
	
	// Add and configure Series
	var pieSeries = chart.series.push(new am4charts.PieSeries());
	pieSeries.dataFields.value = "sum_num_patient";
	pieSeries.dataFields.category = "dis_gender";
	pieSeries.slices.template.stroke = am4core.color("#fff");
	pieSeries.slices.template.strokeWidth = 2;
	pieSeries.slices.template.strokeOpacity = 1;
	
	// This creates initial animation
	pieSeries.hiddenState.properties.opacity = 1;
	pieSeries.hiddenState.properties.endAngle = -90;
	pieSeries.hiddenState.properties.startAngle = -90;
}); // end am4core.ready()

/* Chart2 code */  
am4core.ready(function() {
	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end
	
	// Create chart instance
	var chart = am4core.create("chartdiv2", am4charts.PieChart);
	
	// Add data   
	chart.data = ${jsonList2};
	
	// Set inner radius
	chart.innerRadius = am4core.percent(50);
	
	// Add and configure Series
	var pieSeries = chart.series.push(new am4charts.PieSeries());
	pieSeries.dataFields.value = "sum_num_patient";
	pieSeries.dataFields.category = "dis_age";
	pieSeries.slices.template.stroke = am4core.color("#fff");
	pieSeries.slices.template.strokeWidth = 2;
	pieSeries.slices.template.strokeOpacity = 1;
	
	// This creates initial animation
	pieSeries.hiddenState.properties.opacity = 1;
	pieSeries.hiddenState.properties.endAngle = -90;
	pieSeries.hiddenState.properties.startAngle = -90;
}); // end am4core.ready()

/* Chart3 code */  

am4core.ready(function() {
	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end
	
	// Create chart instance
	var chart = am4core.create("chartdiv3", am4charts.XYChart);
	
	// Add data
	chart.data = ${jsonList3};
	
	// Create axes
	var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "disRegion";
	categoryAxis.numberFormatter.numberFormat = "###,###";
	categoryAxis.renderer.inversed = true;
	categoryAxis.renderer.grid.template.location = 0;
	categoryAxis.renderer.cellStartLocation = 0.1;
	categoryAxis.renderer.cellEndLocation = 0.9;
	
	var  valueAxis = chart.xAxes.push(new am4charts.ValueAxis()); 
	valueAxis.renderer.opposite = true;
	
	// Create series
	function createSeries(field, name) {
	  var series = chart.series.push(new am4charts.ColumnSeries());
	  series.dataFields.valueX = field;
	  series.dataFields.categoryY = "disRegion";
	  series.name = name;
	  series.columns.template.tooltipText = "환자 수: [bold]{valueX}[/]";
	  series.columns.template.height = am4core.percent(100);
	  series.sequencedInterpolation = true;
	
	  var valueLabel = series.bullets.push(new am4charts.LabelBullet());
	  //valueLabel.label.text = "{valueX}";
	  valueLabel.label.horizontalCenter = "left";
	  valueLabel.label.dx = 10;
	  valueLabel.label.hideOversized = false;
	  valueLabel.label.truncate = false;
	
	  var categoryLabel = series.bullets.push(new am4charts.LabelBullet());
	  //categoryLabel.label.text = "{name}";
	  categoryLabel.label.horizontalCenter = "right";
	  categoryLabel.label.dx = -10;
	  categoryLabel.label.fill = am4core.color("#fff");
	  categoryLabel.label.hideOversized = false;
	  categoryLabel.label.truncate = false;
	}
	
	createSeries("patientSum", "patientSum");
}); // end am4core.ready() 




</script>
<div id="chartdiv0"></div>
<div id="chartdiv1"></div>
<div id="chartdiv2"></div>
<div id="chartdiv3"></div>
</body>
</html>