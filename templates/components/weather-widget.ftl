<div class="weather-widget">
<script>
  [#assign id=content.@id?replace("-","_")]    
  var callbackFunction_${id} = function(data) {
	[#if content.name??]
		var ciudad = '${content.name}';
	[#else]	
		var ciudad = data.query.results.channel.location.city;
	[/#if]
	var temperatura = data.query.results.channel.item.condition.temp;
	var unidad = data.query.results.channel.units.temperature;
	var iconoTiempo = codeTranslate(data.query.results.channel.item.condition.code);
	var humedad = data.query.results.channel.atmosphere.humidity;
	var presion = data.query.results.channel.atmosphere.pressure;
	var amanecer = data.query.results.channel.astronomy.sunrise;
	var atardecer = data.query.results.channel.astronomy.sunset;
	var numDias = ${content.forecast!0};
	var columnas = Math.round(12/numDias);	
	$( document ).ready(function() {
		$("#prevision_${id} .ciudad").html(ciudad);
		$("#prevision_${id} .temperatura").html(temperatura +"º");
		$("#prevision_${id} .unidades").html(unidad);
		$("#prevision_${id} .estado").addClass(iconoTiempo);
		[#if content.humidity?? && content.humidity]
			$("#prevision_${id} .humedad").html(humedad);
		[/#if]	
		[#if content.pressure?? && content.pressure]
			$("#prevision_${id} .presion").html(presion);
		[/#if]
		[#if content.sun?? && content.sun]
			$("#prevision_${id} .amanecer").html(amanecer);
			$("#prevision_${id} .atardecer").html(atardecer);
		[/#if]
		$("#prevision_${id} .forecast").html();		
		$("#prevision_${id} .forecast").html("");
		var options = { weekday: 'short'};
		var date  = new Date();				
		for (i = 0;i<numDias ; i++){
					date.setDate(date.getDate() + 1);
					pintarForecast(columnas,data.query.results.channel.item.forecast[i+1],unidad, "#prevision_${id}", date.toLocaleDateString("${cmsfn.language()}",options));
			}	
		if(numDias==5){			
			$("#prevision_${id} .forecast .day:first-child").addClass("col-md-offset-1");
		}			
		});		
  };  
</script>
<script src="https://query.yahooapis.com/v1/public/yql?q=select * from weather.forecast where woeid = ${content.woeid!} and u='${content.units!}'&format=json&callback=callbackFunction_${id}"></script>
<div id="prevision_${id}" >
<div class="col-xxl-12 col-xl-7">              
              <div class="${content.color!"bg-primary"}  text-center" >
                <div class="p-5">
                  <h3 class=" mb-10">
                    <span class="font-size-30 ciudad "></span>
                  </h3>                 
                  <div class="mb-10">
					 <i class="wi estado font-size-50 mb-10 "> </i>                  
                    <div >
						<span class="font-size-50 temperatura"></span><span class="font-size-40 unidades"></span>                      
                    </div>
					[#if content.humidity?? && content.humidity]
						<p class=" mb-10 font-size-30">
						 <span class="humedad"></span> <i class="wi wi-humidity  "> </i>
						</p>
					[/#if]
					[#if content.pressure?? && content.pressure]
						<p class=" mb-10 font-size-30">
						 <span class="presion"></span> <i class="wi wi-barometer  "> </i>
						</p>
					[/#if]
					[#if content.sun?? && content.sun]
						<p class=" mb-10 font-size-30">
						 <span class="amanecer"></span> <i class="wi wi-sunrise "> </i>
						 <span class="atardecer"></span> <i class="wi wi-sunset "> </i>
						</p>
					[/#if]
					</div>
                  <div class="row no-space forecast">            
                  </div>
                </div>
              </div>             
            </div>
	</div>
</div>