function checkEmail()
{
	
}

function checkText(idElement, idError)
{
	var pos = document.getElementById(idElement).value.search(/\D/);
	if (pos != 0)
	{
		document.getElementById(idError).style.display = "inline";
		return true;
	}
	else
	{
		document.getElementById(idError).style.display = "none";
		return false;
	}
}