<?xml version="1.0" encoding="utf-8"?>
<!-- 
	from the massively clever version by dwarfthrower@zgeek.com. Takes all the work out
	of it for me :D

	$Id: transhtml.xsl 47 2007-07-12 01:49:00Z ewe2 $
-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	media-type="text/plain"/>


<xsl:strip-space elements="*"/>

  <xsl:template match="Trans">
    <html>
    <head>
    <title><xsl:value-of select="@audio_filename" /></title>
    <style type="text/css">
	  body {font-family: Arial;}
	  p {font-size:9pt;font-weight:normal;background-color:#efefef;}
	  h1 {font-size: 12pt; font-weight: bold;}
	  h2 {font-size: 11pt; font-weight: bold;}
	  h3 {font-size: 10pt; font-weight: bold;}
	
	
    </style>
    </head>
    <body>
  
      <h1><xsl:value-of select="@audio_filename" /> (Scribed By: <xsl:value-of select="@scribe" />)
	  <i>Version: <xsl:value-of select="@version" /></i></h1>
	  <i>$Revision$</i><br/><br/>
    
      <xsl:for-each select="./Episode">
      <h2>Program: <xsl:value-of select="@program"/></h2>
    	<xsl:for-each select="./Section">
    		<xsl:variable name="topicid" select="@topic" />
    		<h2>Topic: <xsl:value-of select="//Topics/Topic[@id=$topicid]/@desc"/></h2>
    		 <xsl:for-each select="./Turn">
    		 	<xsl:variable name="speakerid" select="@speaker" />
    		 	<h3>Speaker: <xsl:value-of select="//Speakers/Speaker[@id=$speakerid]/@name"/></h3>
    		    <p><xsl:apply-templates /></p>
    		</xsl:for-each>
    	</xsl:for-each>
      </xsl:for-each>

    </body>
    </html>
  </xsl:template>

  <xsl:template match="Event">
    <cite><xsl:value-of select="@type"/>: [<xsl:value-of select="@desc" />]</cite>
  </xsl:template>

</xsl:stylesheet>
