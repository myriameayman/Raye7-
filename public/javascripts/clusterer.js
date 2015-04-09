//
var defaultMaxVisibleMarkers=150;var defaultGridSize=5;var defaultMinMarkersPerCluster=5;var defaultMaxLinesPerInfoBox=10;var defaultIcon=new GIcon();defaultIcon.image='http://www.acme.com/resources/images/markers/blue_large.PNG';defaultIcon.shadow='http://www.acme.com/resources/images/markers/shadow_large.PNG';defaultIcon.iconSize=new GSize(30,51);defaultIcon.shadowSize=new GSize(56,51);defaultIcon.iconAnchor=new GPoint(13,34);defaultIcon.infoWindowAnchor=new GPoint(13,3);defaultIcon.infoShadowAnchor=new GPoint(27,37);function Clusterer(map)
{this.map=map;this.markers=[];this.clusters=[];this.timeout=null;this.currentZoomLevel=map.getZoomLevel();this.maxVisibleMarkers=defaultMaxVisibleMarkers;this.gridSize=defaultGridSize;this.minMarkersPerCluster=defaultMinMarkersPerCluster;this.maxLinesPerInfoBox=defaultMaxLinesPerInfoBox;this.icon=defaultIcon;GEvent.addListener(map,'zoom',ClustererPartial(ClustererDisplay,this));GEvent.addListener(map,'moveend',ClustererPartial(ClustererDisplay,this));GEvent.addListener(map,'infowindowclose',ClustererPartial(ClustererPopDown,this));}
Clusterer.prototype.SetIcon=function(icon)
{this.icon=icon;}
Clusterer.prototype.AddMarker=function(marker,title)
{marker.map=this.map;marker.title=title;this.markers.push(marker);this.DisplayLater();}
Clusterer.prototype.RemoveMarker=function(marker)
{for(var i=0;i<this.markers.length;++i)
if(this.markers[i]==marker)
{if(marker.onMap)
this.map.removeOverlay(marker);for(j=0;j<this.clusters.length;++j)
{cluster=clusterer.clusters[j];if(cluster!=null)
{for(k=0;k<cluster.markers.length;++k)
if(cluster.markers[k]==marker)
{cluster.markers[k]=null;--cluster.markerCount;break;}
if(cluster.markerCount==0)
{this.ClearCluster(cluster);clusterer.clusters[j]=null;}
else if(cluster==this.poppedUpCluster)
ClustererRePop(this);}}
this.markers[i]=null;break;}
this.DisplayLater();}
Clusterer.prototype.DisplayLater=function()
{if(this.timeout!=null)
clearTimeout(this.timeout);this.timeout=setTimeout(ClustererPartial(ClustererDisplay,this),50);}
function ClustererDisplay(clusterer)
{var i,j,marker,cluster,point;clearTimeout(clusterer.timeout);var newZoomLevel=clusterer.map.getZoomLevel();if(newZoomLevel!=clusterer.currentZoomLevel)
{for(i=0;i<clusterer.clusters.length;++i)
if(clusterer.clusters[i]!=null)
{clusterer.ClearCluster(clusterer.clusters[i]);clusterer.clusters[i]=null;}
clusterer.clusters.length=0;clusterer.currentZoomLevel=newZoomLevel;}
var bounds=clusterer.map.getBoundsLatLng();var dx=bounds.maxX-bounds.minX;var dy=bounds.maxY-bounds.minY;dx*=0.10;dy*=0.10;bounds.maxX+=dx;bounds.minX-=dx;bounds.maxY+=dy;bounds.minY-=dy;//
var visibleMarkers=[];var nonvisibleMarkers=[];for(i=0;i<clusterer.markers.length;++i)
{marker=clusterer.markers[i];if(marker!=null)
if(ClustererPointInBounds(marker.point,bounds))
visibleMarkers.push(marker);else
nonvisibleMarkers.push(marker);}
for(i=0;i<nonvisibleMarkers.length;++i)
{marker=nonvisibleMarkers[i];if(marker.onMap)
{clusterer.map.removeOverlay(marker);marker.onMap=false;}}
for(i=0;i<clusterer.clusters.length;++i)
{cluster=clusterer.clusters[i];if(cluster!=null&&!ClustererPointInBounds(cluster.marker.point,bounds)&&cluster.onMap)
{clusterer.map.removeOverlay(cluster.marker);cluster.onMap=false;}}
if(visibleMarkers.length>clusterer.maxVisibleMarkers)
{var latRange=bounds.maxY-bounds.minY;var latInc=latRange/clusterer.gridSize;var lonInc=latInc/Math.cos((bounds.maxY+bounds.minY)/2.0*Math.PI/180.0);for(var lat=bounds.minY;lat<=bounds.maxY;lat+=latInc)
for(var lon=bounds.minX;lon<=bounds.maxX;lon+=lonInc)
{cluster=new Object();cluster.clusterer=clusterer;cluster.bounds=new GBounds(lon,lat,lon+lonInc,lat+latInc);cluster.markers=[];cluster.markerCount=0;cluster.onMap=false;cluster.marker=null;clusterer.clusters.push(cluster);}
for(i=0;i<visibleMarkers.length;++i)
{marker=visibleMarkers[i];if(marker!=null&&!marker.inCluster)
{for(j=0;j<clusterer.clusters.length;++j)
{cluster=clusterer.clusters[j];if(cluster!=null&&ClustererPointInBounds(marker.point,cluster.bounds))
{cluster.markers.push(marker);++cluster.markerCount;marker.inCluster=true;}}}}
for(i=0;i<clusterer.clusters.length;++i)
if(clusterer.clusters[i]!=null&&clusterer.clusters[i].markerCount<clusterer.minMarkersPerCluster)
{clusterer.ClearCluster(clusterer.clusters[i]);clusterer.clusters[i]=null;}
for(i=clusterer.clusters.length-1;i>=0;--i)
if(clusterer.clusters[i]!=null)
break;else
--clusterer.clusters.length;for(i=0;i<clusterer.clusters.length;++i)
{cluster=clusterer.clusters[i];if(cluster!=null)
{for(j=0;j<cluster.markers.length;++j)
{marker=cluster.markers[j];if(marker!=null&&marker.onMap)
{clusterer.map.removeOverlay(marker);marker.onMap=false;}}}}
for(i=0;i<clusterer.clusters.length;++i)
{cluster=clusterer.clusters[i];if(cluster!=null&&cluster.marker==null)
{var xTotal=0.0,yTotal=0.0;for(j=0;j<cluster.markers.length;++j)
{marker=cluster.markers[j];if(marker!=null)
{xTotal+=(+marker.point.x);yTotal+=(+marker.point.y);}}
point=new GPoint(xTotal/cluster.markerCount,yTotal/cluster.markerCount);marker=new GMarker(point,clusterer.icon);cluster.marker=marker;GEvent.addListener(marker,'click',ClustererPartial(ClustererPopUp,cluster));}}}
for(i=0;i<visibleMarkers.length;++i)
{marker=visibleMarkers[i];if(marker!=null&&!marker.onMap&&!marker.inCluster)
{clusterer.map.addOverlay(marker);var title=marker.title;if(title!=null)
ClustererSetTooltip(marker,title);marker.onMap=true;}}
for(i=0;i<clusterer.clusters.length;++i)
{cluster=clusterer.clusters[i];if(cluster!=null &&!cluster.onMap&&ClustererPointInBounds(cluster.marker.point,bounds))
{clusterer.map.addOverlay(cluster.marker);cluster.onMap=true;}}
ClustererRePop(clusterer);}
function ClustererPopUp(cluster)
{var clusterer=cluster.clusterer;var html='<table width="300">';var n=0;for(var i=0;i<cluster.markers.length;++i)
{var marker=cluster.markers[i];if(marker!=null)
{++n;html+='<tr><td>';if(marker.icon.smallImage!=null)
html+='<img src="'+marker.icon.smallImage+'">';else
html+='<img src="'+marker.icon.image+'" width="'+(marker.icon.iconSize.width/2)+'" height="'+(marker.icon.iconSize.height/2)+'">';html+='</td><td>'+marker.title+'</td></tr>';if(n==clusterer.maxLinesPerInfoBox-1&&cluster.markerCount>clusterer.maxLinesPerInfoBox)
{html+='<tr><td colspan="2">...and '+(cluster.markerCount-n)+' more</td></tr>';break;}}}
html+='</table>';clusterer.poppedUpCluster=cluster;cluster.marker.openInfoWindowHtml(html);}
function ClustererRePop(clusterer)
{if(clusterer.poppedUpCluster!=null)
ClustererPopUp(poppedUpCluster);}
function ClustererPopDown(clusterer)
{clusterer.poppedUpCluster=null;}
Clusterer.prototype.ClearCluster=function(cluster)
{var i,marker;for(i=0;i<cluster.markers.length;++i)
if(cluster.markers[i]!=null)
{cluster.markers[i].inCluster=false;cluster.markers[i]=null;}
cluster.markers.length=0;cluster.markerCount=0;if(cluster==this.poppedUpCluster)
this.map.closeInfoWindow();if(cluster.onMap)
{this.map.removeOverlay(cluster.marker);cluster.onMap=false;}}
function ClustererPointInBounds(point,bounds)
{ var x=(+point.x);var y=(+point.y);return x>=bounds.minX&&x<=bounds.maxX&&y>=bounds.minY&&y<=bounds.maxY;}
function ClustererPartial()
{var partialArgs=arguments;var func=partialArgs[0];return function()
{var funcArgs=[];for(var i=1,j=0;i<partialArgs.length||j<arguments.length;++i)
if(partialArgs[i]===undefined)
funcArgs.push(arguments[j++]);else
funcArgs.push(partialArgs[i]);return func.apply(func,funcArgs);};}
function ClustererSetTooltip(marker,title)
{var textTitle=ClustererDeHtmlize(title);if(marker.transparentIcon!=null)
marker.transparentIcon.setAttribute('title',textTitle);else if(marker.imageMap!=null)
marker.imageMap.setAttribute('title',textTitle);else if(marker.iconImage!=null)
marker.iconImage.setAttribute('title',textTitle);}
function ClustererEntityToIso8859(inStr)
{var outStr='';for(var i=0;i<inStr.length;++i)
{var c=inStr.charAt(i);if(c!='&')
outStr+=c;else
{var semi=inStr.indexOf(';',i);if(semi==-1)
outStr+=c;else
{var entity=inStr.substring(i+1,semi);if(entity=='iexcl')outStr+='¡';else if(entity=='copy')outStr+='©';else if(entity=='laquo')outStr+='«';else if(entity=='reg')outStr+='®';else if(entity=='deg')outStr+='°';else if(entity=='raquo')outStr+='»';else if(entity=='iquest')outStr+='¿';else if(entity=='Agrave')outStr+='À';else if(entity=='Aacute')outStr+='Á';else if(entity=='Acirc')outStr+='Â';else if(entity=='Atilde')outStr+='Ã';else if(entity=='Auml')outStr+='Ä';else if(entity=='Aring')outStr+='Å';else if(entity=='AElig')outStr+='Æ';else if(entity=='Ccedil')outStr+='Ç';else if(entity=='Egrave')outStr+='È';else if(entity=='Eacute')outStr+='É';else if(entity=='Ecirc')outStr+='Ê';else if(entity=='Euml')outStr+='Ë';else if(entity=='Igrave')outStr+='Ì';else if(entity=='Iacute')outStr+='Í';else if(entity=='Icirc')outStr+='Î';else if(entity=='Iuml')outStr+='Ï';else if(entity=='Ntilde')outStr+='Ñ';else if(entity=='Ograve')outStr+='Ò';else if(entity=='Oacute')outStr+='Ó';else if(entity=='Ocirc')outStr+='Ô';else if(entity=='Otilde')outStr+='Õ';else if(entity=='Ouml')outStr+='Ö';else if(entity=='Oslash')outStr+='Ø';else if(entity=='Ugrave')outStr+='Ù';else if(entity=='Uacute')outStr+='Ú';else if(entity=='Ucirc')outStr+='Û';else if(entity=='Uuml')outStr+='Ü';
else if(entity=='Yacute')outStr+='Ý';else if(entity=='szlig')outStr+='ß';else if(entity=='agrave')outStr+='à';else if(entity=='aacute')outStr+='á';else if(entity=='acirc')outStr+='â';else if(entity=='atilde')outStr+='ã';else if(entity=='auml')outStr+='ä';else if(entity=='aring')outStr+='å';else if(entity=='aelig')outStr+='æ';else if(entity=='ccedil')outStr+='ç';else if(entity=='egrave')outStr+='è';else if(entity=='eacute')outStr+='é';else if(entity=='ecirc')outStr+='ê';else if(entity=='euml')outStr+='ë';else if(entity=='igrave')outStr+='ì';else if(entity=='iacute')outStr+='í';else if(entity=='icirc')outStr+='î';else if(entity=='iuml')outStr+='ï';else if(entity=='ntilde')outStr+='ñ';else if(entity=='ograve')outStr+='ò';else if(entity=='oacute')outStr+='ó';else if(entity=='ocirc')outStr+='ô';else if(entity=='otilde')outStr+='õ';else if(entity=='ouml')outStr+='ö';else if(entity=='oslash')outStr+='ø';else if(entity=='ugrave')outStr+='ù';else if(entity=='uacute')outStr+='ú';else if(entity=='ucirc')outStr+='û';else if(entity=='uuml')outStr+='ü';else if(entity=='yacute')outStr+='ý';else if(entity=='yuml')outStr+='ÿ';else if(entity=='nbsp')outStr+=' ';else if(entity=='lt')outStr+='<';else if(entity=='gt')outStr+='>';else if(entity=='amp')outStr+='&';else outStr+='&'+entity+';';i+=entity.length+1;}}}
return outStr;}
function ClustererDeEntityize(inStr)
{var outStr='';for(var i=0;i<inStr.length;++i)
{var c=inStr.charAt(i);if(c!='&')
outStr+=c;else
{var semi=inStr.indexOf(';',i);if(semi!=-1)
i=semi;}}
return outStr;}
function ClustererDeElementize(inStr)
{var outStr='';for(var i=0;i<inStr.length;++i)
{var c=inStr.charAt(i);if(c!='<')
outStr+=c;else
{var gt=inStr.indexOf('>',i);if(gt!=-1)
i=gt;}}
return outStr;}
function ClustererDeHtmlize(str)
{return ClustererDeEntityize(ClustererEntityToIso8859(ClustererDeElementize(str)));}
