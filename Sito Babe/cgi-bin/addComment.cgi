#!/usr/bin/perl 

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

$error= "false";

# Controllo dati immessi
if ($domanda1 eq "") 
{
	$check{"domanda1"} = "1";
	$error=true;
}

if ($domanda2 eq "") 
{
	$check{"domanda2"} = "1";
	$error=true;
}

if ($domanda3 eq "") 
{
	$check{"domanda3"} = "1";
	$error=true;
}

if ($name eq "") 
{
	$check{"name"} = "1";
	$error=true;
}

if ($email !~ /^([\w\-\+\.]+)\@([\w\-\+\.]+)\.([\w\-\+\.]+)$/) 
{
	$check{"email"} = "1";
	$error=true;
}

if ($commento eq "") 
{
	$check{"commento"} = "1";
	$error=true;
}

# Stampa della pagina errore o aggiunta al database
if ($error eq "true") {
	print $page->redirect(-uri=>'../public_html/Home.html');
}
else 
{
	#Procedure di inizializzazione per l'elaborazione dei dati
	my $file = '../data/Sondaggi.xml';
	my $parser = XML::LibXML->new();
	my $doc = $parser->parse_file($file);
	my $radice = $doc->getDocumentElement;
	
	#aggiorno domanda 1
	my $risposta1 = $doc->findNodes("//domanda[@numero='1']/scelta[@etichetta='".$domanda1."']/votanti/text()");
	$risposta1->setData($risposta1+1);
	open (DATA, ">$file");
	print DATA $doc->toString;
	close(DATA);
	
	#my @elementi = $radice->getElementsByTagName('database');
	#$frammento = $parser->parse_balanced_chunk($user);
	#$elementi[i]->appendChild($frammento);

	print $page->redirect(-uri=>'../public_html/Colori.html');
}
