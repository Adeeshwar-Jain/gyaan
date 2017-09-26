// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// #<script type="text/javascript">
$(document).ready(function() {

		var select=document.getElementById('scroll');
		select.addEventListener('click',clicking);
		function clicking(event){
		var clear=setInterval(
		function (){
			console.log("clicking called");
			//addEventListener('scroll',scrollToTop);
			var current=window.scrollY;
			
			current=current-100;
			console.log(current);
			window.scrollTo(0,current);
			if(window.scrollY==0)
				clearInterval(clear);

		},30);
	}


		function scrollToTop(event){
			console.log("scroll called");

			

		}
		// window.load_more_active = false;
  //   window.offset = 10;
  //   document.addEventListener('scroll', function(event){
        
  //       if(!window.load_more_active){
  //       	if((document.body.scrollHeight-window.innerHeight)-window.scrollY<50){//this line works as a cross browser support eg:- it works on chrome
  //           console.log(window.scrollY);
  //           window.load_more_active = true;
  //           $.ajax({
  //             url: '/',
  //             type: 'GET',
  //             dataType: 'script',
  //             data: {
  //             offset: window.offset,
  //             format: 'js'
  //             }
  //           });
  //       } 
  //       }
        
  //   });





	})









	// </script>

