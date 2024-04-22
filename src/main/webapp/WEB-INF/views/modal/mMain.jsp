<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<%
String path=request.getContextPath();
%>
    <title>mMain.jsp</title>
   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
   
</head> 
<body>

<!-- 모달 창 영역 -->
<div class="myModal" id="modal" data-prev-modal="">
    <div class="modal_content mainModal_content">
        <div class="modal_leftside">
            <div class=modal_leftside_progress>
                <!-- <ul>
                    <li data-step-name="services" class="">
                        <div>
                            <span>어떤 서비스가 필요하신가요?</span>
                        </div>
                    </li>
                    <li data-step-name="service_select" class="">
                        <div>
                            <span>원하는 서비스 선택하기</span>
                        </div>
                    </li>
                    <li data-step-name="ask" class="">
                        <div>
                            <span>추가질문</span>
                        </div>
                    </li>
                 
                    <li data-step-name="info" class="">
                        <div>
                            <span>정보입력</span>
                        </div>
                    </li>
                   
                    <li data-step-name="complete" class="">
                        <div>
                            <span>견적완료</span>
                        </div>
                    </li>
                </ul> -->
            </div>
            <div class="modal_leftside_img">
            	<img src="${pageContext.request.contextPath}/resources/img/modalimg/mMain.png" alt="mMain" />
            </div>
            <div class="modal_leftside_content">
                <h4>어떤 서비스가 필요하신가요?</h4>
                <div>필요한 서비스를 선택해 주세요.</div>
            </div>
            <div class="modal_leftside_question">
                <h4>바로문의</h4>
                010-1234-5678
            </div>
        </div>
        <div class="modal_center">
            <div class="modal_center_header">
                <h3>서비스 선택</h3>
                <span class="close">&times;</span>
            </div>
            <div class="mainModal_center_body">
                <div class="row">
                    <a href="${path}/biz/search/bizAddrSearch">
                    <div class="item1">
                        <img src="${pageContext.request.contextPath}/resources/img/modalimg/company.png" alt="Icon 1" class="icon1"> <span>업체 먼저 둘러보기</span>
                    </div>
                    </a>
                    <a href="#" class="openSizeModal" data-option="standard" data-service="스탠다드 커스텀 인테리어 ">
                    <div class="item2">
                        <img src="${pageContext.request.contextPath}/resources/img/modalimg/custom.png" alt="Icon 2" class="icon2"> <span>스탠다드 커스텀 인테리어 시공하기</span>
                    </div>
                    </a>
                    <a href="#" class="openSizeModal" data-option="premium" data-service="프리미엄 커스텀 인테리어 ">
                    <div class="item3">
                        <img src="${pageContext.request.contextPath}/resources/img/modalimg/premium.png" alt="Icon 3" class="icon3"> <span>프리미엄 커스텀 인테리어 시공하기</span>
                    </div>
                    </a>
                    <a href="#" class="openServiceCheckModal" data-option="kitchen" data-service="주방만 시공하기">
                    <div class="item4">
                        <img src="${pageContext.request.contextPath}/resources/img/modalimg/kitchen.jpg" alt="Icon 4" class="icon4"> <span>주방만 시공하기</span>
                    </div>
                    </a>
                    <a href="#" class="openServiceCheckModal"  data-option="bath" data-service="욕실만 시공하기">
                    <div class="item5">
                        <img src="${pageContext.request.contextPath}/resources/img/modalimg/bath.jpg" alt="Icon 5" class="icon5"> <span>욕실만 시공하기</span>
                    </div>  
                    </a>                   
                </div>
                	
            </div>
        </div>
        
    </div>
</div>

<jsp:include page="mSize.jsp" />
<jsp:include page="mServiceCheck.jsp" />
<jsp:include page="mAsk.jsp" />
<jsp:include page="mInfo.jsp" />
<jsp:include page="mComplete.jsp" />



