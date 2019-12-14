<?xml version='1.0' encoding="UTF-8" ?>
<!--<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"-->
<!--        "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/2000/svg">

    <xsl:template match="/">
        <svg width="100%" height="7000" xmlns="http://www.w3.org/2000/svg">
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
            <script type="text/ecmascript"> <![CDATA[
		                function visible(evt) {
		                var text = evt.target;
		                var peopleOpacity = text.getAttribute("opacity");
		                if (peopleOpacity=="0")
		                    text.setAttribute("opacity", "1");
		                else if(peopleOpacity=="1")
		                    text.setAttribute("opacity", "0");
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
            <xsl:for-each select="report/company" >
                <xsl:variable name="position" select="position()*200 + 500" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="country" select="country" />
                <xsl:variable name="value" select="value" />
                <xsl:variable name="founded" select="founded" />
                <xsl:variable name="employees" select="employees" />

                <text x="10%" y="{$position}" font-size="30" font-weight="bold">
                    <xsl:value-of select="concat('Name: ', $name)"  />
                    <animate id="animate" attributeType="XML" attributeName="opacity" fill="freeze" dur="2s" from="0" to="1"  />
                </text>
                <text x="10%" y="{$position + 30}" font-size="25" >
                    <xsl:value-of select="concat('Country: ', $country)"  />
                    <animate id="animate" attributeType="XML" attributeName="opacity" dur="3s" from="0" to="1"  />
                </text>
                <text x="10%" y="{$position + 60}" font-size="25" >
                    <xsl:value-of select="concat('Value: ', $value)"  />
                    <animate id="animate" attributeType="XML" attributeName="opacity" dur="3s" from="0" to="1"  />
                </text>
                <text x="10%" y="{$position + 90}" font-size="25" >
                    <xsl:value-of select="concat('Founded: ', $founded)"  />
                    <animate id="animate" attributeType="XML" attributeName="opacity" dur="3s" from="0" to="1"  />
                </text>
                <text x="10%" y="{$position + 120}" font-size="25" >
                    <xsl:value-of select="concat('Emplyees: ', $employees)"  />
                    <animate id="animate" attributeType="XML" attributeName="opacity" dur="3s" from="0" to="1"  />
                </text>

                <text x="40%" y="{$position}" font-weight="bold" font-size="30" >
                    People:
                    <animate id="animate" attributeType="XML" attributeName="opacity" dur="3s" from="0" to="1"  />
                </text>

                <xsl:for-each select="key_people" >
                    <text x="35%" y="{$position + 40}" font-size="25" onclick="visible(evt)" opacity="0">
                        <xsl:value-of select="." />
                    </text>
                </xsl:for-each>

            </xsl:for-each>

        </svg>
    </xsl:template>

</xsl:stylesheet>