#path d'installazione di perl 
#!/usr/bin/perl -w

$page=new CGI;

# Librerie utilizzate
use CGI::Carp qw(fatalsToBrowser);
use CGI qw(:standard);
use XML::LibXML;
use Encode;

#Recupero dati inerenti le domande
$domanda_1=$page->param('1');
$domanda_2=$page->param('2');
$domanda_3=$page->param('3');

#Recupero dati inerenti i commenti
$utente=$page->param('name');
$mail=$page->param('e-mail');
$data=
$commento=$page->param('commento');

