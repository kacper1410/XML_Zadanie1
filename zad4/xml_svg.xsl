<?xml version='1.0' encoding="UTF-8" ?>
<!--<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"-->
<!--        "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/2000/svg">

    <xsl:template match="/">
        <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">
            <script type="text/ecmascript"> <![CDATA[
		                function zoom(evt) {
			            var text = evt.target;
		                text.setAttribute("font-size", 40);
		                }
	                ]]>
            </script>
            <xsl:variable name="x" select="30" />
<!--            <xsl:variable name="y" select="50"/>-->
            <text x="{$x}" y="35" fill="black" font-size="40" onmouseover="zoom(evt)">
                Title:
                <xsl:value-of select="report/header/title" />
            </text>

<!--            <text x="{$x}" y="55" font-size="30" >-->
<!--                    Authors:-->
<!--            </text>-->

            <xsl:for-each select="report/header/author" >
                <xsl:variable name="position" select="position()*80" />
                <text x="{$x}" y="{$position}" font-size="30" >
                    <xsl:value-of select="." />
                </text>
            </xsl:for-each>

            <xsl:variable name="companies_number" select="report/stats/companies_number" />
            <xsl:variable name="industries_number" select="report/stats/industries_number" />
            <xsl:variable name="average_employees" select="report/stats/average_employees" />
            <xsl:variable name="average_key_people" select="report/stats/average_key_people" />

            <rect x="{$x}" y="200" height="50" width="{$companies_number*5}" />
            <rect x="{$x}" y="300" height="50" width="{$industries_number*5}" />
            <rect x="{$x}" y="400" height="50" width="{$average_employees div 1000}" />
            <rect x="{$x}" y="500" height="50" width="{$average_key_people*5}" />

            
        </svg>
    </xsl:template>

</xsl:stylesheet>