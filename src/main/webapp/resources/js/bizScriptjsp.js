 const drawStar = (target) => {
  console.log("sign>>>>"+target.value);
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
   
  }
 
 const drawHeart = (target) => {
	  console.log("sign>>>>"+target.value);
	    document.querySelector(`.heart span`).style.width = `${target.value * 100}%`;
	   
	  }