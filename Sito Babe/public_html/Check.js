function checkEmail(idElement, idError)
{
	 var re =/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	 var email = document.getElementById(idElement).value;

    if (!re.test(email))
	{
		document.getElementById(idError).style.display = "inline";
		return true;
	}
	else
	{
		document.getElementById(idError).style.display = "none";
	}
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