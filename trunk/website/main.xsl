<?xml version="1.0" encoding="ISO-8859-1" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="html"
  	encoding="ISO-8859-1"
	doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"
	doctype-system="http://www.w3.org/TR/html4/loose.dtd"
	indent="yes"
  />

  <xsl:param name="lang">en</xsl:param>
  <xsl:param name="filename">fichier</xsl:param>

  <xsl:variable name="langs" select="//span[not(@xml:lang=preceding::span/@xml:lang)]/@xml:lang"/>

  <xsl:template match="/body">
    <html>
      <head>
	<xsl:element name="meta">
	  <xsl:attribute name="name">author</xsl:attribute>
	  <xsl:attribute name="content">
	    <xsl:apply-templates select="/body/properties/author" mode="meta"/>
	  </xsl:attribute>
        </xsl:element>
	<meta name="copyright" content="(C) 2003"/>
	<xsl:element name="meta">
	  <xsl:attribute name="name">reply-to</xsl:attribute>
	  <xsl:attribute name="content">
	    <xsl:apply-templates select="/body/properties/replyto" mode="meta"/>
	  </xsl:attribute>
        </xsl:element>
	<xsl:element name="meta">
	  <xsl:attribute name="name">description</xsl:attribute>
	  <xsl:attribute name="content">
	    <xsl:apply-templates select="/body/properties/description" mode="meta"/>
	  </xsl:attribute>
        </xsl:element>
	<xsl:element name="meta">
	  <xsl:attribute name="name">keywords</xsl:attribute>
	  <xsl:attribute name="content">
	    <xsl:apply-templates select="/body/properties/keywords" mode="meta"/>
	  </xsl:attribute>
        </xsl:element>
	<meta http-equiv="Content-language" content="{$lang}"/>
	<meta name="Revisit-after" content="7 days"/>
	<meta name="Robots" content="index, follow"/>

        <link rel="stylesheet" type="text/css" href="styles.css"/>
        <title>
          <xsl:apply-templates select="/body/h1[position()=1]/*"/>
        </title>
      </head>
      <body>
        <table class='main' width='800' align='center' cellspacing='0'
	 cellpadding='0'>
	  <tr>
	    <td>
	       <map name="oedipe">
                  <area shape="rect" coords="610,13,772,69" target="_blank" href="http://www.sourceforge.net/"/>
               </map>
	       <img src="images/logo.png" width='800' height='83' usemap="#oedipe" border="0" alt="logo"/>
	    </td>
	  </tr><tr>
	    <td>
	      <img src="images/pixel_noir.png" width='100%' height='2' alt=''/>
	    </td>
	  </tr><tr>
	    <td class="banner" align='right'>
	      <xsl:element name="a">
	        <xsl:attribute name="href">
		  http://qtparted.sourceforge.net
		</xsl:attribute>
		http://qtparted.sourceforge.net
              </xsl:element>
	    </td>
	  </tr><tr>
	    <td>
	      <img src="images/pixel_noir.png" width='100%' height='2' alt=''/>
	    </td>
	  </tr><tr>
	    <td>
	      <table class='menu' width='100%' cellspacing='0'>
		<tr>
	          <td class='menuleft' valign='top'>
	            <xsl:call-template name="menu" mode="menu"/>
	          </td><td class='menuright' valign='top'>
		    <table class='languages' width='100%' cellspacing='0'>
		      <tr>
		        <td>
			  <table class='flags' border='0'>
			    <tr>
  			      <xsl:for-each select="$langs">
			        <xsl:variable name="l1" select="."/>
			        <xsl:choose>
			          <xsl:when test="$l1=$lang">
				  <td>
				    <img src="images/{$l1}-grayed.png"
				      alt='{$l1}'/>
				  </td>
			          </xsl:when>
			          <xsl:otherwise>
				    <td>
			              <xsl:element name="a">
				        <xsl:attribute name="href"><xsl:value-of select="$filename"/>.<xsl:value-of select="$l1"/>.html</xsl:attribute>
				        <img src="images/{$l1}.png"
					alt='{$l1}'/>
				      </xsl:element>
			            </td>
			          </xsl:otherwise>
			        </xsl:choose>
			      </xsl:for-each>
			    </tr>
			  </table>
			</td>
                      </tr><tr>
		        <td>
	                  <xsl:apply-templates select="@*|*"/>
			</td>
	              </tr>
		    </table>
	          </td>
	        </tr>
	      </table>
	    </td>
	  </tr>
	</table>
	<hr/>
	<xsl:apply-templates select="/body/properties" mode="footer"/>
	<p>
	  <a href="http://jigsaw.w3.org/css-validator/">
	    <img style="border:0;width:88px;height:31px"
	      src="images/vcss"
	    alt="Valid CSS!"/>
	  </a>
	</p>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="menu" mode="menu">
    <p class='menu'>
      <xsl:variable name="menu" select="document('menu.xml')/menu"/>
      <xsl:for-each select="$menu/item">
	<br/>
        <span class='menuitem'>
	  <xsl:choose>
	    <xsl:when test='$filename=@name'>
	      <xsl:value-of select="./text[@lang=$lang]"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:element name="a">
	        <xsl:attribute name="class">
		  menu
		</xsl:attribute>
	        <xsl:attribute name="href">
		  <xsl:value-of select="@name"/>.<xsl:value-of select="$lang"/>.html
	        </xsl:attribute>
	        <xsl:value-of select="./text[@lang=$lang]"/>
	      </xsl:element>
	    </xsl:otherwise>
	  </xsl:choose>
	</span>
	<br/>
      </xsl:for-each>
      <xsl:for-each select="$menu/link">
	<br/>
        <span class='menulink'>
	  <xsl:element name="a">
	    <xsl:attribute name="href">
	      <xsl:value-of select="@name"/>
	    </xsl:attribute>
	    <xsl:value-of select="./text[@lang=$lang]"/>
	  </xsl:element>
	</span>
	<br/>
      </xsl:for-each>
      <br/>

      <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
      <input type="hidden" name="cmd" value="_xclick"/>
      <input type="hidden" name="business" value="vannibrutto@libero.it"/>
      <input type="hidden" name="no_note" value="1"/>
      <input type="hidden" name="currency_code" value="EUR"/>
      <input type="hidden" name="tax" value="0"/>
      <input type="image" src="images/x-click-but21.gif" border="0" name="submit"
             alt="Make payments with PayPal - it's fast, free and secure!"/>
      </form>

      <br/>
      <table class="sf" size="95%" border="1" align="center">
        <tr>
	  <td width="24" height="24">
	    <a href="http://sourceforge.net/projects/qtparted/"><img src="images/serv_summary.png" width="24" height="24"/></a>
	  </td>
	  <td>
	    <a href="http://sourceforge.net/projects/qtparted/">Project infos</a>
	  </td>
	</tr>
        <tr>
	  <td width="24" height="24">
	    <a href="http://sourceforge.net/project/showfiles.php?group_id=72497"><img src="images/serv_download.png" width="24" height="24"/></a>
	  </td>
	  <td>
	    <a href="http://sourceforge.net/project/showfiles.php?group_id=72497">File list</a>
	  </td>
	</tr>
        <tr>
	  <td width="24" height="24">
	    <a href="http://sourceforge.net/mail/?group_id=72497"><img src="images/serv_mail.png" width="24" height="24"/></a>
	  </td>
	  <td>
	    <a href="http://sourceforge.net/mail/?group_id=72497">Mailing List</a>
	  </td>
	</tr>
        <tr>
	  <td width="24" height="24">
	    <a href="http://sourceforge.net/news/?group_id=72497"><img src="images/serv_news.png" width="24" height="24"/></a>
	  </td>
	  <td>
	    <a href="http://sourceforge.net/news/?group_id=72497">News</a>
	  </td>
	</tr>
        <tr>
	  <td width="24" height="24">
	    <a href="http://sourceforge.net/cvs/?group_id=72497"><img src="images/serv_cvs.png" width="24" height="24"/></a>
	  </td>
	  <td>
	    <a href="http://sourceforge.net/cvs/?group_id=72497">CVS</a>
	  </td>
	</tr>
      </table>

      <br/>
    </p>
  </xsl:template>

  <xsl:template match="/body/properties" mode="footer">
    <i>Last update:
    <xsl:apply-templates select="./date" mode="footer"/>
    <xsl:apply-templates select="./revision" mode="footer"/>
    </i>
  </xsl:template>

  <xsl:template match="/body/properties">
  </xsl:template>

  <xsl:template match="/body/properties/author">
  </xsl:template>

  <xsl:template match="/body/properties/replyto">
  </xsl:template>

  <xsl:template match="/body/properties/description">
  </xsl:template>

  <xsl:template match="/body/properties/keywords">
  </xsl:template>

  <xsl:template match="/body/properties/date">
  </xsl:template>

  <xsl:template match="/body/properties/date" mode="footer">
      <xsl:apply-templates select="@*|node()"/>
  </xsl:template>

  <xsl:template match="span[not(lang($lang))]">
  </xsl:template>

  <xsl:template match="span[lang($lang)]">
    <xsl:copy-of select="attribute[name()!='lang']|node()"/>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
