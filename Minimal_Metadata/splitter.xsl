<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
    schematypens="http://purl.oclc.org/dsdl/schematron"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs tei" version="2.0">
    
    <!-- format -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <!-- initial template matching root element -->	
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- match the teiCorpus -->
    <xsl:template match="teiCorpus">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- match each TEI element and write a result document from it -->
    <xsl:template match="TEI">
        <xsl:variable name="file-name" select="teiHeader/fileDesc/publicationStmt/idno"/>
        <xsl:result-document href="{concat('output/',$file-name,'.xml')}">
            <TEI xmlns="http://www.tei-c.org/ns/1.0">
                <xsl:apply-templates/>
            </TEI>
        </xsl:result-document>
    </xsl:template>
    
    <!-- identity transform -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- ignore nulls -->
    <xsl:template match="TEI/*[self::node()[matches(.,'null')]]"/>
</xsl:stylesheet>