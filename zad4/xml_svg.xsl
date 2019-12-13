<?xml version='1.0' encoding="UTF-8" ?>
<!--<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"-->
<!--        "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/2000/svg">

    <xsl:template match="/">
        <svg width="100%" height="10000" xmlns="http://www.w3.org/2000/svg">
            <script type="text/ecmascript"> <![CDATA[
		                function changeFill(evt) {
		                var rect = evt.target;
		                var currentFill = rect.getAttribute("fill");
		                if (currentFill=="black")
		                    rect.setAttribute("fill", "red");
		                else if(currentFill=="red")
		                    rect.setAttribute("fill", "black");
		                }
	                ]]>
            </script>
            
            <xsl:variable name="x" select="30" />

            <text x="30%" y="35" fill="black" font-size="40" >
                <xsl:value-of select="report/header/title" />
            </text>

            <xsl:for-each select="report/header/author" >
                <xsl:variable name="position" select="position()*40" />
                <text x="40%" y="{$position + 50}" font-size="30" >
                    <xsl:value-of select="." />
                </text>
            </xsl:for-each>

            <xsl:for-each select="report/stats/companies_per_industry/*">
                <xsl:variable name="position" select="position()*35 + 150" />
                <xsl:variable name="wid" select="." />
                <text x="{$x}" y="{$position}" font-size="20">
                    <xsl:value-of select="name()" />
                    <animate id="animation" attributeType="XML" attributeName="opacity" dur="3s" fill="freeze" from="0" to="1"/>
                </text>
                <rect x="{$x + 200}" y="{$position - 16}" width="{$wid*20}" height="18" fill="black" onclick="changeFill(evt)">
                    <animate id="animation" attributeType="XML" attributeName="width" dur="3s" fill="freeze" from="0" to="{$wid*20}"/>
                </rect>
                <text x="{$x + 350}" y="{$position}" font-size="20">
                    <xsl:value-of select="." />
                    <animate id="animation" attributeType="XML" attributeName="opacity" dur="3s" fill="freeze" from="0" to="1"/>
                </text>
            </xsl:for-each>

            <xsl:for-each select="report/stats/companies_per_country/*">
                <xsl:variable name="position" select="position()*35 + 200" />
                <xsl:variable name="wid" select="." />
                <text x="{$x + 600}" y="{$position}" font-size="20">
                    <xsl:value-of select="name()" />
                    <animate id="animation" attributeType="XML" attributeName="opacity" dur="3s" fill="freeze" from="0" to="1"/>
                </text>
                <rect x="{$x + 800}" y="{$position - 16}" width="{$wid*20}" height="18" fill="black" onclick="changeFill(evt)">
                    <animate id="animation" attributeType="XML" attributeName="width" dur="3s" fill="freeze" from="0" to="{$wid*20}"/>
                </rect>
                <text x="{$x + 1300}" y="{$position}" font-size="20">
                    <xsl:value-of select="." />
                    <animate id="animation" attributeType="XML" attributeName="opacity" dur="3s" fill="freeze" from="0" to="1"/>
                </text>
            </xsl:for-each>

            <!-- TODO companies -->
            <xsl:for-each select="report/company/*" >
                <xsl:variable name="position" select="position()*50 + 600" />
                <text x="15%" y="{$position}" font-size="20" >
                    <xsl:value-of select="." />
                </text>
            </xsl:for-each>

<!--            <xsl:variable name="companies_number" select="report/stats/companies_number" />-->
<!--            <xsl:variable name="industries_number" select="report/stats/industries_number" />-->
<!--            <xsl:variable name="average_employees" select="report/stats/average_employees" />-->
<!--            <xsl:variable name="average_key_people" select="report/stats/average_key_people" />-->

<!--            <rect x="{$x}" y="200" height="50" width="{$companies_number*5}" />-->
<!--            <rect x="{$x}" y="300" height="50" width="{$industries_number*5}" />-->
<!--            <rect x="{$x}" y="400" height="50" width="{$average_employees div 1000}" />-->
<!--            <rect x="{$x}" y="500" height="50" width="{$average_key_people*5}" />-->

            
        </svg>
    </xsl:template>

</xsl:stylesheet>