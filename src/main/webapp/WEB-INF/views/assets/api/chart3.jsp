<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Styles -->
<style>
#chartdiv {
	width: 100%;
	height: 500px;
}
</style>

<!-- Chart code -->
<script>
	var json = ${jsonList};
	var array = new Array();
	var count = new Array(7);
	var count_M = new Array(7);
	var count_F = new Array(7);
	var obj = new Object();

	for (var i = 0; i < json.length; i++) {
		if (json[i].gender == "1") {
			json[i].gender = "남자";
		} else {
			json[i].gender = "여자";
		}
	}
	/* 나이대 별 총 합 */
	var sum = 0;
	/* 나이대 별 남자인원 수 */
	var sum2 = 0;
	/* 나이대 별 여자인원 수 */
	var sum3 = 0;

	for (var i = 0; i < count.length; i++) {
		for (var j = i * 10; j < i * 10 + 10; j++) {
			sum += Number(json[j].agecount);
			if (json[j].gender == "남자") {
				sum2++;
			} else {
				sum3++;
			}
		}
		count[i] = sum;
		count_M[i] = -(sum2 / json.length * 100);
		count_F[i] = sum3 / json.length * 100;
		sum = 0;
		sum2 = 0;
		sum3 = 0;
	}
	for (var i = 0; i < count.length; i++) {
		obj = new Object();
		obj.age = ((7 - i) + "0대");
		obj.male = count_M[6 - i];
		obj.female = count_F[6 - i];
		array.push(obj)
	}
	console.log(array)
	
	am4core.ready(function() {
	am4core.disposeAllCharts();
	
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("chartdiv", am4charts.XYChart);

		// Add data
		chart.data = array

		// Use only absolute numbers
		chart.numberFormatter.numberFormat = "#.#s";

		// Create axes
		var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "age";
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.renderer.inversed = true;

		var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
		valueAxis.extraMin = 0.1;
		valueAxis.extraMax = 0.1;
		valueAxis.renderer.minGridDistance = 40;
		valueAxis.renderer.ticks.template.length = 5;
		valueAxis.renderer.ticks.template.disabled = false;
		valueAxis.renderer.ticks.template.strokeOpacity = 0.4;
		valueAxis.renderer.labels.template.adapter.add("text", function(text) {
			return text == "Male" || text == "Female" ? text : text + "%";
		})

		// Create series
		var male = chart.series.push(new am4charts.ColumnSeries());
		male.dataFields.valueX = "male";
		male.dataFields.categoryY = "age";
		male.clustered = false;

		var maleLabel = male.bullets.push(new am4charts.LabelBullet());
		maleLabel.label.text = "{valueX}%";
		maleLabel.label.hideOversized = false;
		maleLabel.label.truncate = false;
		maleLabel.label.horizontalCenter = "right";
		maleLabel.label.dx = -10;

		var female = chart.series.push(new am4charts.ColumnSeries());
		female.dataFields.valueX = "female";
		female.dataFields.categoryY = "age";
		female.clustered = false;

		var femaleLabel = female.bullets.push(new am4charts.LabelBullet());
		femaleLabel.label.text = "{valueX}%";
		femaleLabel.label.hideOversized = false;
		femaleLabel.label.truncate = false;
		femaleLabel.label.horizontalCenter = "left";
		femaleLabel.label.dx = 10;

		var maleRange = valueAxis.axisRanges.create();
		maleRange.value = -10;
		maleRange.endValue = 0;
		maleRange.label.text = "Male";
		maleRange.label.fill = chart.colors.list[0];
		maleRange.label.dy = 20;
		maleRange.label.fontWeight = '600';
		maleRange.grid.strokeOpacity = 1;
		maleRange.grid.stroke = male.stroke;

		var femaleRange = valueAxis.axisRanges.create();
		femaleRange.value = 0;
		femaleRange.endValue = 10;
		femaleRange.label.text = "Female";
		femaleRange.label.fill = chart.colors.list[1];
		femaleRange.label.dy = 20;
		femaleRange.label.fontWeight = '600';
		femaleRange.grid.strokeOpacity = 1;
		femaleRange.grid.stroke = female.stroke;
		
	}); // end am4core.ready()
</script>