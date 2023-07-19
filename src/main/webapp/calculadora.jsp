<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

  <div class="calculator">
    <div class="display">
      <p id='resultado' class="input"></p>     
    </div>
	<table>
		<tr>
			<td><button class="button clean" onclick="clean()">C</button></td>
    	<td><button class="button mod" onclick="backspace()">⇦</button></td>
      <td><button class="button operator" onclick="insert('/')">÷</button></td>
    	<td><button class="button operator" onclick="insert('*')">x</button></td>
		</tr>
    <tr>
    	<td><button class="button digit" onclick="insert('7')" >7</button></td>
      <td><button class="button digit" onclick="insert('8')">8</button></td>
   	 	<td><button class="button digit" onclick="insert('9')">9</button></td>
   	 	<td><button class="button operator" onclick="insert('-')">-</button></td>
    </tr>
    <tr>
    	<td><button class="button digit" onclick="insert('4')">4</button></td>
    	<td><button class="button digit" onclick="insert('5')">5</button></td>
   	 	<td><button class="button digit" onclick="insert('6')">6</button></td>
   	 	<td><button class="button operator" onclick="insert('+')">+</button></td>
    </tr>
    <tr>
      <td><button class="button digit" onclick="insert('1')">1</button></td>
   		<td><button class="button digit" onclick="insert('2')">2</button></td>
			<td><button class="button digit" onclick="insert('3')">3</button></td>
   		<td rowspan=2><button class="button result" style="height: 150px" onclick="calcular()">=</button></td>    	
    </tr>
    <tr>
    	<td colspan=2><button class="button digit" style='width: 150px'onclick="insert('0')">0</button></td>
    	<td><button class="button digit" onclick="insert('.')">.</button></td>
    </tr>
	</table>

  </div>


</body>

<style> 
	  body {
			background-image: url("https://blog.thehotelsnetwork.com/hs-fs/hubfs/Barbie%20wallpaper.jpg?width=770&name=Barbie%20wallpaper.jpg");
			background-size: cover;
		}
  *{
  	margin: 0;
    padding: 0;
  }
  .calculator{
  	position: absolute;
    background-color: #cf0187;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    border-radius: 15px;
    padding: 15px;
    border: 5px solid #744ef8;
  } 
  
  .button{
  	background-color: #cd95ff;
 		border: 2px solid black;
  	border-radius: 10px;
  	font-size: 24px;
 		padding: 15px;
  	cursor: pointer;
		transition: transform 0.2s ease;
    margin: 3px;
    height: 70px;
    width: 70px;
  }
  
  .button:hover{
    background-color: #f1e6fb;
		transform: scale(1.1);	
  }
  
  .button:active {
  background-color: #98ceff;
}
  
  .clean{
  	
  }
  
  .operator {
  background-color: #744ef8;
  color: black;
}
  
  .result {
  background-color: black;
  color: #fff;
}
  
  .display{
  	text-align: center;   
  }
  
  .input{
  	height: 70px;
    width: 300px;
    border-radius: 15px;
    text-align: right;
    font-size: 50;
  }
  
  #resultado{
  	background-color: pink;
    margin: 7px;
    height: 70px;
    width: 300px;
    padding: 5px;
    border: 5px solid #744ef8;    
  }
	
</style>

<script>
function insert(value) {
	  var numero = document.getElementById("resultado").innerHTML;
	    document.getElementById("resultado").innerHTML = numero + value;
	}

	  function clean() {
	  document.getElementById("resultado").innerHTML = "";
	  
	}
	  
	  function backspace() {
	  var resultado = document.getElementById("resultado").innerHTML;
	    document.getElementById("resultado").innerHTML = resultado.substring(0, resultado.length -1);
	}
	  
	  function calcular() {
	  var resultado = document.getElementById("resultado").innerHTML;
	  	if(resultado){
	    document.getElementById("resultado").innerHTML = eval(resultado);
	    }
	}
</script>
</html>