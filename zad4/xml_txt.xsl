<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:text>Authors: &#xA;</xsl:text>
        <xsl:for-each select="report/header/author">
            <xsl:value-of select="."/><xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
        <xsl:text> |          NAME           |   COUNTRY   |      VALUE      |      INDUSTRY      |   FOUNDED  |EMPLOYEES|       KEY PEOPLE       |&#xA;</xsl:text>
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
        <xsl:text>&#xA;Statistics:&#xA;</xsl:text>
            <xsl:value-of select="concat('Companies number:',substring('                  ',1,25-string-length('Companies number:')),report/stats/companies_number)"/><xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="concat('Industries number:',substring('                  ',1,25-string-length('Industries number:')),report/stats/industries_number)"/><xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="concat('Companies per industry:',substring('                  ',1,25-string-length('Companies per industry:')))"/><xsl:text>&#xA;</xsl:text>
                <xsl:for-each select="report/stats/companies_per_industry/*">
                    <xsl:value-of select="concat('                         ',name(.),substring('                  ',1,19-string-length(name(.))),.)"/><xsl:text>&#xA;</xsl:text>
                </xsl:for-each>
            <xsl:value-of select="concat('Companies per country:',substring('                  ',1,25-string-length('Companies per country:')))"/><xsl:text>&#xA;</xsl:text>
        <xsl:for-each select="report/stats/companies_per_country/*">
            <xsl:value-of select="concat('                         ',name(.),substring('                  ',1,15-string-length(name(.))),.)"/><xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
            <xsl:value-of select="concat('Average employees:',substring('                  ',1,25-string-length('Average employees:')),report/stats/average_employees)"/><xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="concat('Average key people:',substring('                  ',1,25-string-length('Average key people:')),report/stats/average_key_people)"/><xsl:text>&#xA;</xsl:text>
    </xsl:template>

</xsl:stylesheet>