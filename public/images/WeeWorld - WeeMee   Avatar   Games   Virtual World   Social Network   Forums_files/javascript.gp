function geoplugin_request() { return '62.88.128.137';} 
function geoplugin_status() { return '200';} 
function geoplugin_credit() { return 'Some of the returned data includes GeoLite data created by MaxMind, available from <a href=\\\'http://www.maxmind.com\\\'>http://www.maxmind.com</a>.';} 
function geoplugin_city() { return '';} 
function geoplugin_region() { return 'V&auml;stra G&ouml;talands L&auml;n';} 
function geoplugin_regionCode() { return '28';} 
function geoplugin_regionName() { return 'V&auml;stra G&ouml;talands L&auml;n';} 
function geoplugin_areaCode() { return '0';} 
function geoplugin_dmaCode() { return '0';} 
function geoplugin_countryCode() { return 'SE';} 
function geoplugin_countryName() { return 'Sweden';} 
function geoplugin_continentCode() { return 'EU';} 
function geoplugin_latitude() { return '57.716702';} 
function geoplugin_longitude() { return '11.9667';} 
function geoplugin_currencyCode() { return 'SEK';} 
function geoplugin_currencySymbol() { return '&#107;&#114;';} 
function geoplugin_currencySymbol_UTF8() { return 'kr';} 
function geoplugin_currencyConverter(amt, symbol) { 
	if (!amt) { return false; } 
	var converted = amt * 6.4895; 
	if (converted <0) { return false; } 
	if (symbol === false) { return Math.round(converted * 100)/100; } 
	else { return '&#107;&#114;'+(Math.round(converted * 100)/100);} 
	return false; 
} 
