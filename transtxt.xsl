<?xml version="1.0" encoding="utf-8"?>
<!--
	transcriber xslt stylesheet for converting transcriber xml data to a
	readable transcription in text. basic ideas from svn2cl.xsl nicked where
	possible.

	adapted from the transhtml.xsl template suggested by
	dwarfthrower@zgeek.com

	$Id: transtxt.xsl 43 2007-07-12 01:45:09Z ewe2 $
-->


<!-- <!DOCTYPE trans SYSTEM "trans-14.dtd"> -->

<!-- additions to make life easier -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY tab "&#9;">
  <!ENTITY space "&#32;">
  <!ENTITY newl "&#10;">
]>


<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
   method="text"
   encoding="utf-8"
   media-type="text/plain"
   omit-xml-declaration="yes"
   standalone="yes"
   indent="no" />

<xsl:strip-space elements="Sync" />
<xsl:param name="linelen" select="75" />
<xsl:param name="line" />


<xsl:template match="Trans">
  Title: <xsl:value-of select="@audio_filename" /> (Scribed By: <xsl:value-of select="@scribe" />)
  
  <xsl:for-each select="./Episode">
    Program: <xsl:value-of select="@program"/>
	  <xsl:for-each select="./Section">
	    <xsl:variable name="topicid" select="@topic"/>
		  Topic: <xsl:value-of select="//Topics/Topic[@id=$topicid]/@desc"/>
		  <xsl:for-each select="./Turn">
		    <xsl:variable name="speakerid" select="@speaker" />
			  Speaker: <xsl:value-of select="//Speakers/Speaker[@id=$speakerid]/@name"/>
			  <xsl:apply-templates />
		  </xsl:for-each>
	  </xsl:for-each>
  </xsl:for-each>

</xsl:template>

<xsl:template match="Event">
  <xsl:value-of select="@type"/>: [<xsl:value-of select="@desc" />]
</xsl:template>

<!-- do our formatting processing here -->
<xsl:template select="./Sync">
    <xsl:value-of select="."/>
</xsl:template>


</xsl:stylesheet>
