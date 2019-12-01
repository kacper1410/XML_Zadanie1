<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
            <head>
                <meta http-equiv="Content-Type" content="application/xhtml+xml;charset=UTF-8" />
            </head>
            <body>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Number of companies</th>
                            <th scope="col">Number of industries</th>
                            <th scope="col">Average number of employees</th>
                            <th scope="col">Average number of key people</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr align="center">
                            <td><xsl:value-of select="report/stats/companies_number"/></td>
                            <td><xsl:value-of select="report/stats/industries_number"/></td>
                            <td><xsl:value-of select="report/stats/average_employees"/></td>
                            <td><xsl:value-of select="report/stats/average_key_people"/></td>
                        </tr>
                    </tbody>
                </table>

                <table class="table table-striped">
                    <caption>List of companies</caption>
                    <thead>
                        <tr>
                            <th scope="col">Company</th>
                            <th scope="col">Country</th>
                            <th scope="col">Value</th>
                            <th scope="col">Industry</th>
                            <th scope="col">Foundation</th>
                            <th scope="col">Key people</th>
                            <th scope="col">Number of employees</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="report/company">
                            <tr align="center">
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="country"/></td>
                                <td><xsl:value-of select="value"/></td>
                                <td ><xsl:value-of select="industry"/></td>
                                <td><xsl:value-of select="founded"/></td>
                                <td>
                                    <xsl:for-each select="key_people/person">
                                        <xsl:value-of select="@function"/>
                                        <xsl:text> - </xsl:text>
                                        <xsl:value-of select="."/>
                                        <br/>
                                    </xsl:for-each>
                                </td>
                                <td><xsl:value-of select="employees"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

