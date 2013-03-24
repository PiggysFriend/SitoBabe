#!/usr/bin/perl -w

$page=new CGI;

# Librerie utilizzate
use CGI::Carp qw(fatalsToBrowser);
use CGI qw(:standard);
use XML::LibXML;
use Encode;

#Recupero dati inerenti le domande
$domanda1=$page->param("1");
$domanda2=$page->param("2");
$domanda3=$page->param("3");

#Recupero dati inerenti i commenti
$utente=$page->param("name");
$mail=$page->param("e-mail");
$data=((localtime)[3])."-".((localtime)[4])."-".(1900+(localtime)[5]);
$commento=$page->param("commento");

$error= "false";

# Controllo dati immessi
if ($domanda1 eq "") 
{
	$error=true;
}

if ($domanda2 eq "") 
{
	$error=true;
}

if ($domanda3 eq "") 
{
	$error=true;
}

if ($utente eq "") 
{
	$error=true;
}

if ($mail eq "") 
{
	$error=true;
}

if ($commento eq "") 
{
	$error=true;
}

# Stampa della pagina errore o aggiunta al database
if ($error eq "true") {
	print $page->redirect(-uri=>"../Errori.html");
}
else 
{
	#print "Content-Type: text/html\n";
	#print "Content-Enconding: utf8\n\n";
	#print $risposta1;
	#print " ---------- ";
	#print $value;

	#Procedure di inizializzazione per l'elaborazione dei dati
	my $file = "../data/Sondaggi.xml";
	my $parser = XML::LibXML->new();
	my $doc = $parser->parse_file($file);
	my $radice = $doc->getDocumentElement;
		
	my $risposta1 = int($doc->findnodes("//domanda[\@numero='1']/scelta[\@etichetta='".$domanda1."']/votanti/text()"));
	$value=$risposta1 + 1;
	my $nodoRisposta1 = $doc->findnodes("//domanda[\@numero='1']/scelta[\@etichetta='".$domanda1."']/votanti/text()")->get_node(1);
	$nodoRisposta1->setData($value);
	open (DATA, ">$file");
	print DATA $doc->toString;
	close(DATA);
	
	#aggiorno domanda 2
	my $risposta2 = int($doc->findnodes("//domanda[\@numero='2']/scelta[\@etichetta='".$domanda2."']/votanti/text()"));
	$value=$risposta2 + 1;
	my $nodoRisposta2 = $doc->findnodes("//domanda[\@numero='2']/scelta[\@etichetta='".$domanda2."']/votanti/text()")->get_node(1);
	$nodoRisposta2->setData($value);
	open (DATA, ">$file");
	print DATA $doc->toString;
	close(DATA);
	
	#aggiorno domanda 3
	my $risposta3 = int($doc->findnodes("//domanda[\@numero='3']/scelta[\@etichetta='".$domanda3."']/votanti/text()"));
	$value=$risposta3 + 1;
	my $nodoRisposta3 = $doc->findnodes("//domanda[\@numero='3']/scelta[\@etichetta='".$domanda3."']/votanti/text()")->get_node(1);
	$nodoRisposta3->setData($value);
	open (DATA, ">$file");
	print DATA $doc->toString;
	close(DATA);
	
	#inserisco commento
	$commentoDaAggiungere = "<commento utente=\"$utente\" mail=\"$mail\" data=\"$data\">$commento</commento>";
	$frammento = $parser->parse_balanced_chunk($commentoDaAggiungere);
	#mi faccio restituire il nodo "commenti"
	my @elementoDaAggiungere = $radice->getElementsByTagName("commenti");
	#inserisco il nuovo commento
	$elementoDaAggiungere[i]->appendChild($frammento);
	open (DATA, ">$file");
	print DATA $doc->toString;
	close(DATA);
	
	print $page->redirect(-uri=>"../Conferma.html");
}
