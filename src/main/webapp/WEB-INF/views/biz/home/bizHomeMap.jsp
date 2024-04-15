<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bizHome.bh_name} 지도 보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  	<style>
	 .fa-solid{
	 	color: #1a1f27;
	 }
	 .fa-solid:hover{
	 	color: #1e90ff;
	 } 
	</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="px-3" style="width: 750px" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4><span style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">${bizHome.bh_name}</strong>
						   	</span></h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">지도를 클릭하시면 길찾기로 연결됩니다.</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-4" onclick="location.href='/ibara/biz/home/bizHome?inteno=${bizHome.inteno}'">
			<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">이전 화면 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
		</div>
	</div>	
		
		<div class="text-primary text-opacity-25">
			<hr style="height: 1px; width: 680px; margin: 5px;"/>
		</div>
</div>


<div id="map" style="width:100%;height:500px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b3258e2aa6ba25ac3a1649b721bb7da&libraries=services"></script>
<script>

var bizHomeAddr1='${bizHome.bh_addr1}';
var bizHomeAddr2='${bizHome.bh_addr2}';
var bizHomeAddr=bizHomeAddr1+" "+bizHomeAddr2;

// 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.404989, 126.948420), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch(bizHomeAddr, placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
    
//장소명이 인포윈도우에 표출됩니다   
infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
infowindow.open(map, marker);

//지도에 클릭 이벤트를 등록합니다
//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	 var url = 'https://map.kakao.com/link/map/' + place.id;
     window.open(url, '_blank');
     
     /* 
 // 클릭한 위도, 경도 정보를 가져옵니다 
 var latlng = mouseEvent.latLng;
 
 var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
 message += '경도는 ' + latlng.getLng() + ' 입니다';
 
 var resultDiv = document.getElementById('result'); 
 resultDiv.innerHTML = message; */
        
        
    });
    
//마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'click', function() {
	 var url = 'https://map.kakao.com/link/map/' + place.id;
     window.open(url, '_blank');
/* 	// 클릭한 위도, 경도 정보를 가져옵니다 
	 var latlng = mouseEvent.latLng;
	 
	 var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	 message += '경도는 ' + latlng.getLng() + ' 입니다';
	 
	 var resultDiv = document.getElementById('result'); 
	 resultDiv.innerHTML = message; */
});    
  

    
    
}
</script>
</body>
</html>