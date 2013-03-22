#path d'installazione di perl 
#!/usr/bin/perl -w

$page=new CGI;

# Librerie utilizzate
use CGI::Carp qw(fatalsToBrowser);
use CGI qw(:standard);
use XML::LibXML;
use Encode;

#Recupero dati inerenti le domande
$domanda1=$page->param('1');
$domanda2=$page->param('2');
$domanda3=$page->param('3');

#Recupero dati inerenti i commenti
$utente=$page->param('name');
$mail=$page->param('email');
$data=((localtime)[3])."/".((localtime)[4])."/".(1900+(localtime)[5]);
$commento=$page->param('commento');

# Creazione hash di controllo
%check = ("domanda1"=>"0",
	"domanda2"=>"0",
	"domanda3"=>"0",
	"name"=>"0",
	"email"=>"0",
	"commento"=>"0");

# Controllo dati immessi
if ($domanda1 == "") 
{
	$check{"domanda1"} = "1";
	$error=true;
}

if ($domanda2 == "") 
{
	$check{"domanda2"} = "1";
	$error=true;
}

if ($domanda3 == "") 
{
	$check{"domanda3"} = "1";
	$error=true;
}

if ($name == "") 
{
	$check{"name"} = "1";
	$error=true;
}

if ($email !~ /^([\w\-\+\.]+)\@([\w\-\+\.]+)\.([\w\-\+\.]+)$/) 
{
	$check{"email"} = "1";
	$error=true;
}

if ($commento == "") 
{
	$check{"commento"} = "1";
	$error=true;
}

# Stampa della pagina errore o aggiunta al database
if ($error) {
	print $page->redirect(-uri=>'../public_html/Home.html');
}
else 
{
	print $page->redirect(-uri=>'../public_html/Colori.html');
}
