<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:a="http://www.ilmondodibabe.it">
	<xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes" />


<xsl:template match="/">
 
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="it" lang="it">
	<head>
		<title>Home - Il mondo di Babe</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="description" content="Portale dedicato alle avventure di Babe: tante schede didattiche e curiosità per imparare divertendosi in compagnia del maialino più coraggioso che ci sia." />
		<meta name="keywords" content="Babe, film, impara, il mondo di Babe" />
		<meta name="author" content="Andrea Meneghinello, Andrea Rizzi, Diego Beraldin, Elena Zecchinato" />
		<meta name="language" content="italian it" />
		<link href="../NormalLayout.css" rel="stylesheet" type="text/css" media="screen"/>
		<link href="../SmallLayout.css" rel="stylesheet" type="text/css" media="handheld, screen and (max-width:850px), only screen and (max-device-width:480px)"/>
	</head>
	<body>
		<div id="bodyWrap" class="group">
			<div id="header">
				<h1>Il mondo di <span xml:lang="en">Babe</span></h1>
				<p>Ti trovi nella <span xml:lang="en">Home</span> del sito!</p>
			</div>
			
			<div id="nav">
				<a href="#rss" class="nascosto">Salta menù</a>
				<h2>Menù</h2>
				<ul>
					<li><a href="">Lo sapevi che...</a></li>
					<li><a href="Trama.html"> Trama dei film</a></li>
					<li><a href="Personaggi.html">Personaggi</a></li>
					<li><a href="Interpreti.html">Interpreti</a></li>
					<li><a href="">Parla con...</a></li>
					<li><a href="ImparaConBabe.html">Impara con <span xml:lang="en">Babe</span></a></li>
					<li><a href="">Suggerimenti</a></li>
					<li><a href="">Riconoscimenti</a></li>
					<li><a href=""><span xml:lang="en">Link</span> utili</a></li>
				</ul>
			</div>
			
			<div id="rss">
				<a href="#content" class="nascosto">Salta lista RSS</a>
				<h2>Feed RSS</h2>
			</div>
			
			<div id="content" class="group">
			
			<!--FORMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-->
			<!--//sondaggi/sondaggio[@numero='1']-->
			<form action="" method="POST">
				<fieldset>
					<legend>Sondaggio</legend>
					<xsl:for-each select="//a:sondaggio[@numero='1']/a:domanda">
						<xsl:sort select="@numero"/>
						<fieldset>
							<legend><xsl:value-of select="@etichetta"/></legend>
								<xsl:for-each select="a:scelta">
									<xsl:sort select="@numero"/>
									<div>
										<label class = "etichetta">
											<xsl:attribute name = "for"><xsl:value-of select='@etichetta' /></xsl:attribute>
											<xsl:value-of select='@etichetta' />
										</label>
										<input type = "radio">
											<xsl:attribute name="name"><xsl:value-of select = "../@numero"/></xsl:attribute>
											<xsl:attribute name="id"><xsl:value-of select = "@etichetta"/></xsl:attribute>
											<xsl:attribute name="value"><xsl:value-of select = "@etichetta"/></xsl:attribute>
										</input>
									</div>
								</xsl:for-each>
						</fieldset>
					</xsl:for-each>
					<div>
						<label class="etichetta" for="name">Nome utente</label>
						<input type="text" id = "name"></input>
					</div>
					<div>
						<label class="etichetta" for="e-mail">e-mail</label>
						<input type="text" id = "e-mail"></input>
					</div>
					<div>
						<label class="etichetta" for="commento">commento</label>
						<textarea rows="5" cols="40" id="commento"></textarea>
					</div>
					<div>
						<input type="submit"></input>
						<input type="reset"></input>
					</div>
				</fieldset>
				<!--<fieldset>
					<legend>Commneti</legend>
					<xsl:for-each select="//a:commento[@numero='1']">
						<label class = "etichetta">
							<xsl:attribute name = "for">utente: <xsl:value-of select='@utente' /></xsl:attribute>
							<xsl:value-of select='@utente' />
						</label>
					</xsl:for-each></fieldset>-->
			</form>
			
			</div>
			
			<div id="foot">
				<p>
    					<a href="http://validator.w3.org/check?uri=referer"><img
					src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Strict" height="31" width="88" /></a>
				</p>
				<p>
					<a href="http://jigsaw.w3.org/css-validator/check/referer">
					<img style="border:0;width:88px;height:31px"
					src="http://jigsaw.w3.org/css-validator/images/vcss"
					alt="CSS Valido!" />
					</a>
				</p>
			</div>
		</div>
	</body>
</html>
		
</xsl:template>
</xsl:stylesheet>
