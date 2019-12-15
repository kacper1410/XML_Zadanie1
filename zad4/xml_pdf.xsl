<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" version="2.0" encoding="UTF-8"/>
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="master" page-height="297mm" page-width="210mm" font-family="sans-serif">
                    <fo:region-body margin-bottom="1.5cm" margin-top="1.5cm" margin-left="0.75cm" margin-right="0.75cm"/>
                    <fo:region-before extent="1.5cm"/>
                    <fo:region-after extent="1.5cm"/>
                    <fo:region-start extent="1.0cm"/>
                    <fo:region-end extent="1.0cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="master">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block font-size="10pt" margin-top="10px">
                        <xsl:value-of select="/report/header/title"/>
                        <xsl:text> -</xsl:text>
                        <xsl:for-each select="/report/header/author">
                            <xsl:text>  </xsl:text>
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="10pt" text-align="right">
                        Strona <fo:page-number/>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in IT industry</xsl:text>
                    </fo:block>
                        <fo:table background-color="rgb(254,234,222)" font-size="12px">
                            <xsl:call-template name="table-header"/>
                            <fo:table-body>
                                <xsl:for-each select="report/company">
                                    <xsl:if test="industry = 'IT'">
                                        <xsl:call-template name="table-body"/>
                                    </xsl:if>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Conglomerates</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(212,109,69)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Conglomerate'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in social media industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(80,163,249)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Social media'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in financial industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(142,168,174)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Financial'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in medical industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(190,200,77 )" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Medical'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in oil and gas industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(251,192,103)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Oil and gas'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in retail industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(127,199,76)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Retail'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in food industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(206,194,212)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Food'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in consumer goods industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(50,147,152)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Consumer goods'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in telecommunications industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(171,157,235)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Telecommunications'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in entertainment industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(124,158,100)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Entertainment'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block text-align="center" font-weight="bold" margin="5px">
                        <xsl:text>Companies in semiconductors industry</xsl:text>
                    </fo:block>
                    <fo:table background-color="rgb(235,188,19)" font-size="12px">
                        <xsl:call-template name="table-header"/>
                        <fo:table-body>
                            <xsl:for-each select="report/company">
                                <xsl:if test="industry = 'Semiconductors'">
                                    <xsl:call-template name="table-body"/>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block font-weight="bold" text-align="left" margin-top="30px">
                        <xsl:text>Number of companies:  </xsl:text>
                        <xsl:value-of select="/report/stats/companies_number"/>
                    </fo:block>
                    <fo:block font-weight="bold" text-align="left" margin-top="30px">
                        <xsl:text>Number of industries:  </xsl:text>
                        <xsl:value-of select="/report/stats/industries_number"/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template name="table-header">
        <fo:table-column column-width="4cm"/>
        <fo:table-column column-width="3.5cm"/>
        <fo:table-column column-width="2.3cm"/>
        <fo:table-column column-width="3cm"/>
        <fo:table-column column-width="2.7cm"/>
        <fo:table-column column-width="4cm"/>
        <fo:table-header text-align="center" background-color="rgb(129, 129, 127)">
            <fo:table-row>
                <fo:table-cell padding="1mm" border-style="solid">
                    <fo:block font-weight="bold">Name</fo:block>
                </fo:table-cell>
                <fo:table-cell padding="1mm" border-style="solid">
                    <fo:block font-weight="bold">Country</fo:block>
                </fo:table-cell>
                <fo:table-cell padding="1mm" border-style="solid">
                    <fo:block font-weight="bold">Value</fo:block>
                </fo:table-cell>
                <fo:table-cell padding="1mm" border-style="solid">
                    <fo:block font-weight="bold">Founded</fo:block>
                </fo:table-cell>
                <fo:table-cell padding="1mm" border-style="solid">
                    <fo:block font-weight="bold">Employees</fo:block>
                </fo:table-cell>
                <fo:table-cell padding="1mm" border-style="solid">
                    <fo:block font-weight="bold">Key people</fo:block>
                </fo:table-cell>
            </fo:table-row>
        </fo:table-header>
    </xsl:template>

    <xsl:template name="table-body">
        <fo:table-row text-align="center">
            <fo:table-cell padding="1mm" border-style="solid">
                <fo:block>
                    <xsl:value-of select="name"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-style="solid">
                <fo:block>
                    <xsl:value-of select="country"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-style="solid">
                <fo:block>
                    <xsl:value-of select="value"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-style="solid">
                <fo:block>
                    <xsl:value-of select="founded"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-style="solid">
                <fo:block>
                    <xsl:value-of select="employees"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-style="solid">
                <fo:block>
                    <xsl:for-each select="key_people/person">
                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                    </xsl:for-each>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>


</xsl:stylesheet>
