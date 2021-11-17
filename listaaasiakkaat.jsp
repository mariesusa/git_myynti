<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Myynti</title>
<link href="css/styleMyynti.css" rel="stylesheet" type="text/css">
</head>
<body>
<table id = "listaus">
	<thead>
		<tr>
			<th><label1>Hakusana:</label1></th>
			<th><label1><input type="text" id="hakusana"></label1>
			<th><label1><input type="button" value="Hae" id="hakunappi"><tr></label1>

			<th><label>Etunimi</label></th>
			<th><label>Sukunimi</label></th>
			<th><label>Puhelinnumero</label></th>
			<th><label>Sähköpostiosoite</label></th>
			
		</tr>
	</thead>
	<tbody>
	</tbody>		
</table>
<script>
$(document).ready(function() {
	
	haeAsiakkaat();
	$("#hakunappi").click(function(){
		haeAsiakkaat();
	});
	$(document.body).on("keydown", function(event) {
		if (event.which==13) {
			haeAsiakkaat();
		}
	});
	$("hakusana").focus();
});
function haeAsiakkaat() {
	$("#listaus tbody").empty();
	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success: function(result) {//Funktio palauttaa tiedot json-objektina
			$.each(result.asiakkaat, function(i, field) {
			var htmlStr;
			htmlStr+="<tr>";
			//htmlStr+="<td>" + field.asiakas_id + "</td>";
			htmlStr+="<td>" + field.etunimi + "</td>";
			htmlStr+="<td>" + field.sukunimi + "</td>";
			htmlStr+="<td>" + field.puhelin + "</td>";
			htmlStr+="<td>" + field.sposti + "</td>";
			htmlStr+="</tr>";
			$("#listaus tbody").append(htmlStr);
		});
	}});
}
</script>
</body>
</html>