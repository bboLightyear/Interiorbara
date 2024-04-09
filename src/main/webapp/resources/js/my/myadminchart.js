	const ctx=document.getElementById('myChart');
	
	new Chart(ctx,{
		  type: 'line',
		  data: {
			  labels:['Red','Blue','Yellow','Green','Purple','Orange'],
			  datasets:[{
				  label: '#Votes',
				  data:[12,19,3,5,2,3],
				  backgroundColor:[
					  '#0a1c32',
					  '#13345d',
					  '#235899',
					  '#4982c8',
					  '#7eabe1',
					  '#c6d9f1'
				  ],
				  borderWidth:5
			  }]
		  },
		  options: {
		    responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      },
		      title: {
		        display: true,
		        text: 'Chart.js Line Chart'
		      }
		    }
		  }
		}			
	);
	
const ctx2=document.getElementById('myChart2');
	
	new Chart(ctx2,{
		  type: 'bar',
		  data: {
			  labels:['Red','Blue','Yellow','Green','Purple','Orange'],
			  datasets:[{
				  label: '#Votes',
				  data:[12,19,3,5,2,3],
				  backgroundColor:[
					  '#0a1c32',
					  '#13345d',
					  '#235899',
					  '#4982c8',
					  '#7eabe1',
					  '#c6d9f1'
				  ],
				  borderWidth:0
			  }]
		  },
		  options: {
		    responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      },
		      title: {
		        display: true,
		        text: 'Chart.js bar Chart'
		      }
		    }
		  }
		}			
	);
	