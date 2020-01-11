<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#chartdiv {
	width: 100%;
	height: 500px;
}
</style>

<!-- Chart code -->
<script>
	var json = ${jsonList};

	for(var i=0 ; i < json.length ; i++){
		if (json[i].gender == "1") {
			json[i].gender = "남자";
		} else {
			json[i].gender = "여자";
		}
	}
	
	am4core.ready(function() {
	am4core.disposeAllCharts();
	
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		var chart = am4core.create("chartdiv", am4charts.PieChart3D);
		chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

		chart.legend = new am4charts.Legend();

		chart.data = json

		var series = chart.series.push(new am4charts.PieSeries3D());
		series.dataFields.value = "gendercount";
		series.dataFields.category = "gender";
		series.colors.step = 12;
	}); // end am4core.ready()
</script>