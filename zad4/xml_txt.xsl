<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:for-each select="report/company">
            <xsl:text> ********************************************************************************************************************************&#xA;</xsl:text>
            <xsl:value-of
            select=
            "concat(
            ' | ',name, substring('                      ',1,23-string-length(name)),
            ' | ',country, substring('              ',1,11-string-length(country)),
            ' | ',value, substring('              ',1,15-string-length(value)),
            ' | ',industry, substring('                ',1,18-string-length(industry)),
            ' | ',founded, substring('              ',1,10-string-length(founded)),
            ' | ',employees, substring('              ',1,7-string-length(employees)),
            ' | ',key_people/person[1], substring('                  ',1,23-string-length(key_people/person[1])), '|'
            )"/>
            <xsl:for-each select="key_people/person[position()>1]">
                <xsl:text>&#xA;</xsl:text>
                <xsl:value-of select="concat(
                ' |                         |             |                 |                    |            |         | ',
                .,substring('                  ',1,23-string-length(.)), '|')"/>
            </xsl:for-each>

            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
        <xsl:text> ********************************************************************************************************************************&#xA;</xsl:text>
    </xsl:template>

</xsl:stylesheet>