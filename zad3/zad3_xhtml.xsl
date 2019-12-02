<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

    <xsl:output method="html" encoding="utf-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>


    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
            <head>
                <title>
                    <xsl:value-of select="report/header/title"/>
                </title>
                <style>
                    table, th, td {
                    border: 1px solid black;
                    }
                </style>
            </head>
            <body>


                <table style="width: 100%;">
                    <caption style="font-size: 20px; font-weight: bold;">List of companies</caption>
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
                            <tr style="text-align:center;">
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

                <br></br>

                <table style="width: 100%;">
                    <caption style="font-size: 20px; font-weight: bold;">Number of companies per industry</caption>
                    <thead>
                        <tr>
                            <xsl:for-each select="report/stats/companies_per_industry/*">
                                <xsl:sort select="." order="descending" data-type="number" lang="en"/>
                                <th scope="col" style="width:8.3%;"><xsl:value-of select="name(.)"/></th>
                            </xsl:for-each>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <xsl:for-each select="report/stats/companies_per_industry/*">
                                <xsl:sort select="." order="descending" data-type="number" lang="en"/>
                                <td style="text-align: center;"><xsl:value-of select="."/></td>
                            </xsl:for-each>
                        </tr>
                    </tbody>
                </table>

                <br></br>

                <table style="width: 100%;">
                    <caption style="font-size: 20px; font-weight: bold;">Number of companies per country</caption>
                    <thead>
                        <tr>
                            <xsl:for-each select="report/stats/companies_per_country/*">
                                <xsl:sort select="." order="descending" data-type="number" lang="en"/>
                                <th scope="col" style="width:12.5%;"><xsl:value-of select="name(.)" /></th>
                            </xsl:for-each>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <xsl:for-each select="report/stats/companies_per_country/*">
                                <xsl:sort select="." order="descending" data-type="number" lang="en"/>
                                <td style="text-align: center;"><xsl:value-of select="." /></td>
                            </xsl:for-each>
                        </tr>
                    </tbody>
                </table>

                <br></br>

                <table style="width: 100%;">
                    <thead>
                        <tr>
                            <th scope="col" style="width: 25%;">Number of companies</th>
                            <th scope="col" style="width: 25%;">Number of industries</th>
                            <th scope="col" style="width: 25%;">Average number of employees</th>
                            <th scope="col" style="width: 25%;">Average number of key people</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="text-align:center;">
                            <td><xsl:value-of select="report/stats/companies_number"/></td>
                            <td><xsl:value-of select="report/stats/industries_number"/></td>
                            <td><xsl:value-of select="report/stats/average_employees"/></td>
                            <td><xsl:value-of select="report/stats/average_key_people"/></td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

