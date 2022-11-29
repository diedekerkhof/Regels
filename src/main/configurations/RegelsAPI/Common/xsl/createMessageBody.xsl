<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
	
	<xsl:param name="count"/>

	<xsl:template match="/">
		<xsl:variable name="leeftijd" select="executionRequest/gegevens/leeftijd" />
		<xsl:variable name="woonplaats" select="executionRequest/gegevens/woonplaats" />
		<xsl:variable name="inkomen" select="executionRequest/gegevens/inkomen" />
		<xsl:variable name="vermogen" select="executionRequest/gegevens/vermogen" />

			<variables>
				<woonplaats><value><xsl:value-of select="$woonplaats"/></value><type>String</type></woonplaats>
				<leeftijd><value><xsl:value-of select="$leeftijd"/></value><type>Integer</type></leeftijd>
				<aowLeeftijdBehaald><value><xsl:value-of select="$leeftijd &gt;= 68"/></value><type>Boolean</type></aowLeeftijdBehaald>
				<ouderDan21><value><xsl:value-of select="$leeftijd &gt;= 21"/></value><type>Boolean</type></ouderDan21>
				<inkomenPerMaand><value><xsl:value-of select="$inkomen"/></value><type>Integer</type></inkomenPerMaand>
				<vermogen><value><xsl:value-of select="$vermogen"/></value><type>Integer</type></vermogen>
			</variables>
	</xsl:template>
</xsl:stylesheet>