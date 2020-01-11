<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#chartdiv {
	width: 100%;
	height: 650px;
	margin: auto;
}
</style>
<script>

	// ex)서울 강남구 강남대로 -> 강남구 
	var json = ${jsonList}
	
    for (var i = 0; i < json.length; i++) {
    	// 더미 데이터 이용할 수 있도록
    	if (json[i].addr2.length < 5) {
    		json[i].addr2 = json[i].addr2.trim();
    	} else {
        	var text1 = json[i].addr2.indexOf(" ") + 1
        	var text2 = json[i].addr2.indexOf(" ", text1)
        	var text3 = json[i].addr2.substring(text1, text2).trim()
        	
    		for (var j = 0; j < json.length; j++) {
    			if (text3 == json[j].addr2) {
    				
    				json[j].addrcount ++;
    				// JSON key value 삭제
    				delete json[i].addr2;
    				delete json[i].addrcount;
    			} // if end
    		} // for j end

    		
    	} // else end
    } // for i end
    
    console.log(json)
	am4core.ready(function() {
	am4core.disposeAllCharts();
	
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart
		var chart = am4core.create("chartdiv", am4charts.PieChart);
		chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

		chart.data = json

		var series = chart.series.push(new am4charts.PieSeries());
		series.dataFields.value = "addrcount";
		series.dataFields.radiusValue = "addrcount";
		series.dataFields.category = "addr2";
		series.slices.template.cornerRadius = 5;
		series.colors.step = 1;

		series.hiddenState.properties.endAngle = -90;

		chart.legend = new am4charts.Legend();

	}); // end am4core.ready()
</script>