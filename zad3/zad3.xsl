<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:element name="report">

            <xsl:element name="header">
                <xsl:element name="title">
                    <xsl:value-of select="/companies/header/title" /> Report
                </xsl:element>
                <xsl:for-each select="/companies/header/author">
                    <xsl:element name="author">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
            <xsl:for-each select="companies/company">
                <xsl:sort select="value" order="descending"/>
                <xsl:element name="company">
                    <xsl:element name="name">
                        <xsl:value-of select="@name"/>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>