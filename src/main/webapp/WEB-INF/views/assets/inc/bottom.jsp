<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
		<div class= "bottom-box">
		<div class="row-fottt">
			<div class="fottt"><a href="21_Management.do"><img src="./assets/img/foot_logo.png" class="blogo"></a></div>

				<address>파이썬 빅데이터반 2조 <br/>
				만든이 : 조지현 박기협 정민기 이승석 김체리<br/>
				주소 : 경기도 성남시 분당구 야탑동 288-4 101호 &nbsp; 대표자:이승석 <br/>
				 <br/>
				<a href="tel:010-5458-6321">고객센터 : 010-5458-6321</a> / 사이트에 대한 문의 <a href="mailto:lss0238@gmail.com">lss0238@gmail.com</a>
				</address>
			<a href="http://www.ezenac.co.kr"><span class="bottom-img"><img src="./assets/img/ezen.jpg" alt="이젠" /></span></a>
		</div>
		</div>
	</footer>
	<!-- Javascript -->
    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$(".page-move1").hover(
    			function(e){
    				$(this).css("background-color","#ffa500").css("color","white");
    			},
    			function(e){
    				$(this).css("background-color","white").css("color","#ffa500");
    			}	
    		);
    		
    		
    		
    		
    		 $(".intro").hover(
    			function(){$(".intro").css("background-color","#ffa500").css("color","white");},
    			
    			function(){
    				if($("#d2").hasClass('open')){
               			$('.intro').css("background-color","#ffa500").css("color","white");
               		} else{
              			$(".intro").css("background-color","white").css("color","#ffa500");
               		}	
    		});
        	
        	$(".fdp").hover(
            	function(){$(".fdp").css("background-color","#ffa500").css("color","white");},
              			
            	function(){
            		if($("#d1").hasClass('open')){
               			$('.fdp').css("background-color","#ffa500").css("color","white");
               		} else{
              			$(".fdp").css("background-color","white").css("color","#ffa500");
               		}	
            });
        	
        	
        	$(document).on("click","body",function(e){
        		
        		if($("#d2").hasClass('open')){
        			$(".intro").css("background-color","ffa500").css("color","#white");
        		}
        		if($("#d2").attr('class') == 'dropdown'){
        			$(".intro").css("background-color","white").css("color","#ffa500");
        		}
        		
        		if($("#d1").hasClass('open')){
        			$(".fdp").css("background-color","ffa500").css("color","#white");
        		}
            	if($("#d1").attr('class') == 'dropdown'){
            		$(".fdp").css("background-color","white").css("color","#ffa500");
            	}
        	});
        	 
        	
        	
        		
    	});
    </script>