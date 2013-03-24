window.onload = function() {
	var date = new Date();
	var days = [ "domenica", "lunedì", "martedì", "mercoledì", "giovedì",
			"venerdì", "sabato", "domenica" ];
	var months = [ "", "gennaio", "febbraio", "marzo", "aprile", "maggio",
			"giugno", "luglio", "agosto", "settembre", "ottobre", "novembre",
			"dicembre" ];
	text += days[date.getDay()];
	var stringDate = date.toLocaleString();
	var array = stringDate.split("/");

	var text = "Oggi è " + days[date.getDay()] + " " + array[0];
	text += " " + months[array[1]];
	text += " " + date.getFullYear();

	var element = document.getElementById("data");
	element.appendChild(document.createTextNode(text));
}