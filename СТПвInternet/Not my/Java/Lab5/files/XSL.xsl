<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="STUDENTS">
        <xsl:copy>
            <xsl:for-each select="STUDENT">
                <xsl:sort select="NAME"/>
                <xsl:sort select="SURNAME"/>
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>