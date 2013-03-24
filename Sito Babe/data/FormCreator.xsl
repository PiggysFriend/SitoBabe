<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:a="http://www.ilmondodibabe.it">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />


<xsl:template match="/">
 
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="it" lang="it">
	<head>
		<title>Sondaggi - Il mondo di Babe</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="description" content="Sondaggi sui film di Babe. Dicci la tua e aiutaci a capire come costruire il seguito della saga!" />
		<meta name="keywords" content="Babe, film, sondaggi, il mondo di Babe" />
		<meta name="author" content="Andrea Meneghinello, Andrea Rizzi, Diego Beraldin, Elena Zecchinato" />
		<meta name="language" content="italian it" />
		<link href="../public_html/NormalLayout.css" rel="stylesheet" type="text/css" media="screen"/>
		<link href="../public_html/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
		<link href="../public_html/SmallLayout.css" rel="stylesheet" type="text/css" media="handheld, screen and (max-width:52em), only screen and (max-device-width:30em)"/>
	</head>
	<body>
		<div id="bodyWrap" class="group">
			<div id="header">
				<h1>Il mondo di <span xml:lang="en">Babe</span></h1>
				<p>Ti trovi in <a tabindex="1" href="../public_html/Home.html">Home</a> &gt; Sondaggi</p>
			</div>
			
			<div id="nav">
				<a tabindex="2" href="#rss" class="nascosto">Salta menù</a>
				<h2>Menù</h2>
				<ul>
					<li><a tabindex="3" href="../Trama.html"> Trama dei film</a></li>
					<li><a tabindex="4" href="../Personaggi.html">Personaggi</a></li>
					<li><a tabindex="5" href="../Interpreti.html">Interpreti</a></li>
					<li><a tabindex="6" href="../ImparaConBabe.html">Impara con <span xml:lang="en">Babe</span></a></li>
					<li>Sondaggi</li>
					<li><a tabindex="7" href="Premi.html">Premi</a></li>
					<li><a tabindex="8" href=""><span xml:lang="en">Link</span> utili</a></li>
				</ul>
			</div>
			
			<div id="content" class="group">
			<form action="../cgi-bin/addComment.cgi" method="POST">
				<fieldset>
					<legend>Sondaggio</legend>
					<xsl:for-each select="//a:sondaggio[@numero='1']/a:domanda">
						<xsl:sort select="@numero"/>
						<fieldset>
							<legend><xsl:value-of select="@etichetta"/></legend>
								<xsl:for-each select="a:scelta">
									<xsl:sort select="@numero"/>
									<div class="inputForm">
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
					<div class="inputForm">
						<label class="etichetta" for="name">Nome utente</label>
						<input type="text" id = "name" name="name"></input>
					</div>
					<div class="inputForm">
						<label class="etichetta" for="e-mail">e-mail</label>
						<input type="text" id = "e-mail" name="e-mail"></input>
					</div>
					<div class="inputForm">
						<label class="etichetta" for="commento">commento</label>
						<textarea rows="5" cols="40" id="commento" name="commento">inserisci qui il tuo commento...</textarea>
					</div>
					<div class="inputForm">
						<input type="submit" name="invioDati"></input>
						<input type="reset"></input>
					</div>
				</fieldset>
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
