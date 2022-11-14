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

		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
			<soapenv:Header/>
			<soapenv:Body>
				<brm:berekenIit xmlns:brm="http://brm.poc.iit.belastingdienst.nl">
					<rsiitMsg>
						<request belastingjaar="2021" berichtId="12234324">
							<test>
								<woonplaats><xsl:value-of select="$woonplaats"/></woonplaats>
								<aowLeeftijdBehaald><xsl:value-of select="$leeftijd &gt;= 68"/></aowLeeftijdBehaald>
								<ouderDan21><xsl:value-of select="$leeftijd &gt;= 21"/></ouderDan21>
								<inkomenPerMaand><xsl:value-of select="$inkomen"/></inkomenPerMaand>
								<vermogen><xsl:value-of select="$vermogen"/></vermogen>
							</test>
						</request>
					</rsiitMsg>
				</brm:berekenIit>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>