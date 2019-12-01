<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:element name="report">


            <xsl:element name="header">
                <xsl:element name="title">
                    <xsl:value-of select="/companies/header/title" /><xsl:text> Report</xsl:text>
                </xsl:element>
                <xsl:for-each select="/companies/header/author">
                    <xsl:element name="author">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>

            <xsl:for-each select="companies/company">
                <xsl:variable name="industry" select="@industry"/>

                <xsl:sort select="@value" order="descending" data-type="text" lang="en"/>

                <xsl:element name="company">
                    <xsl:attribute name="company_ID">
                        <xsl:value-of select="@company_ID"/>
                    </xsl:attribute>
                    <xsl:element name="name">
                        <xsl:value-of select="@name"/>
                    </xsl:element>
                    <xsl:element name="country">
                        <xsl:value-of select="@country"/>
                    </xsl:element>
                    <xsl:element name="value">
                        <xsl:value-of select="value"/>
                    </xsl:element>

                    <xsl:for-each select="../industries/industry">
                        <xsl:if test="$industry=@industry">
                            <xsl:element name="industry">
                                <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:element name="founded">
                        <xsl:value-of select="founded"/>
                    </xsl:element>

                    <xsl:element name="employees">
                        <xsl:value-of select="people/employees"/>
                    </xsl:element>

                    <xsl:apply-templates select="people/key_people"/>

                </xsl:element>

            </xsl:for-each>

            <xsl:element name="stats">
                <xsl:element name="companies_number">
                    <xsl:value-of select="count(//company)"/>
                </xsl:element>
                <xsl:element name="industries_number">
                    <xsl:value-of select="count(//industry)"/>
                </xsl:element>
                <xsl:element name="companies_per_industry">
                        <IT>
                            <xsl:value-of select="count(/companies/company[@industry='IT'])"/>
                        </IT>
                        <Conglomerate>
                            <xsl:value-of select="count(//company[@industry='Conglomerate'])"/>
                        </Conglomerate>
                        <Social_media>
                            <xsl:value-of select="count(//company[@industry='Social_media'])"/>
                        </Social_media>
                        <Financial>
                            <xsl:value-of select="count(//company[@industry='Financial'])"/>
                        </Financial>
                        <Medical>
                            <xsl:value-of select="count(//company[@industry='Medical'])"/>
                        </Medical>
                        <Oil_and_gas>
                            <xsl:value-of select="count(//company[@industry='Oil_and_gas'])"/>
                        </Oil_and_gas>
                        <Retail>
                            <xsl:value-of select="count(//company[@industry='Retail'])"/>
                        </Retail>
                        <Food>
                            <xsl:value-of select="count(//company[@industry='Food'])"/>
                        </Food>
                        <Consumer_goods>
                            <xsl:value-of select="count(//company[@industry='Consumer_goods'])"/>
                        </Consumer_goods>
                        <Telecommunications>
                            <xsl:value-of select="count(//company[@industry='Telecommunications'])"/>
                        </Telecommunications>
                        <Entertainment>
                            <xsl:value-of select="count(//company[@industry='Entertainment'])"/>
                        </Entertainment>
                        <Semiconductors>
                            <xsl:value-of select="count(//company[@industry='Semiconductors'])"/>
                        </Semiconductors>
                </xsl:element>
                <xsl:element name="companies_per_country">
                    <US>
                        <xsl:value-of select="count(//company[@country='US'])"/>
                    </US>
                    <China>
                        <xsl:value-of select="count(//company[@country='China'])"/>
                    </China>
                    <Switzerland>
                        <xsl:value-of select="count(//company[@country='Switzerland'])"/>
                    </Switzerland>
                    <South_Korea>
                        <xsl:value-of select="count(//company[@country='South_Korea'])"/>
                    </South_Korea>
                    <South_Korea>
                        <xsl:value-of select="count(//company[@country='South_Korea'])"/>
                    </South_Korea>
                    <Netherlands>
                        <xsl:value-of select="count(//company[@country='Netherlands'])"/>
                    </Netherlands>
                    <Taiwan>
                        <xsl:value-of select="count(//company[@country='Taiwan'])"/>
                    </Taiwan>
                    <Poland>
                        <xsl:value-of select="count(//company[@country='Poland'])"/>
                    </Poland>
                </xsl:element>
                <xsl:element name="average_employees">
                    <xsl:value-of select="sum(//employees) div count(//employees)"/>
                </xsl:element>
                <xsl:element name="average_key_people">
                    <xsl:value-of select="(count(//person | //CEO | //founder))div count(//company)"/>
                </xsl:element>
            </xsl:element>

        </xsl:element>
    </xsl:template>

    <xsl:template match="people/key_people">

        <xsl:element name="key_people">

            <xsl:for-each select="CEO">
                <xsl:element name="person">
                    <xsl:attribute name="function">
                        <xsl:text>CEO</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="name"/>
                </xsl:element>
            </xsl:for-each>

            <xsl:for-each select="founders/founder">
                <xsl:element name="person">
                    <xsl:attribute name="function">
                        <xsl:text>Founder</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:for-each>

            <xsl:for-each select="employee/person">
                <xsl:element name="person">
                    <xsl:attribute name="function">
                        <xsl:value-of select="@office"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:for-each>

        </xsl:element>
    </xsl:template>



</xsl:stylesheet>