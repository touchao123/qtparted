<?xml version="1.0" encoding="ISO-8859-1" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml"
  	encoding="ISO-8859-1"
	doctype-public="-//W3C/DTD XHTML 1.1//EN"
	doctype-system="http://w3.org/TR/xhtml11/DTD/xhtml11.dtd"
	indent="yes"
  />

  <xsl:param name="nb_news">20</xsl:param>
  <xsl:param name="nb_changes">20</xsl:param>

  <xsl:variable name="langs" select="//span[not(@xml:lang=preceding::span/@xml:lang)]/@xml:lang"/>

  <xsl:template match="/news">
    <body>
      <xsl:apply-templates select="./properties" mode="properties"/>
      <xsl:apply-templates select="./title" mode="title"/>
      <table class="news">
        <xsl:apply-templates select="./item[$nb_news>=position()]"/>
      </table>
    </body>
  </xsl:template>

  <xsl:template match="/news/item">
    <tr>
      <td class="news">
        <xsl:apply-templates select="date" mode="date"/>
      </td>
      <td class="news">
        <xsl:apply-templates select="text"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="@*|node()" mode="date">
    <xsl:variable name="year" select="year/node()"/>
    <xsl:variable name="month" select="month/node()"/>
    <xsl:variable name="day" select="day/node()"/>
    <xsl:for-each select="$langs">
      <xsl:variable name="l1" select="."/>
      <xsl:choose>
        <xsl:when test="$l1='en'">
	  <span xml:lang='{$l1}'>
	    <xsl:value-of select="$month"/>
	    <xsl:text>/</xsl:text>
	    <xsl:value-of select="$day"/>
	    <xsl:text>/</xsl:text>
	    <xsl:value-of select="$year"/>
	  </span>
	</xsl:when>
	<xsl:otherwise>
	  <span xml:lang='{$l1}'>
	    <xsl:value-of select="$day"/>
	    <xsl:text>/</xsl:text>
	    <xsl:value-of select="$month"/>
	    <xsl:text>/</xsl:text>
	    <xsl:value-of select="$year"/>
	  </span>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="/news/title" mode="title">
    <h1>
      <xsl:apply-templates select="@*|node()"/>
    </h1>
  </xsl:template>

  <xsl:template match="/changes">
    <body>
      <xsl:apply-templates select="./properties" mode="properties"/>
      <xsl:apply-templates select="./title" mode="title"/>
      <xsl:apply-templates select="./item[$nb_changes>=position()]"/>
    </body>
  </xsl:template>

  <xsl:template match="/changes/item">
    <p>
      <xsl:apply-templates select="version"/>
      <i>
        <xsl:apply-templates select="date" mode="date"/>
      </i>	
      <b>
        <xsl:apply-templates select="feature"/>
      </b>
        <ul>
          <xsl:apply-templates select="change" mode="change"/>
	</ul>
    </p>
  </xsl:template>

  <xsl:template match="/changes/title" mode="title">
    <h1>
      <xsl:apply-templates select="@*|node()"/>
    </h1>
  </xsl:template>

  <xsl:template match="@*|node()" mode="change">
    <li>
      <xsl:apply-templates select="@*|node()"/>
    </li>
  </xsl:template>

  <xsl:template match="/future">
    <body>
      <xsl:apply-templates select="./properties" mode="properties"/>
      <xsl:apply-templates select="./title" mode="title"/>
      <xsl:apply-templates select="./header" mode="header"/>
      <table class="future">
        <xsl:apply-templates select="./item"/>
      </table>
    </body>
  </xsl:template>

  <xsl:template match="/future/item">
    <tr>
      <td class="future">
        <xsl:apply-templates select="state"/>
      </td>
      <td class="future">
        <xsl:apply-templates select="feature"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="/future/title" mode="title">
    <h1>
      <xsl:apply-templates select="@*|node()"/>
    </h1>
  </xsl:template>

  <xsl:template match="/future/header" mode="header">
    <p>
      <xsl:apply-templates select="@*|node()"/>
    </p>
  </xsl:template>

  <xsl:template match="/bugs">
    <body>
      <xsl:apply-templates select="./properties" mode="properties"/>
      <xsl:apply-templates select="./title" mode="title"/>
      <xsl:apply-templates select="./header" mode="header"/>
      <table class="future">
        <tr>
          <th class="bugs">
	    affected versions
	  </th>
          <th class="bugs">
	    fixed in 
	  </th>
          <th class="bugs">
	    description 
	  </th>
	</tr>
        <xsl:apply-templates select="./item"/>
      </table>
      <xsl:apply-templates select="./footer" mode="footer"/>
    </body>
  </xsl:template>

  <xsl:template match="/bugs/item">
    <tr>
      <td class="bugs">
        <xsl:apply-templates select="affected"/>
      </td>
      <td class="bugs">
        <xsl:apply-templates select="fixed"/>
      </td>
      <td class="bugs">
        <xsl:apply-templates select="description"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="/bugs/title" mode="title">
    <h1>
      <xsl:apply-templates select="@*|node()"/>
    </h1>
  </xsl:template>

  <xsl:template match="/bugs/header" mode="header">
    <p>
      <xsl:apply-templates select="@*|node()"/>
    </p>
  </xsl:template>

  <xsl:template match="/bugs/footer" mode="footer">
    <p>
      <xsl:apply-templates select="@*|node()"/>
    </p>
  </xsl:template>

  <xsl:template match="@*|node()" mode="properties">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