<script>
$(document).ready(function() {
    var modal = $('.myModal');
    var btn = $('.openModal');
    var span = $('.close');
    var openSizeModalBtn = $('.openSizeModal');
    var openServiceCheckModalBtn = $('.openServiceCheckModal');
    var summaryButton = $('.summary-button');
    var modalRightside = $('.rightside');
    
    /* 요약보기 */
    summaryButton.on('click', function() {
        if (modalRightside.is(':visible')) {
            modalRightside.hide();
        } else {
            if ($(window).width() <= 950) {
                modalRightside.css({
                    'position': 'fixed',
                    'top': '11%',
                    'left': '44%',
                    'z-index': '99999',
                    'background-color': '#e2f0fe',
                    'padding': '20px',
                    'border-radius': '5px',
                    'box-shadow': '0 0 10px rgba(0, 0, 0, 0.3)',
                    'height': '400px',
                    'display': 'flex',
                    'flex-direction': 'column',
                    'overflow-y': 'auto'
                }).show();
            } else {
                modalRightside.show();
            }
        }
    });
	
    /* 창이 커지면 다시 rightside창이 원래자리로 돌아옴 */
    $(window).on('resize', function() {
        if ($(window).width() > 950) {
            modalRightside.removeAttr('style');
        } else {
            if (!modalRightside.is(':visible')) {
                modalRightside.hide();
            }
        }
    });

    	      
      
  

   

    function openModal(modalId) {
    	  $(modalId).css('display', 'block');
    	  setTimeout(function() {
    	    $(modalId).find('.modal_leftside_img, .modal_leftside_content, .rightside-ani, .modal_center_body, .complete_modal_center_body, .mainModal_center_body').addClass('show');
    	  }, 130);
    	}

    function closeModal(modalId) {
    	  $(modalId).find('.modal_leftside_img, .modal_leftside_content, .rightside-ani, .modal_center_body, .complete_modal_center_body, .mainModal_center_body').removeClass('show');
    	  setTimeout(function() {
    	    $(modalId).css('display', 'none');
    	  }, 50);
    	}
    

    btn.click(function() {
        openModal('.myModal');
    });

    span.click(function() {
        closeModal('.myModal');
       
    });

    $(window).click(function(event) {
        if (event.target == modal[0]) {
            closeModal('.myModal');
            
        }
    });

    function updateSelectedService(service) {
        $('.selectedService span').text(service);
      	$('#selectedService').text(service);
        $('.selectedService').show();
    }
    
 
    openSizeModalBtn.click(function() {
        var service = $(this).data('service');
        var option = $(this).data('option');
        updateSelectedService(service);
      
        $.ajax({
            type: "GET",
            async: true,
            url: "<%= path %>/modal/getServiceItems",
            data: { m_type: option },
            success: function(result) {
                var serviceItems = result;
                var productCheckbox = $(".productCheckBox");
                productCheckbox.empty();
                
                $.each(serviceItems, function(index, item) {
                    var m_pname = item.m_pname === null ? "" : item.m_pname;
                    var m_pexp = item.m_pexp === null ? "" : item.m_pexp;
                    var m_pprice = item.m_pprice === null ? "" : item.m_pprice;

                    var serviceItem = '<div class="serviceItem" data-option="' + option + '">' +
                                          '<div>' +
                                              '<input type="checkbox" class="productCheckBox" ' +
                                              'data-name="' + m_pname + '" data-exp="' + m_pexp + '" ' +
                                              'data-price="' + m_pprice + '">' +
                                          '</div>' +
                                          '<div>' +
                                              '<div class="item_m_pname">' + m_pname + '</div><br/>' +
                                              '<div class="item_m_pexp">' + m_pexp + '</div>' +
                                          '</div>' +
                                          '<div>' + m_pprice + '만원</div>' +
                                          '<div>' +
                                              '<button class="decreaseQuantity">-</button>' +
                                              '<input type="text" class="quantity" value="0" readonly>' +
                                              '<button class="increaseQuantity">+</button>' +
                                          '</div>' +
                                      '</div>';
                    productCheckbox.append(serviceItem);
                });
                
                closeModal('.myModal');
                openModal('.sizeModal');
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    });

    openServiceCheckModalBtn.click(function() {
        var service = $(this).data('service');
        var option = $(this).data('option');
        
        updateSelectedService(service);
       
        $('.serviceCheckModal').attr('data-prev-modal', option === 'kitchen' || option === 'bath' ? 'myModal' : 'sizeModal');
        
        $.ajax({
            type: "GET",
            async: true,
            url: "<%= path %>/modal/getServiceItems",
            data: { m_type: option },
            success: function(result) {
                var serviceItems = result;
                
                var productCheckbox = $(".productCheckBox");
                productCheckbox.empty();
                
                $.each(serviceItems, function(index, item) {
                    var m_pname = item.m_pname === null ? "" : item.m_pname;
                    var m_pexp = item.m_pexp === null ? "" : item.m_pexp;
                    var m_pprice = item.m_pprice === null ? "" : item.m_pprice;

                    var serviceItem = '<div class="serviceItem" data-option="' + option + '">' +
                                          '<div>' +
                                              '<input type="checkbox" class="productCheckBox" ' +
                                              'data-name="' + m_pname + '" data-exp="' + m_pexp + '" ' +
                                              'data-price="' + m_pprice + '">' +
                                          '</div>' +
                                          '<div>' +
                                              '<div class="item_m_pname">' + m_pname + '</div><br/>' +
                                              '<div class="item_m_pexp">' + m_pexp + '</div>' +
                                          '</div>' +
                                          '<div>' + m_pprice + '만원</div>' +
                                          '<div>' +
                                              '<button class="decreaseQuantity">-</button>' +
                                              '<input type="text" class="quantity" value="0" readonly>' +
                                              '<button class="increaseQuantity">+</button>' +
                                          '</div>' +
                                      '</div>';
                    productCheckbox.append(serviceItem);
                });
                
                closeModal('.myModal');
                openModal('.serviceCheckModal');
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    });
    
});
       

     
</script>


</body>
</html>