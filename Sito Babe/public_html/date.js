window.onload = function() {
	var date = new Date();
	var days = [ "domenica", "lunedì", "martedì", "mercoledì", "giovedì",
			"venerdì", "sabato", "domenica" ];
	var months = [ "gennaio", "febbraio", "marzo", "aprile", "maggio",
			"giugno", "luglio", "agosto", "settembre", "ottobre", "novembre",
			"dicembre" ];
	text += days[date.getDay()];

	var text = "Oggi è " + days[date.getDay()] + " " + date.getDate();
	text += " " + months[date.getMonth()];
	text += " " + date.getFullYear();

	var element = document.getElementById("data");
	element.appendChild(document.createTextNode(text));
}